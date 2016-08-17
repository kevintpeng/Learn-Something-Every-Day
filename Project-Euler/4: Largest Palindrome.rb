def pal?(num)
  pa = num.to_s
  left = 0
  right = pa.length-1
  while right >= left
    return false if pa[left] != pa[right]
    left += 1
    right -= 1
  end
  true
end

largest = 0
(1..999).each do |n1|
  (1..999).each do |n2|
    num=n1*n2
    largest = num if num>largest && pal?(num)
  end
end
puts largest
