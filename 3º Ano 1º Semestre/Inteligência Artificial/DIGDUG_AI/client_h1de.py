"""Example client."""
import asyncio
import getpass
import json
import os
import pprint
import heapq

# Next 4 lines are not needed for AI agents, please remove them from your code!
from tree_search import SearchDomain,SearchProblem, SearchNode, SearchTree
import websockets
class DigDugDomain(SearchDomain):
    def __init__(self, map, rocks, enemies):
        self.map = map
        self.rocks = rocks
        self.enemies = enemies

    def actions(self, state):
        # Possible actions: move in four directions or attack
        return ["w", "a", "s", "d", "A"]

    def result(self, state, action):
        # Calculate the new state resulting from an action
        new_state = state.copy()
        x, y = state["digdug"]
        
        if action == "w":
            new_state["digdug"] = [x, y - 1]
        elif action == "a":
            new_state["digdug"] = [x - 1, y]
        elif action == "s":
            new_state["digdug"] = [x, y + 1]
        elif action == "d":
            new_state["digdug"] = [x + 1, y]
        # Implement the effect of the "A" action if needed

        # You may also want to update the positions of enemies or other game elements here
        return new_state

    def cost(self, state, action):
        # Define the cost of an action (you might want to consider different costs for different actions)
        return 1

    def heuristic(self, state, goal):
        # Example heuristic: Manhattan distance to the closest enemy
        digdug_pos = state["digdug"]
        closest_enemy = find_closest_enemy(digdug_pos, self.enemies)
        if closest_enemy:
            return abs(digdug_pos[0] - closest_enemy["pos"][0]) + abs(digdug_pos[1] - closest_enemy["pos"][1])
        return 0

    def satisfies(self, state, goal):
        # Define a condition to check if the goal is achieved
        # For example, check if all enemies are defeated
        return len(state["enemies"]) == 0
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
	return abs(start_pos[0]-end_pos[0]) + abs(start_pos[1]-end_pos[1])

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

def is_in_fire_range(digdug_pos, fygar):
		# Dá return a True se o digdug estiver dentro do range de fogo do fygar
		fire_zones = []
		if 'fire' in fygar:
			fire_zones = fygar.get('fire', [])
		return digdug_pos in fire_zones

def is_pooka_traverse(pooka):
	# verifica se o pooka vai levantar voo
	if 'traverse' in pooka and pooka.get('traverse', True):
		return True

def adaptive_strategy(digdug_pos, enemy, map):
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
	elif get_next_pos(enemy["pos"], direction=enemy["dir"]) in atk_range:
		enemy_will_appear = True

	return enemy_in_range, enemy_will_appear

def get_valid_move(digdug_pos, rocks):
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
	for move in possible_moves:
		if get_next_pos(digdug_pos, move) not in rocks:
			return move

def decide_move(digdug_pos,closest_enemy, map, direction,rocks):
	# Retorna o move que o digdug deve fazer
	if closest_enemy is None or digdug_pos is None:
		return ""
	
	closest_enemy_pos = closest_enemy["pos"]
	closest_enemy_dir = closest_enemy["dir"]
	x_distance = closest_enemy_pos[0] - digdug_pos[0]		# se for negativa quer dizer que o inimigo está atrás
	y_distance = closest_enemy_pos[1] - digdug_pos[1]		# se for negativa quer dizer que o inimigo está acima

	strategy = adaptive_strategy(digdug_pos, closest_enemy, map)
	move = None

	# When Fygar
	if strategy == "defensive":
		print("STRATEGY: DEFENSIVE")
		enemy_in_range, enemy_will_appear = is_safe_to_attack(digdug_pos, closest_enemy, direction, map)
		if enemy_in_range:
			move = attack_enemy()
		elif is_in_fire_range(digdug_pos,closest_enemy):
			if digdug_pos[1] <= 12:
				move = moveDOWN()
			else:
				move = moveUP()
		elif enemy_will_appear:
			move = ""
		else:
			if x_distance > 0 and get_next_pos(digdug_pos,"d") != closest_enemy_pos:
				move = moveRIGHT()
			elif x_distance < 0 and get_next_pos(digdug_pos,"a") != closest_enemy_pos:
				move = moveLEFT()
			elif y_distance > 0 :
				if y_distance == 1:
					move = moveUP()
				else:
					move = moveDOWN()
			elif y_distance < 0:
				if y_distance == -1:
					move = moveDOWN()
				else:
					move = moveUP()

	# When pooka traverse
	elif strategy == "escape":
		print("STRATEGY: ESCAPE")
		if closest_enemy_dir == 0:
			move = moveUP()
		elif closest_enemy_dir == 1:
			move = moveRIGHT()
		elif closest_enemy_dir == 2:
			move = moveDOWN()
		elif closest_enemy_dir == 3:
			move = moveLEFT()
			
	# When pooka
	else:
		print("DEFAULT STRATEGY")
		enemy_in_range, enemy_will_appear = is_safe_to_attack(digdug_pos, closest_enemy, direction, map)
		if enemy_in_range:
			move = attack_enemy()
		elif enemy_will_appear:
			move = ""
		elif heuristic(digdug_pos, closest_enemy_pos) < 15:
			if abs(x_distance) > abs(y_distance):
				if x_distance > 0 and get_next_pos(digdug_pos, "d") != closest_enemy_pos:
					if x_distance != 1 and closest_enemy_dir != 3:
						move = moveRIGHT()
					else:
						move = moveLEFT()

				elif x_distance < 0 and get_next_pos(digdug_pos, "a") != closest_enemy_pos:
					if x_distance != -1 and closest_enemy_dir != 1:
						move = moveLEFT()
					else:
						move = moveRIGHT()
			else:
				if y_distance > 0 and get_next_pos(digdug_pos, "s") != closest_enemy_pos:
					if y_distance != 1 and closest_enemy_dir != 0:
						move = moveDOWN()
					else:
						move = moveUP()

				elif y_distance < 0 and get_next_pos(digdug_pos, "w") != closest_enemy_pos:
					if y_distance != -1 and closest_enemy_dir != 2:
						move = moveUP()
					else:
						move = moveDOWN()
		else:
			# movimento horizontal
			if abs(x_distance) > abs(y_distance):
				if x_distance > 0 and get_next_pos(digdug_pos, "d") != closest_enemy_pos:
					move = moveRIGHT()
				elif x_distance < 0 and get_next_pos(digdug_pos, "a") != closest_enemy_pos:
					move = moveLEFT()

			else:
				if y_distance > 0 and get_next_pos(digdug_pos, "s") != closest_enemy_pos:
					move = moveDOWN()
				elif y_distance < 0 and get_next_pos(digdug_pos, "w") != closest_enemy_pos:
					move = moveUP()

	if is_valid_move(digdug_pos, rocks, move):
		return move
	return get_valid_move(digdug_pos, rocks)



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
				pprint.pprint(state)

				digdug_pos = state.get("digdug")	# posição do digdug: digdug_pos = [x,y]
				enemies = state.get("enemies")	# lista com um dicionário para cada inimigo
				rocks_dic = state.get("rocks")
				rocks = [rock["pos"] for rock in rocks_dic] if rocks_dic is not None else [] 	# lista com posições de cada rocha
				

				closest_enemy = find_closest_enemy(digdug_pos, enemies)
				check_move = decide_move(digdug_pos,closest_enemy, initial_map, direction,rocks)
				
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