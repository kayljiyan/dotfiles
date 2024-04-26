# Store the length of the int list "x" to a variable "length". Remove the last element of the array. Initialize a boolean variable "jump". Set jump to true if the number inside the list x can reach or exceed the length of the array. Otherwise, set jump to false. Return the value of jump.
def can_jump(x: list[int]) -> bool:
    length = len(x)
    x.pop()
    jump = True
    for i,num in enumerate(x):
        if (num+i+1)>=length:
            jump=True
        else:
            jump=False
    return jump

print(can_jump([2,3,1,1,4]))
print(can_jump([3,2,1,0,4]))
print(can_jump([1,1,1,2,1]))
print(can_jump([1,1,1,1,1,5,6,7,10,1,5]))
