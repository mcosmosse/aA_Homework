def first_anagram?(str1, str2) #* do not do this. O(n!) #.231 #.487

    str1.split("").permutation.to_a.include?(str2.split("")) ? true : false

end

 
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2) #.351  #! O(n^2)
    string = str2

    str1.each_char do |char| 
        return false if !string.include?(char)
        string = string[0...string.index(char)] + string[string.index(char) + 1..-1]
    end
    string.empty? ? true : false
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2) # O(2 * n log n)
    str1.chars.sort == str2.chars.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2) # .338 O(n)
    h1 = Hash.new(0)
    h2 = Hash.new(0)
    str1.each_char { |c1| h1[c1] += 1}
    str2.each_char { |c2| h2[c2] += 1}
    h1 == h2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def fifth_anagram?(str1, str2) # .295 O(n)
    h = Hash.new(0)
    str1.each_char { |c1| h[c1] += 1}
    str2.each_char { |c1| h[c1] -= 1}
    h.value?(0)
end

p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")    #=> true