# More of a general case just for fun:
# 1. find the prime factorization of each number 1 to n
# 2. finds the maximum number of occurences of each prime
# 3. multiplies them for the smallest multiple

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

def prime_factors(n, primes) # O(n^2)
  factors = []
  primes.each do |prime|
    until n % prime != 0 || n == 1
      # divide n by the prime as many times as it can
      factors << prime
      n /= prime
    end
  end
  factors
end

def smallest_multiple(n)
  primes = sieve(n)
  factor_mapping = (1..n).to_a.map do |val|
    prime_factors(val, primes)
  end

  total = 1
  primes.each do |prime|
    largest = if prime*prime > n
      1 # because there can only be one of each prime
    else
      factor_mapping.inject(0) do |most_ocurrences, factors|
        times = ocurrences(prime, factors)
        times > most_ocurrences ? times : most_ocurrences
      end
    end
    total *= (prime ** largest)
  end
  total
end

def ocurrences(n, array)
  array.inject(0) { |counter, val| val == n ? counter+1 : counter }
end

puts smallest_multiple(40000) # => 232792560
