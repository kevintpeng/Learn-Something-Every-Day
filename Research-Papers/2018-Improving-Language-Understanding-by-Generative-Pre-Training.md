# [Improving Language Understanding: GPT](https://cdn.openai.com/research-covers/language-unsupervised/language_understanding_paper.pdf)

[Natural language understanding](https://en.wikipedia.org/wiki/Natural-language_understanding) is a problem space
- simple tasks like commands, to complex like comprehension of articles or passages.
- text/doc classification is an example, which can be done well by looking words without necessarily comprehending
- [textual entailment](https://en.wikipedia.org/wiki/Textual_entailment) is discerning the directional logical entailment of text fragments
- [question answering](https://en.wikipedia.org/wiki/Question_answering) *sounds like Siri/Alexa/Hey Google*

GPT is Generative Pre-training.
- learning from raw text is crucial for moving away from supervised learning. Supervised learning is expensive, due to the need to label/annoate data.
- leveraging more than word-level data from raw data is hard. It can be unclear what objectives/tasks to optimize for. It is also unclear how to transfer learning from training on one task (learned representations) to the target task.
- unsupervised pre-training is a special case of semi-supervised learning. Pre-training uses model parameters of tasks that have been learned before to initialize the model parameters for a new task. The goal is to find a good initializaion point.
- discriminative models are a class of logistical models for classification or regression.
- GPT is a task agnostic model (*to me this means generalizable*)

Fine tuning + pre-training:

![diagram](http://d2l.ai/_images/finetune.svg)

- copy another model, randomize and train just the output layer while doing small tweaks to lower layers of the neural network
