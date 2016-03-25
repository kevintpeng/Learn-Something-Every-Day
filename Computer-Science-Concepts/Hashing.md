# Hashing
Converting some given data to a numeric value, using a hash function. Hash functions are deterministic and should be fast. Hashing has several important applicaitons, including the HashTable data structure and for security in communication protocols. 

### Map (Dictionary)
The C++ `map` data type implements the idea of dictionaries. 
- ordered (sorted) container 
- declaration: `map<T1, T2> m;` where T1 is the **key** and T2 is the **value**.
- The key must have a strict weak ordering, with `<` function (strings, numbers, pointers)
- maintains sorted elements using red-black tree (self balancing tree with O(log N) insert, delete, lookup)

```C++
map<string, int> m;
string token;
while(cin >> token) { // count number of times each word appears
    m[token]++;
}
m.erase("some_key"); // removes key "some_key" from the map
```

### Hash Functions
Converts some data to an index in the range [0..K-1], K is number of slots.
Important Characteristics of Hash Functions:
1. Deterministic based on key (always get same answer from same input)
2. Uniform spread over buckets/slots.
3. Cheap to compute.
4. Supports a variable range (as K scales)

Hashing does not require unique keys, however same keys will map to same place causng collision.

Hashing doesn't work well for ordered operations (like print in alphabetical order) since similar keys should map to wildly different locations.

Example: Human names have poor distribution (lots of S's, few X's)
- common hash is sum ASCII values mod K. (Still terrible, does not scale with num of buckets K)

### Hash Table Structure
Consists of vector, hash function, collision strategy.

Can insert, delete, lookup in amortized O(1) constant time. 
- **hash table** is a vector of k slots/buckets 
- **hash function** is a deterministic algorithm for matching a given key to an index [0..k-1]
- a good hashing function reduces chance of collisions. 

#### Closed Hashing
Also known as open addressing, uses **linear probing** (adding one and trying again):
- initialize the HashTable with N nodes set to `EMPTY` status
- Allocate all space for the table at the beginning (Vector of nodes, with key, value and statuses: `EMPTY`, `ZOMBIE`, `ACTIVE`)
- insert: hash the key, if index is taken, increment through the allocated vector until an empty (or zombie) bucket is found. Sets node to `ACTIVE`
- lookup: hash key, increment through the vector until key is found (return val) or empty bucket is found (return -1) or all buckets have been checked (return -1).
- remove: lookup key, set status of node to ZOMBIE
- if N << K this works well (at cost of space)

Issues:
- As table reaches limit, `insert` approaches O(N)
- If table has few EMPTY slots, `lookup` and `remove` approaches O(N)

#### Open Hashing
Each slot has a bucket of elements. Hash Table is a list-of-lists, called **open hashing with chaining**.

With K buckets and N records:
- Best case: no collisions, O(1) lookup
- Worst case: all inputs hash to same index, O(N) lookup
