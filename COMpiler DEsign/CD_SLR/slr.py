'''
MY call sequence:

main():
Here user enters the string to be parsed and the feedback like: grammar rules are provided to user. Final result about if the string is successfully parsed or not, is also printed.


compute_I0():(calls augment grammer)
Here I0 is calculated separately using the rule 1 in new_grammar. The calculated I0 is stored in dictionary I_n with key as 0. So the dictionary I_n[0] represents state I0.

 augmented_grammar(): calls(read grammer)
Using the grammar list created in read_grammar(), it generates list of augmented grammar and creates new list called new_grammar.

read_grammar():
This function asks file where grammar is stored. It reads the file for grammar and starts insering it in list grammar. From the rules terminals and nonterminals are identified and stored in the lists named terminals and non_terminals respectively, where as rules are stored in the dictionary called rule_dict.


conflict():
Here, availability of conflict in the given grammar is analyzed. Stores each SR conflict in list SR and RR conflict in list RR. It returns True if there conflict else False.



'''

import copy

grammar = []
new_grammar = []
terminals = []
non_terminals = []
I_n = {}
shift_list = []
reduction_list = []
action_list = []
rule_dict = {}
follow_dict = {}
SR = []
RR = []


def read_grammar():
	global grammar, terminals, non_terminals, rule_dict

	file_name = input("Enter Grammar File Name:: ")

	# open given file
	try:
		grammar_file = open(file_name, "r")
	except:
		# grammar_file = open("grammar", "r")
		print "Cannot Find File Named", file_name
		exit(0)

	# add garmmar
	for each_grammar in grammar_file:
		grammar.append(each_grammar.strip())

		# find terminals
		if each_grammar[0] not in non_terminals:
			non_terminals.append(each_grammar[0])

	# find non terminals
	for each_grammar in grammar:
		for token in each_grammar.strip().replace(" ", "").replace("->", ""):
			if token not in non_terminals and token not in terminals:
				terminals.append(token)

	# generate dictionary of rules
	for l in range(1, len(grammar)+1):
		rule_dict[l] = grammar[l-1]
	# return grammar
	# print terminals

def augmented_grammar():
	global grammar, new_grammar
	read_grammar()

	# if non augmented grammar is given, augment it
	if "'" not in grammar[0]:
		grammar.insert(0, grammar[0][0]+"'"+"->"+grammar[0][0])

	# just add . infornt of each rule
	new_grammar = []
	for each_grammar in grammar:
		idx = each_grammar.index(">")
		# print each_grammar.split()
		each_grammar = each_grammar[:idx+1]+"."+each_grammar[idx+1:]
		new_grammar.append(each_grammar)
	# print new_grammar


def compute_I0():
	global new_grammar, non_terminals, I_n
	augmented_grammar()

	grammar2add = []

	# add first rule to I(0)
	grammar2add.append(new_grammar[0])
	i = 0

	# check for terminals in new_grammar[0]
	for each in grammar2add:
		current_pos = each.index(".")
		current_variable = each[current_pos+1]
		# print current_variable

		if current_variable in non_terminals:
			for each_grammar in new_grammar:
				if each_grammar[0] == current_variable and each_grammar not in grammar2add:
					grammar2add.append(each_grammar)

		I_n[i] = grammar2add #array of states
	# print grammar2add

def Conflict():
	global SR, RR, shift_list, reduction_list
	conflict = False
	# SR conflict if shift and Reduce occurs for same condition
	for S in shift_list:
		for R in reduction_list:
			if S[:2] == R[:2]:
				SR.append([S, R])
				conflict = True

	# RR conflict if 2 Reduce occurs for same condition
	for R1 in reduction_list:
		for R2 in reduction_list:
			if R1 == R2:
				continue

			if R1[:2] == R2[:2]:
				RR.append(R1)
				conflict = True

	return conflict


if __name__ == '__main__':
	main()

