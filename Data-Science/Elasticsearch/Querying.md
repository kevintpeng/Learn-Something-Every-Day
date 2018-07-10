### Elasticsearch Query DSL
- Leaf query clauses look for a particular value in a field
- Compound query clauses wrap other leaf or compound queries
- behaviour of a query clause depends on if it used in *query context* or *filter context*

- **Query context** describes "How well does this document match this query clause"
  - bool decides whether or not it should match
  - then assigns a `_score` representing how well the document matches, relatively
- in **Filter context**, a query clause describes "does this document match this query clause?"

[source](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)

### Query Score Algorithm
Relevance is the score of each document, represented by a positive float called `_score`
- calculated depending on the type of query clause
- a `fuzzy` query might determine the `_score` by calculating how similar the spelling of the found word is
- algorithm known as **term frequency/inverse document frequency**, TF/IDF
  - Term Frequency is how often the term appears in a field
  - Inverse document frequency, how often does each term appear in the index, more often, the less relevant
    - common terms have lower weight
  - Field-length norm, how long is the field, the longer the less likely a word in the field will be relevant

[source](https://www.elastic.co/guide/en/elasticsearch/guide/current/controlling-relevance.html)
