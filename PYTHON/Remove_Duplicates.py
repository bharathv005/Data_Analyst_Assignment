'''
2.You are given a string, remove all the duplicates and print the unique string.Use loop in the python
'''

s = "programming"
result = ""
for ch in s:
    if ch not in result:
        result += ch
print(result)