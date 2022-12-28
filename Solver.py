#Used to automate the solution
import pyautogui
import time

delay=0

def tower_of_hanoi(disks, source, auxiliary, target):  
    if(disks == 1):  
        if source == 'A' and target == 'B':
            pyautogui.write('a', interval=delay)
        elif source == 'A' and target == 'C':
            pyautogui.write('d', interval=delay)
        elif source == 'B' and target == 'A':
            pyautogui.write('q', interval=delay)
        elif source == 'B' and target == 'C':
            pyautogui.write('s', interval=delay)
        elif source == 'C' and target == 'A':
            pyautogui.write('e', interval=delay)
        elif source == 'C' and target == 'B':
            pyautogui.write('w', interval=delay)
        return  
    # function call itself  
    tower_of_hanoi(disks - 1, source, target, auxiliary)  
    if source == 'A' and target == 'B':
            pyautogui.write('a', interval=delay)
    elif source == 'A' and target == 'C':
        pyautogui.write('d', interval=delay)
    elif source == 'B' and target == 'A':
        pyautogui.write('q', interval=delay)
    elif source == 'B' and target == 'C':
        pyautogui.write('s', interval=delay)
    elif source == 'C' and target == 'A':
        pyautogui.write('e', interval=delay)
    elif source == 'C' and target == 'B':
        pyautogui.write('w', interval=delay)
    tower_of_hanoi(disks - 1, auxiliary, source, target)  
  
  
disks = int(input('Enter the number of disks: '))  
# We are referring source as A, auxiliary as B, and target as C  
time.sleep(5) #Time delay to open the window of game
tower_of_hanoi(disks, 'A', 'B', 'C')  # Calling the function  
