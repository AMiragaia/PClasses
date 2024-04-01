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
		return None
	elif len(enemies) == 1:
		return enemies[0]
	closest_distance = 100000
	closest_enemy = None

	for enemy in enemies:

		distance = heuristic(digdug_pos, enemy["pos"])
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy

	return closest_enemy

def is_in_fire_range(digdug_pos, enemies):
	# Dá return a True se o digdug estiver dentro do range de fogo do fygar
	fire_zones = [enemy.get("fire", []) for enemy in enemies if enemy["name"] == "Fygar"]
	return digdug_pos in fire_zones

def is_pooka_traverse(pooka):
	# verifica se o pooka vai levantar voo
	if 'traverse' in pooka and pooka.get('traverse', True):
		return True

def adaptive_strategy(digdug, enemy, map):
		# Adjust strategy based on the types of nearby enemies
	if enemy['name'] == "Fygar":
		return "defensive"
	elif enemy["name"] == "Pooka" and is_pooka_traverse(enemy):
		return "escape"
	
	return "default_strategy"

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

def identify_caves(map):
	# Initialize an empty list to store the caves
	caves = []
	# Initialize a set to store the visited positions
	visited = set()

	# Define the directions for DFS
	directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

	# Define the DFS function
	def dfs(i, j, cave):
		# If the position is out of bounds or has been visited, return
		if i < 0 or i >= len(map) or j < 0 or j >= len(map[0]) or (i, j) in visited or j in [0,1]:
			return
		# If the cell is not a cave, return
		if map[i][j] != 0:
			return
		# Mark the position as visited
		visited.add((i, j))
		# Add the position to the cave
		cave.append((i, j))
		# Perform DFS on the neighboring cells
		for di, dj in directions:
			dfs(i + di, j + dj, cave)

	# Iterate over the map
	for i in range(len(map)):
		for j in range(len(map[i])):
			# If the cell is a cave and has not been visited, perform DFS
			if map[i][j] == 0 and (i, j) not in visited:
				cave = []
				dfs(i, j, cave)
				if cave:
					caves.append(cave)

	# Return the list of caves
	return caves

def find_closest_cave(digdug_pos, caves):
	if digdug_pos is None:
		return None
	closest_cave = None
	min_distance = float('inf')

	for cave in caves:
		for cave_position in [cave[0], cave[-1]]:  # only consider the entry and exit of the cave
			distance = heuristic(digdug_pos,cave_position)
			if distance < min_distance:
				min_distance = distance
				closest_cave = cave

	return closest_cave

def get_valid_move(digdug_pos, enemies, rocks, enemy_positions):
	x = digdug_pos[0]
	y = digdug_pos[1]
	if x == 0 or x == 47:
		if y <= 12:
			return moveDOWN()
		return moveUP()
	if y == 0 or y == 23:
		if x <= 24:
			return moveRIGHT()
		return moveLEFT()
	
	possible_moves = [moveUP(), moveRIGHT(), moveDOWN(), moveLEFT()]
	random.shuffle(possible_moves)
	for move in possible_moves:
		next_pos = get_next_pos(digdug_pos, move)
		if next_pos not in rocks and next_pos not in enemy_positions and not is_in_fire_range(next_pos, enemies):
			return move

def decide_move(digdug_pos, enemies, closest_enemy, map, direction, rocks, closest_cave):
	# Retorna o move que o digdug deve fazer
	if closest_enemy is None or digdug_pos is None:
		return ""
	
	enemy_positions = [enemy["pos"] for enemy in enemies]
	# caves = identify_caves(map)
	# print("TESTE CAVES: ", caves)
	closest_cave_pos = closest_cave[0] if abs(closest_cave[0][0] - digdug_pos[0]) + abs(closest_cave[0][1] - digdug_pos[1]) < abs(closest_cave[-1][0] - digdug_pos[0]) + abs(closest_cave[-1][1] - digdug_pos[1]) else closest_cave[-1]
	cave_x_distance = closest_cave_pos[0] - digdug_pos[0]
	cave_y_distance = closest_cave_pos[1] - digdug_pos[1]

	closest_enemy_pos = closest_enemy["pos"]
	closest_enemy_dir = closest_enemy["dir"]
	x_distance = closest_enemy_pos[0] - digdug_pos[0]		# se for negativa quer dizer que o inimigo está atrás
	y_distance = closest_enemy_pos[1] - digdug_pos[1]		# se for negativa quer dizer que o inimigo está acima
	distance = heuristic(digdug_pos, closest_enemy_pos)
	strategy = adaptive_strategy(digdug_pos, closest_enemy, map)
	move = None

	# if digdug_pos not in closest_cave:
	# 	if cave_x_distance > 0:
	# 		move = moveRIGHT()
	# 	elif cave_x_distance < 0:
	# 		move = moveLEFT()
	# 	elif cave_y_distance > 0:
	# 		move = moveDOWN()
	# 	elif cave_y_distance < 0:
	# 		move = moveUP()
	# elif digdug_pos in [closest_cave[0], closest_cave[-1]]:
	# 	if distance > 3:  # if there is an enemy within a range of 2
	# 		return ""  # make DigDug wait
	# When Fygar
	if strategy == "defensive":
		print("STRATEGY: DEFENSIVE")
		enemy_in_range, enemy_will_appear = is_safe_to_attack(digdug_pos, closest_enemy, direction, map)
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
			# if x_distance > 0 and get_next_pos(digdug_pos,"d") != closest_enemy_pos:
			# 	move = moveRIGHT()
			# elif x_distance < 0 and get_next_pos(digdug_pos,"a") != closest_enemy_pos:
			# 	move = moveLEFT()
			# elif y_distance > 0 :
			# 	if y_distance == 1:
			# 		move = moveUP()
			# 	else:
			# 		move = moveDOWN()
			# elif y_distance < 0:
			# 	if y_distance == -1:
			# 		move = moveDOWN()
			# 	else:
			# 		move = moveUP()

	# When pooka traverse
	elif strategy == "escape":
		print("STRATEGY: ESCAPE")
		if distance < 10:
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
		enemy_in_range, enemy_will_appear = is_safe_to_attack(digdug_pos, closest_enemy, direction, map)
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
		return move
	return get_valid_move(digdug_pos, enemies, rocks, enemy_positions)



async def agent_loop(server_address="localhost:8000", agent_name="student"):
	"""Example client loop."""
	i = 0
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
					print(state)
					initial_map = state["map"]		# map[x][y] x -> eixo horizontal, y -> eixo vertical
					caves = identify_caves(initial_map)
				pprint.pprint(state)

				digdug_pos = state.get("digdug")	# posição do digdug: digdug_pos = [x,y]
				enemies = state.get("enemies")	# lista com um dicionário para cada inimigo
				rocks_dic = state.get("rocks")
				rocks = [rock["pos"] for rock in rocks_dic] if rocks_dic is not None else [] 	# lista com posições de cada rocha
				closest_cave = find_closest_cave(digdug_pos, caves)

				closest_enemy = find_closest_enemy(digdug_pos, enemies)
				check_move = decide_move(digdug_pos,enemies,closest_enemy, initial_map, direction,rocks, closest_cave)
				
				if is_valid_move(digdug_pos, rocks, check_move):
					move = check_move
					direction = get_dir(move,direction)
					print("TICK: ", i, "MOVE: ", move,"DIRECTION: ", direction)
					refresh_map(digdug_pos,move,initial_map)

					await websocket.send(
						json.dumps({"cmd": "key", "key": move})
						)  # send key command to server - you must implement this send in the AI agent
				i += 1
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