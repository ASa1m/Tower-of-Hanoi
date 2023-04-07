# Tower of Hanoi Game in Assembly Language
This project is a game implementation of the classic Tower of Hanoi puzzle using Assembly language. The objective of the game is to move all the tiles from stack 1 to stack 3 using the available stacks, following specific rules.

## Getting Started
The game can be downloaded and played on an Assembly language simulator. The source code is provided in the main.asm file. It includes the irvine32.inc file and uses it to write console output.

## Game Rules
The game follows specific rules for moving tiles across the stacks:

The top tile of a stack can be moved to any of the other two stacks.
Only one tile can be moved at a time.
A larger tile cannot be placed on top of a smaller tile.
User Interface
The game's interface consists of the console output area, which displays the current state of the game board, and a prompt asking the user to enter the size of the stack (1-10). The game also displays instructions for the user, detailing how to move tiles across the stacks.

## Implementation Details
The game code is divided into several procedures:

- initializeGame: Initializes the game board with the specified number of tiles on the first stack.
- printstack: Prints the current state of the stack.
- updatestack: Updates the game board after a tile has been moved.
- checkWin: Checks whether the game has been won, i.e., all the tiles are on the third stack.

## Conclusion
This project is a fun and challenging way to practice Assembly language programming skills while also playing a classic puzzle game.
