# Text Categorization
TC is the task of assigning a boolean value to each pair `(dj, ci)` in `D x C`, where D is domain of documents and `C = {c1, ..., cn}`, `n = |C|`, is a set of predefined categories.

More formally, the task is to approximate the unknown *target function* `fi: D x C -> {T, F}`, where fi is the classifier.
- categories are symbolic labels
  - no exogenous knowledge (data provided from external sources) is available 
- categories must be classified based on endogenous knowledge (data extracted from the documents)  
  - inferred from the semantics of a document, subjective in nature
  - because it lacks objectivity, it is non-deterministic
  - subject to judgement of one's teaching the algorithm

### Single-label versus multi-label TC
Different constraints may be enforced on the TC task. 
- Perhaps it should map to exactly one category (**single-label** categories)
- if mapped to 0 to |C| categories, it is **multi-label**

### Bayes Rule
`P(a|b) = P(b|a) * P(a) / P(b)`

### Naive Baysian Algorithm
Uses the TC model, and two assumptions, to calculate the category that maximizes `P(ci | d)` (probability of each category for a given document), expressed as `c = argmax( P(ci | d) )`. 
- Assumption 1: Conditionally Independent, we assume the words in the document have no order.
- Assumption 2: Assume that the probability that document is in a category is equal to the product of each word's probability of being in the category
  - Laplace Smoothening is applied to this assumption to remove the multiply by 0 possibility 
  - for each `P(xi | c)`, where `xi` is some word in `d`, add 1 to the numerator and `V` to denominator, `V` is the total number of words in the vocabulary
- Apply Bayes Rule to original expression, `c = argmax( P(d | ci) * P(ci) / P(d) )`, since `P(d)` is constant for all ci, it can be ignored
- `c = argmax( Π( P(xj|ci) ) * P(ci) )`, where `P(ci)` is the percentage of total documents that are in the category `ci`


[source](http://nmis.isti.cnr.it/sebastiani/Publications/ACMCS02.pdf)
