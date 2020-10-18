# my_min
# Given a list of integers find the smallest number in the list.

# phase 2 O(n)
# def my_min(array)
#     smallest = 10000
#     array.each do |ele|
#         smallest = ele if ele < smallest
#     end
#     smallest
# end

# phase 1 O(n ^ 2)
# def my_min(array)
#     array.each do |ele1|
#         return ele1 if array.all? { |el| ele1 <= el }
#     end
# end

# Example:

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# phase 1 O(n ^ 2 * n * C) = O(n ^ 2) 0.373 0.346 0.350 .446 .562 rough average #?(n^3)
def largest_contiguous_subsum(array)
    arr = []
    array.each_with_index do |e1, i|
        array.each_with_index do |e2, j|
            arr << array[i..j] if j >= i
        end
    end
    arr.map{ |subarr| subarr.sum }.max
end

# phase 2 O(n ^ 2 / 2?)
    # def largest_contiguous_subsum(array) #.278 .33 .409 .288
    #     largest_sum = -100
    #     current_sum = 0
    #     i = 0
    #     while i < array.length
    #         (0..i).each do |j|
    #             if largest_sum < array[j..i].sum
    #                 largest_sum = array[j..i].sum
    #             end
    #         end
    #         i += 1 
    #     end
    #     largest_sum
    # end

# phase 3 O(n) #!for sure
def largest_contiguous_subsum(array) #.29 .364 .301 
    largest_sum = -100
    current_sum = -100
    i = 0
    while i < array.length
        current_sum = 0 if current_sum + array[i] < array[i]    
        current_sum += array[i]
        largest_sum = current_sum if largest_sum < current_sum
        i += 1
    end

    largest_sum
end


list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

# # possible sub-sums
# # [5]           # => 5
# # [5, 3]        # => 8 --> we want this one
# # [5, 3, -7]    # => 1
# # [3]           # => 3
# # [3, -7]       # => -4
# # [-7]          # => -7

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

list = [-1234124, 5469, 230458, 129385, 2958105, -2689, 21598336]
