def no_dupes?(arr)
    counter = Hash.new(0)
    newArray = []
    arr.each {|ele| counter[ele] += 1}
    counter.each do |k, v|
        if v == 1
            newArray << k
        end 
    end 
    newArray
end 

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)

    arr.each_with_index do |ele, i|
        if arr[i] == arr[i + 1]
            return false 
        end 
    end 
    return true 
end 

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)

    newHash = Hash.new {|hash, key| hash[key] = []}

    str.each_char.with_index do |char, i|
        if newHash[char]
            newHash[char] << i
        end 
    end 
    newHash
end 

p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    current_char = nil
    current_streak = ""
    longest_streak = ""

    str.each_char do |char|
        if char == current_char
            current_streak += char
        else
            current_char = char
            current_streak = char
        end

        if current_streak.length >= longest_streak.length
            longest_streak = current_streak
        end
    end

    longest_streak
end


