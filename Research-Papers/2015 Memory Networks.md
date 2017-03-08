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

Components of the memory network can be composed of other learning algorithms.-
