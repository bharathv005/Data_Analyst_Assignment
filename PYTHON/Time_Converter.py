'''
1.Given number of minutes, convert it into human readable form.
Example :
130 becomes “2 hrs 10 minutes”
110 becomes “1hr 50minutes”
'''

minutes = 130
hours = minutes // 60
min = minutes % 60
print(f"{hours} hr {min} minutes")

