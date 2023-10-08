number = int(input("Enter a number: "))
counter = 1
output = ""

while counter < number:
    if (counter % 3 == 0):
        output = output + "Fizz"
        
    if (counter % 5 == 0):
        output = output + "Buzz"
        
    if (output == ""):
        output = str(counter)
    
    print(output)    
    output = ""
    counter = counter + 1

