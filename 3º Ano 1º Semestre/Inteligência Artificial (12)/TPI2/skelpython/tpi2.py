#encoding: utf8

# YOUR NAME: ANDRÉ MIRAGAIA RODRIGUES
# YOUR NUMBER: 108412

# COLLEAGUES WITH WHOM YOU DISCUSSED THIS ASSIGNMENT (names, numbers):
# - João Rodrigues 108214
# - Fábio Alves 108016
# - Guilherme Duarte 107766
# - Guilherme Andrade 107696

from semantic_network import *
from constraintsearch import *

class MySN(SemanticNetwork):

    def __init__(self):
        SemanticNetwork.__init__(self)
        # ADD CODE HERE IF NEEDED
        pass

    def query_local(self, user=None, e1=None, rel=None, e2=None):
        self.query_result = []
        for decl_user, user_relations in self.declarations.items():
            if user is None or user == decl_user:
                for (entity1, relation), entity2 in user_relations.items():
                    if (e1 is None or e1 == entity1) and \
                       (rel is None or rel == relation) and \
                       (e2 is None or e2 == entity2):
                        self.query_result.append(Declaration(decl_user, Relation(entity1, relation, entity2)))
        return self.query_result


    def query(self, entity, assoc=None):
        decl = self.query_local(e1=entity, rel=assoc)
        related_entities = [d.relation.entity2 for d in self.query_local(e1=entity)]
        for a in related_entities:
            decl += self.query(a, assoc=assoc)

        self.query_result = []
        for d in decl:
            if d.relation.name not in ['subtype', 'member']:
                d.relation.entity2 = list(d.relation.entity2)[0] if isinstance(d.relation.entity2, set) else d.relation.entity2
                self.query_result.append(d)

        return self.query_result


       

    def update_assoc_stats(self, assoc, user=None):
        if not hasattr(self, 'assoc_stats'):
            self.assoc_stats = {}


        def get_immediate_type(entity):
            for d in self.query_local(e1=entity, rel="member"):
                return d.relation.entity2  
            return None 

        def update_stats_for_entity(entities, stats):
            for entity in entities:
                if isinstance(entity, set):
                    for e in entity:  # Iterate over each element in the set
                        type = get_immediate_type(e)
                        stats[type] = stats.get(type, 0) + 1
                else:
                    type = get_immediate_type(entity)
                    stats[type] = stats.get(type, 0) + 1
                

        relevant_decls = self.query_local(user=user, rel=assoc)
        entities1 = [decl.relation.entity1 for decl in relevant_decls]
        entities2 = [decl.relation.entity2 for decl in relevant_decls]

        stats_e1 = {}
        stats_e2 = {}
        update_stats_for_entity(entities1, stats_e1)
        update_stats_for_entity(entities2, stats_e2)

        def calc_freqs(type_counts):
            total = sum(type_counts.values())
            unknown = type_counts.get(None, 0)
            total_adjusted = total - unknown + (unknown ** 0.5)
            return {t: count / total_adjusted for t, count in type_counts.items() if t is not None}

        freqs_e1 = calc_freqs(stats_e1)
        freqs_e2 = calc_freqs(stats_e2)

        key = (assoc, user)
        self.assoc_stats[key] = (freqs_e1, freqs_e2)







class MyCS(ConstraintSearch):

    def __init__(self,domains,constraints):
        ConstraintSearch.__init__(self,domains,constraints)
        # ADD CODE HERE IF NEEDED
        pass

    def search_all(self):
        solutions = []
        assignments = {}

        def choose_unassigned_var():
            
            unassigned = [v for v in self.domains if v not in assignments]
            if not unassigned:
                return None
            mrv = min(unassigned, key=lambda var: len(self.domains[var]))
            degree = max(unassigned, key=lambda var: sum(1 for v in unassigned if (v, var) in self.constraints or (var, v) in self.constraints))
            return mrv if len(self.domains[mrv]) < len(self.domains[degree]) else degree

        def is_assignment_consistent(variable, value):
            temp_assignment = assignments.copy()
            temp_assignment[variable] = value
            for (var1, var2), constraint_func in self.constraints.items():
                if (var1 == variable and var2 in temp_assignment) or (var2 == variable and var1 in temp_assignment):
                    if not constraint_func(var1, temp_assignment.get(var1), var2, temp_assignment.get(var2)):
                        return False
            return True

        def recursive_backtrack():
            if len(assignments) == len(self.domains):
                solutions.append(assignments.copy())
                return

            var = choose_unassigned_var()
            for val in self.domains[var]:
                if is_assignment_consistent(var, val):
                    assignments[var] = val
                    recursive_backtrack()
                    del assignments[var]

        recursive_backtrack()
        return solutions                      

