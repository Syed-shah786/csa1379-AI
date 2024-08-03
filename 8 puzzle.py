def print_in_format(matrix):
    for i in range(9):
        if i % 3 == 0 and i > 0:
            print("")
        print(str(matrix[i]) + " ", end="")
    print("")

def count(s):
    c = 0
    ideal = [1, 2, 3,
             4, 5, 6,
             7, 8, 0]
    for i in range(9):
        if s[i] != 0 and s[i] != ideal[i]:
            c += 1
    return c

def move(ar, p, st):
    rh = 999999
    store_st = st.copy()
    for i in range(len(ar)):
        dupl_st = st.copy()
        temp = dupl_st[p]
        dupl_st[p] = dupl_st[ar[i]]
        dupl_st[ar[i]] = temp
        tmp_rh = count(dupl_st)
        if tmp_rh < rh:
            rh = tmp_rh
            store_st = dupl_st.copy()
    return store_st, rh

state = [1, 2, 3, 
         0, 5, 6,
         4, 7, 8]
h = count(state)
cost = 0

print("\n------ Level 1 ------")
print_in_format(state)
print("Heuristic Value (Misplaced):", h)
print("Cost (Number of Moves):", cost)

while h > 0:
    pos = state.index(0)
    cost += 1
    Level = cost + 1
    if pos == 0:
        arr = [1, 3]
    elif pos == 1:
        arr = [0, 2, 4]
    elif pos == 2:
        arr = [1, 5]
    elif pos == 3:
        arr = [0, 4, 6]
    elif pos == 4:
        arr = [1, 3, 5, 7]
    elif pos == 5:
        arr = [2, 4, 8]
    elif pos == 6:
        arr = [3, 7]
    elif pos == 7:
        arr = [4, 6, 8]
    elif pos == 8:
        arr = [5, 7]
    
    state, h = move(arr, pos, state)
    
    print("\n------ Level", Level, "------")
    print_in_format(state)
    print("Heuristic Value (Misplaced):", h)
    print("Cost (Number of Moves):", cost)

print("\nTotal cost (Number of Moves to solve):", cost)
