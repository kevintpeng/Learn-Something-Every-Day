# obviously not optimal because sieve requires an upper bound of n, not length
# but reused code from 005

def sieve(n) # O(n)
  all = (2..n).to_a
  primes = []
  i = 2
  while i*i < n
    return primes if all.empty?
    # add the first element still in all, it is prime
    primes << all.shift
    # remove all multiples of the newly added prime
    all.select! { |num| num % i != 0 }
    i += 1
  end
  primes + all
end

puts sieve(120000)[10000] # => 104743
