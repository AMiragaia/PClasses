"""Example client."""
import asyncio
import getpass
import json
import os
import pprint
import heapq
import math
import random
# Next 4 lines are not needed for AI agents, please remove them from your code!

import websockets

def attack_enemy():
	return "A"
def moveUP():
	return "w"
def moveDOWN():
	return "s"
def moveLEFT():
	return "a"
def moveRIGHT():
	return "d"


def is_valid_move(digdug_pos, rocks, move):
	if digdug_pos is None or move is None:
		return None

	if move is "":
		return True

	x = digdug_pos[0]
	y = digdug_pos[1]
	if (x == 0 and move == "a") or (x == 47 and move == "d" ) or (y == 0 and move == "w") or (y == 23 and move == "s"):
		return False
	elif(get_next_pos(digdug_pos, move) in rocks):
		return False
	else:
		return True

def get_next_pos(current_pos, move=None, direction=None):
	x, y = current_pos
	if move == "w" or direction == 0:
		return [x, y - 1]
	elif move == "a" or direction == 3:
		return [x - 1, y]
	elif move == "s" or direction == 2:
		return [x, y + 1]
	elif move == "d" or direction == 1:
		return [x + 1, y]
	else:
		return current_pos

def get_dir(move,last_dir=None):
	if move == "w":
		return 0
	elif move == "d":
		return 1
	elif move == "s":
		return 2
	elif move == "a":
		return 3
	else:
		return last_dir

def refresh_map(current_pos, move, map):
	next_pos = get_next_pos(current_pos, move)
	map[next_pos[0]][next_pos[1]] = 0

def heuristic(start_pos, end_pos):
	return math.sqrt((start_pos[0]-end_pos[0])**2 + (start_pos[1]-end_pos[1])**2)
	# return abs(start_pos[0]-end_pos[0]) + abs(start_pos[1]-end_pos[1])

def find_closest_enemy(digdug_pos, enemies):
	if enemies == [] or digdug_pos is None:
		return None, None
	elif len(enemies) == 1:
		distance = heuristic(digdug_pos, enemies[0]["pos"])
		return enemies[0], distance
	closest_distance = 100000
	closest_enemy = None

	for enemy in enemies:

		distance = heuristic(digdug_pos, enemy["pos"])
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy

	return closest_enemy, closest_distance

def is_in_fire_range(digdug_pos, enemies):
	# Dá return a True se o digdug estiver dentro do range de fogo do fygar
	fire_zones = [attack_range(enemy["pos"], enemy["dir"]) for enemy in enemies if enemy["name"] == "Fygar"]
	return digdug_pos in fire_zones

def is_pooka_traverse(pooka):
	# verifica se o pooka vai levantar voo
	if 'traverse' in pooka:
		return True
	return False

def attack_range(digdug_pos, digdug_dir):
	if digdug_dir == 0:
		atk_range = [[digdug_pos[0],digdug_pos[1]-1], [digdug_pos[0],digdug_pos[1]-2], [digdug_pos[0],digdug_pos[1]-3]]
	elif digdug_dir == 1:
		atk_range = [[digdug_pos[0]+1,digdug_pos[1]], [digdug_pos[0]+2,digdug_pos[1]], [digdug_pos[0]+3,digdug_pos[1]]]
	elif digdug_dir == 2:
		atk_range = [[digdug_pos[0],digdug_pos[1]+1], [digdug_pos[0],digdug_pos[1]+2], [digdug_pos[0],digdug_pos[1]+3]]
	elif digdug_dir == 3:
		atk_range = [[digdug_pos[0]-1,digdug_pos[1]], [digdug_pos[0]-2,digdug_pos[1]], [digdug_pos[0]-3,digdug_pos[1]]]
	else:
		atk_range = []

	return atk_range

def is_safe_to_attack(digdug_pos, enemy, digdug_dir, map):
	atk_range = attack_range(digdug_pos, digdug_dir)

	enemy_in_range = False
	enemy_will_appear = False
	if enemy["pos"] in atk_range:
		i=0
		for pos in atk_range:
			if (0 <= pos[0] <= 47) and (0 <= pos[1] <= 23):
				if map[pos[0]][pos[1]] != 0:
					break
				if pos == enemy["pos"] and i != 1:
					enemy_in_range = True
					break
				i += 1
	if get_next_pos(enemy["pos"], direction=enemy["dir"]) in atk_range:
		enemy_will_appear = True

	return enemy_in_range, enemy_will_appear

def adaptive_strategy(enemy):
		# Adjust strategy based on the types of nearby enemies
	if enemy['name'] == "Fygar":
		return "defensive"
	elif enemy["name"] == "Pooka" and is_pooka_traverse(enemy):
		return "escape"
	
	return "default_strategy"

def get_valid_move(digdug_pos, digdug_dir, enemies, rocks, enemy_positions):
	x = digdug_pos[0]
	y = digdug_pos[1]
	corners = [[0,0],[47,0],[0,23],[47,23]]
	print("[GET VALID MOVE] DIGDUG POS: ",digdug_pos)
	print("[GET VALID MOVE] DIGDUG DIR: ",digdug_dir)
	if digdug_pos in corners:
		if digdug_dir == 0:
			if digdug_pos == corners[0]:
				return moveRIGHT()
			if digdug_pos == corners[1]:
				return moveLEFT()
		elif digdug_dir == 2:
			if digdug_pos == corners[2]:
				return moveRIGHT()
			if digdug_pos == corners[3]:
				return moveLEFT()
	elif x == 0 or x == 47:
		if y <= 12:
			return moveDOWN()
		return moveUP()
	elif y == 0 or y == 23:
		if x <= 24:
			return moveRIGHT()
		return moveLEFT()
	
	possible_moves = [moveUP(), moveLEFT(), moveRIGHT(), moveDOWN()]
	for move in possible_moves:
		next_pos = get_next_pos(digdug_pos, move)
		if next_pos not in rocks and next_pos not in enemy_positions and not is_in_fire_range(next_pos, enemies):
			return move
	return random.choice(possible_moves)

def decide_move(digdug_pos, enemies, map, direction, rocks):
	# Retorna o move que o digdug deve fazer
	if digdug_pos is None:
		return ""
	closest_enemy, distance = find_closest_enemy(digdug_pos, enemies)

	if closest_enemy is None:
		return ""

	closest_enemy_pos = closest_enemy["pos"]
	closest_enemy_dir = closest_enemy["dir"]
	x_distance = closest_enemy_pos[0] - digdug_pos[0]		# se for negativa quer dizer que o inimigo está atrás
	y_distance = closest_enemy_pos[1] - digdug_pos[1]		# se for negativa quer dizer que o inimigo está acima

	enemy_positions = [enemy["pos"] for enemy in enemies]
	enemy_in_range, enemy_will_appear = is_safe_to_attack(digdug_pos, closest_enemy, direction, map)
	strategy = adaptive_strategy(closest_enemy)
	move = None

	# When Fygar
	if strategy == "defensive":
		print("STRATEGY: DEFENSIVE")
		if enemy_in_range:
			move = attack_enemy()
		elif enemy_will_appear:
			move = ""
		else:
			if x_distance > 0:
				move = moveRIGHT()
			elif x_distance < 0 :
				move = moveLEFT()
			elif y_distance == 1 or y_distance < -1:
				if closest_enemy_dir == 2 and y_distance > -3:
					move = moveDOWN()
				else:
					move = moveUP()
			elif y_distance == -1 or y_distance > 1:
				if closest_enemy_dir == 0 and y_distance < 3:
					move = moveUP()
				else:
					move = moveDOWN()

	#When pooka traverse
	# elif strategy == "escape":
	# 	print("STRATEGY: ESCAPE")
	# 	if enemy_in_range:
	# 		move = attack_enemy()
	# 	elif distance < 3:
	# 		if closest_enemy_dir == 0:
	# 			move = moveDOWN()
	# 		elif closest_enemy_dir == 1:
	# 			move = moveLEFT()
	# 		elif closest_enemy_dir == 2:
	# 			move = moveUP()
	# 		elif closest_enemy_dir == 3:
	# 			move = moveRIGHT()
	# 	elif distance < 11:
	# 		if closest_enemy_dir == 0:
	# 			move = moveUP()
	# 		elif closest_enemy_dir == 1:
	# 			move = moveRIGHT()
	# 		elif closest_enemy_dir == 2:
	# 			move = moveDOWN()
	# 		elif closest_enemy_dir == 3:
	# 			move = moveLEFT()
	# 	else:
	# 		move = ""
	elif strategy == "escape":
		print("STRATEGY: ESCAPE")
		if enemy_in_range:
			move = attack_enemy()
		elif distance < 10:
			if distance < 3:
				if closest_enemy_dir == 0:
					move = moveDOWN()
				elif closest_enemy_dir == 1:
					move = moveLEFT()
				elif closest_enemy_dir == 2:
					move = moveUP()
				elif closest_enemy_dir == 3:
					move = moveRIGHT()
			else:
				if closest_enemy_dir == 0:
					move = moveUP()
				elif closest_enemy_dir == 1:
					move = moveRIGHT()
				elif closest_enemy_dir == 2:
					move = moveDOWN()
				elif closest_enemy_dir == 3:
					move = moveLEFT()
		else:
			move = ""
			
	# When pooka
	else:
		print("DEFAULT STRATEGY")
		if enemy_in_range:
			move = attack_enemy()
		elif enemy_will_appear:
			move = ""
		elif distance < 6:
			if abs(x_distance) > abs(y_distance):
				if x_distance > 0:
					if x_distance != 1 and closest_enemy_dir != 3:
						move = moveRIGHT()
					else:
						move = moveLEFT()

				elif x_distance < 0:
					if x_distance != -1 and closest_enemy_dir != 1:
						move = moveLEFT()
					else:
						move = moveRIGHT()
			else:
				if y_distance > 0:
					if y_distance != 1 and closest_enemy_dir != 0:
						move = moveDOWN()
					else:
						move = moveUP()

				elif y_distance < 0:
					if y_distance != -1 and closest_enemy_dir != 2:
						move = moveUP()
					else:
						move = moveDOWN()
		else:
			# movimento horizontal
			if abs(x_distance) > abs(y_distance):
				if x_distance > 0:
					move = moveRIGHT()
				elif x_distance < 0:
					move = moveLEFT()
			else:
				if y_distance > 0:
					move = moveDOWN()
				elif y_distance < 0:
					move = moveUP()

	next_pos = get_next_pos(digdug_pos, move)
	if is_valid_move(digdug_pos, rocks, move) and next_pos not in enemy_positions and not is_in_fire_range(next_pos, enemies):
		refresh_map(digdug_pos, move, map)
		return move
	return get_valid_move(digdug_pos, direction, enemies, rocks, enemy_positions)


async def agent_loop(server_address="localhost:8000", agent_name="student"):
	"""Example client loop."""
	direction = 1
	async with websockets.connect(f"ws://{server_address}/player") as websocket:
		# Receive information about static game properties
		await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))

		while True:
			try:
				state = json.loads(
					await websocket.recv()
				)  # receive game update, this must be called timely or your game will get out of sync with the server

				if state.get("map") != None:
					# print(state)
					initial_map = state["map"]		# map[x][y] x -> eixo horizontal, y -> eixo vertical
				# pprint.pprint(state)

				digdug_pos = state.get("digdug")	# posição do digdug: digdug_pos = [x,y]
				enemies = state.get("enemies")	# lista com um dicionário para cada inimigo
				rocks_dic = state.get("rocks")
				rocks = [rock["pos"] for rock in rocks_dic] if rocks_dic is not None else [] 	# lista com posições de cada rocha
				
				move = decide_move(digdug_pos, enemies, initial_map, direction, rocks)
				direction = get_dir(move,direction)
					
				await websocket.send(
					json.dumps({"cmd": "key", "key": move})
					)  # send key command to server - you must implement this send in the AI agent
			except websockets.exceptions.ConnectionClosedOK:
				print("Server has cleanly disconnected us")
				return


# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))
