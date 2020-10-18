def bad_two_sum?(arr, target_sum) #.298 O(n ^ 2)
    arr.each_with_index do |num1, i|
        arr.each_with_index do |num2, j|
            return true if num1 + num2 == target_sum && j > i
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum) # O(n log n) .26
    sorted = arr.sort
    i = 0
    j = arr.length - 1
    while i != j
        return true if sorted[i] + sorted[j] == target_sum
        if sorted[i] + sorted[j] < target_sum
            i += 1
        else
            j -= 1
        end
    end
    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum) #! O(n) 
    h = Hash.new()
    arr.each do |ele|
        return true if !h[target_sum - ele].nil?
        h[ele] = true #{0=>true, 1=>true }
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false