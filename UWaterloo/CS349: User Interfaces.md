# [User Interfaces](https://www.student.cs.uwaterloo.ca/~cs349/w18/)

### Summary
- batch, conversational, graphical are interface types

### [History](https://www.student.cs.uwaterloo.ca/~cs349/w18/lectures/1.2%20History.pdf)
Express intention ot controller, translates to change model, view presents to person to perceive
- **interface** is what's presented to the user
- **interactions** are the sequence of actions a person expresses
- batch interfaces are like punch cards
- conversational interfaces get feedback during execution, CLI
- GUI
- Recognition over Recall enables discovery of new options

### [Windowing system](https://www.student.cs.uwaterloo.ca/~cs349/w18/lectures/1.3%20Windowing%20Systems.pdf)
Handles I/O, where output is drawing graphically. Provides "low level" input, output and window management capabilities to the OS
- **X Windows** is the standard system for `*nix`
- essentially a protocol 

Design Criteria
- display independent
- device independent
- network transparent
- support multiple displays
- overlapping, resizable windows
- extensible

X Client-server architecture
- separate the UI from the application 
- typiclaly runs on an event loop

### [Drawing](https://www.student.cs.uwaterloo.ca/~cs349/w18/lectures/1.4%20Drawing.pdf)
0,0 is top left

3 Drawing primatives: pixel, stroke and ergion

**Graphics Context(GC)** holds all options in a structure and is passed to the draw routine
