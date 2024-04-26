# Check if the number is divisible by the number of digits of the number. If true, add each digit into the int variable "digit" and return this variable. Otherwise, return -1.
def harshadNumber(x: int) -> int:
    arr = list(str(x))
    if x%len(arr)==0:
        digit = 0
        for num in arr:
            digit += int(num)
        return digit
    else:
        return -1

print(harshadNumber(20))
print(harshadNumber(19))
print(harshadNumber(18))
