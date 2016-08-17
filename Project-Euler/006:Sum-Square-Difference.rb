sum = (1..100).to_a.map{|n|n*n}.inject(0){|tot,n| tot += n}
square = (1..100).to_a.inject(0){|tot,n| tot += n}**2
puts square - sum
