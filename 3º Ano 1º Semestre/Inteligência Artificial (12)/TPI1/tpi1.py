# STUDENT NAME: ANDRÉ MIRAGAIA RODRIGUES
# STUDENT NUMBER: 108412

# DISCUSSED TPI-1 WITH: (names and numbers): Guilherme Ferreira Duarte (107766), João Paulo Henriques Caetano Rodrigues (108214), Guilherme Chapelo Andrade (107696), Fábio Alves (108016) 

from tree_search import *
import math
class OrderDelivery(SearchDomain):

    def __init__(self,connections, coordinates):
        self.connections = connections
        self.coordinates = coordinates
        # ANY NEEDED CODE CAN BE ADDED HERE

    def actions(self, state):
        city, to_visit = state
        actlist = []
        for (C1, C2, D) in self.connections:
            if C1 == city:
                actlist += [(C1, C2)]
            elif C2 == city:
                actlist += [(C2, C1)]
        return actlist 

    def result(self, state, action):
        city, to_visit = state
        next_city = action[1] if action[0] == city else action[0]
        new_to_visit = to_visit.copy()
        if next_city in new_to_visit:
            new_to_visit.remove(next_city)
        return (next_city, new_to_visit)


    def satisfies(self, state, goal):
        city, to_visit = state
        return goal[0] == city and not to_visit

    def cost(self, state, action):
        for (C1, C2, D) in self.connections:
            if (C1, C2) == action or (C2, C1) == action:
                return D
        return float('inf')

    def heuristic(self, state, goal):
        city, to_visit = state
         
        if not goal:
            return 0  
        #distancia minima
        distances = [math.dist(self.coordinates[city], self.coordinates[target]) for target in goal]

        
        
        return min(distances)






 
class MyNode(SearchNode):

    def __init__(self, state, parent, cost=0, heuristic=0, depth=0, eval=None):
        super().__init__(state, parent)
        self.cost = cost               # custo acumulado
        self.heuristic = heuristic     # custo estimado pela distancia que calculamos antes
        self.depth = depth             # profundidade do nó
        self.eval = eval         # ação que foi tomada para chegar ao nó
        #considerei que aqui é guardada a informação que nos interessa relativa a cada nó


class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth',maxsize=None):
        super().__init__(problem,strategy) # inicia o construtor da classe searchtree (problem,root,open_nodes,strategy,solution,non_terminals)
        self.maxsize = maxsize # maxsize vai ser usado para limitar o tamanho da lista de nós abertos
        self.size = 1  # a contar com a root
        root = MyNode(problem.initial, None, depth=0, cost=0, heuristic=self.problem.domain.heuristic(problem.initial, self.problem.goal), eval=None)
        self.open_nodes = [root]
        self.terminals = 0
        #ADD HERE ANY CODE YOU NEED

    def astar_add_to_open(self, lnewnodes):
        lnewnodes = sorted(lnewnodes, key=lambda node: (node.eval, node.state))
        
        
        self.open_nodes.extend(lnewnodes)
        self.open_nodes = sorted(self.open_nodes, key=lambda node: (node.eval, node.state))


    def search2(self):
        while self.open_nodes != []:
            node = self.open_nodes.pop(0)
            self.size -= 1
            if self.problem.goal_test(node.state):
                self.solution = node
                self.terminals = len(self.open_nodes) + 1
                return self.get_path(node)
            self.non_terminals += 1
            lnewnodes = []
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state,a)
                if newstate not in self.get_path(node):
                    new_depth = node.depth + 1
                    action_cost = self.problem.domain.cost(node.state, a)
                    new_cost = node.cost + action_cost
                    new_heuristic = self.problem.domain.heuristic(newstate, self.problem.goal)
                    new_eval = new_cost + new_heuristic
                    newnode = MyNode(state=newstate, parent=node, depth=new_depth, cost=new_cost, heuristic=new_heuristic, eval=new_eval)
                    lnewnodes.append(newnode)
                    # Call manage_memory() if conditions are met
            #print("Strategy:", self.strategy)
            #print("Maxsize:", self.maxsize)
            #print("Current open nodes count:", len(self.open_nodes))
            #print("New nodes count:", len(lnewnodes))
            #print("Combined count:", len(self.open_nodes) + len(lnewnodes))
            self.size += len(lnewnodes)
            # a condição nem é chamada
            
            #print(self.size)
            if self.strategy == 'A*' and self.maxsize and self.size > self.maxsize:
                self.manage_memory()

            
            self.add_to_open(lnewnodes)
        
        
                    
        #IMPLEMENT HERE
        

    def manage_memory(self):
        
        self.open_nodes.sort(key=lambda node: (node.eval, -node.depth))
        
        
        def get_siblings(node):
            return [n for n in self.open_nodes if n.parent == node.parent]
        
        
        while len(self.open_nodes) > self.maxsize:
            
            node_to_delete = self.open_nodes[-1]
            siblings = get_siblings(node_to_delete)
            
            
            if all(sib in self.open_nodes[-len(siblings):] for sib in siblings):
                min_eval = min(sib.eval for sib in siblings)
                for sib in siblings:
                    self.open_nodes.remove(sib)
                    self.size -= 1
                    
                if node_to_delete.parent:  
                    node_to_delete.parent.eval = min_eval
                    self.open_nodes.append(node_to_delete.parent)
                    self.size += 1
            else:
                
                self.open_nodes.remove(node_to_delete)
                self.size -= 1

        

def orderdelivery_search(domain, city, targetcities, strategy='breadth', maxsize=None):
    # cria o problema de pesquisa
    
    initial_state = (city, targetcities.copy())
    problem = SearchProblem(domain=domain, initial=initial_state, goal=targetcities)


    
    
    tree = MyTree(problem, strategy=strategy, maxsize=maxsize)
    
    
    solution_path = tree.search2()

    return tree,solution_path
    
    
    
    


 

# If needed, auxiliary functions can be added here

