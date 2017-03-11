# [Memory Networks 2015](https://arxiv.org/pdf/1410.3916.pdf)
Facebook AI research. Many machine learning models lack read/write capability to long term memory
- all memory is stored within hidden layers of the model, embedded by hidden states and weights
- RNNs can be used to try to learn for information and produce the next set of words to output after reading a stream of words
  - problem is that the knowledge is embedded within the NN itself and the capacity is relatively small
- RNNs work for memorization tasks, but they are not effective
- **memory networks** attempt to incorperate a long term memory component, and can be applied to question-answer tasks by building a knowledge base

### Memory Networks
Memory Networks have `m`, an array of objects, and four learned components:
- I: input feature map, maps inputs to internal feature representation 
- G: generalization used to update memory m, based on new input
- O: output feature map, produces a new output memory network, given the input and current memory state
- R: response function, converts output into a textual response or other desired output formats

A memory network takes some input `x`, `x` is a word, sentence, audio, image
- the input and output maps are internal representations of features, while input `x` and response `r` are more human-usable formats (again, sentences, images, audio)

1. convert x to internal representation: I(x)
2. update memory with generalization: m'<sub>i</sub> = G(m<sub>i</sub>, I(x), m), forall i
3. compute output features `o` given the new input and memory: o = O(I(x), m')
4. decode the output features `o` to give the response: r=R(o)

Components of the memory network can be composed of other learning algorithms.

Memory network applied to a set of problems 

LSTM looks at a sequence, are questions a sequence?
- a theoretically large LSTM could hold 

### A MemNN Implementation for Text
One implementation of a memory network where the components are neural networks
- most of the inference happens in O and R stages
- s<sub>O</sub> is a function that produces a score for the match between a pair of sentences x and m<sub>i</sub>
- we use the scoring function to figure out which memories are relevent to the input question `x`
- `k` number of supporting memories can be fetched, by applying s<sub>O</sub> to both `x`, and the previous `k-1` memories fetched
- U<sup>T</sup>U is sort of a distance metric (think dot product)

### LSTM
Specific RNN architecture, designed to learn from experience to classify and predict time series
- memory is tied to number of parameters

### [Pointer Network](https://arxiv.org/pdf/1506.03134.pdf)

### [Neural Turing Machine](https://arxiv.org/pdf/1410.5401.pdf)
Coupling neural networks with external memory resources
- constructs a system analogous to a Turing Machine or Von Neumann architecture
- motive, separate ability to store memories vs. number of parameters to train
