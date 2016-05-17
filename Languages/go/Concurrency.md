# Go Concurrency
Basic info in [README](./README.md#concurrency). Sourced from this [cool Visualization of Go Concurrency](http://divan.github.io/posts/go_concurrency_visualize/).

### Goroutine blocking
- goroutines block, and wait for a value, when `myChannel <- someValue` a channel is waiting to receive.
- A FIFO queue is formed when multiple goroutines are waiting to recieve from a single channel
- if all goroutines are currently blocked, go will throw an error message `fatal error: all goroutines are asleep`

- goroutines also block after sending a value, and unblock once it is recieved by a channel receiver

### Fan-in Design Pattern
Fan-in is a function reading from multiple inputs and multiplexing all into a single channel 
- (good for a messaging app where order of messages should be consistent across all participants)
  - multiplexing works from a `range` loop 
  
Here, producers run concurrently while the reader, also concurrent, waits to recieve using a `range` loop.
```go
package main

import (
    "fmt"
    "time"
)

func producer(ch chan int, d time.Duration) {
    var i int
    for {
        ch <- i
        i++
        time.Sleep(d)
    }
}

func reader(out chan int) {
    for x := range out {
        fmt.Println(x)
    }
}

func main() {
    ch := make(chan int)
    out := make(chan int)
    go producer(ch, 100*time.Millisecond)
    go producer(ch, 250*time.Millisecond)
    go reader(out)
    for i := range ch { // multiplexing the integers being sent to `ch` channel, sending them to reader
        out <- i
    }
}
```
![visualization of code](http://divan.github.io/demos/gifs/fanin.gif)

### Workers (fan-out design pattern)
Opposite of fan-in, multiple goroutines read from a single channel, distributing work between CPU cores. The following is an animation of 36 workers, where `GOMAXPROCS=4` (effectively only 4 goroutines in parallel):
![36 go workers](http://divan.github.io/demos/gifs/workers.gif)

### Servers design pattern
Similar to fan-out, goroutines are spawned for short period of time to complete a task. 
- listener runs `accept()` in a loop and starts goroutine for each accepted connection
