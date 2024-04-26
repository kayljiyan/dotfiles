# Only Goa and I knew the meaning of all these code. Now, only God knows.
def validParenthesis(s: str) -> bool:
    arr = list(s)
    temp = {}
    for i,ch in enumerate(arr):
        if ch == "(":
            for j,elem in enumerate(arr):
                if elem == ")":
                    temp[i]=j if j not in temp.values() else None
        elif ch == "{":
            for j,elem in enumerate(arr):
                if elem == "}":
                    temp[i]=j if j not in temp.values() else None
        elif ch == "[":
            for j,elem in enumerate(arr):
                if elem == "]":
                    temp[i]=j if j not in temp.values() else None
    return len(temp)!=0

print(validParenthesis("{[()]}"))
print(validParenthesis("(())[]{}"))
print(validParenthesis("{]"))
