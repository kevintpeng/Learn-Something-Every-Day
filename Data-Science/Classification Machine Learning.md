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
