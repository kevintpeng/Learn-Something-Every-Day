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

### Hashing Algorithms
Perfect hashing is an injective function that maps every input to a distinct output. It is a *minimal* perfect hashing function if it can map n keys to n distinct hash values. 

With information about the data or its distribution, one can design a huristic function that performs better for the special case of data. For example if the data is mostly sequential, then taking an integer representation of the data and modding it will yield a very good distribution.

With a **universal hashing** algorithm, the collision chance should be exactly 1/n for n buckets, regardless of key similarity. Will perform worse than a perfect hashing algorithm catered for a specific set of data.

#### Multiplicative Hashing
The hash index is computed as the hash value multiplied by some large value. Works well for the same reason linear congruences generate seemingly random numbers. 
```ruby
hash = some_prime
K = 33; // or 31 or 27
word.each do |character|
    hash = (hash * K) + character
end
```

### Cryptographic Hash Function
Properties of cryptographic hashing functions:
- easy to compute the hash value for any message
- infeasible to generate a message that has a given hash
- infeasible to modify message without changing hash
- infeasible to find two different messages with the same hash

MD5, SHA0 and SHA1 examples of "broken" algorithms.
