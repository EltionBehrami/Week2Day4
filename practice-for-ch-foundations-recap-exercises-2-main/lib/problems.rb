require "byebug"

# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
def least_common_multiple(num_1, num_2)
  newArray = [] 
  i = 1
  while newArray.length < 1
    num_1_multiple = num_1 * i  
    if num_1_multiple % num_2 == 0
      newArray << num_1_multiple
    end 
    i += 1
  end 
  newArray.first
end


# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(string)
    bigram_freq = {}
    string = string.downcase

    (0..string.length - 2).each do |i|
      bigram = string[i..i+1]

      if bigram_freq.key?(bigram)
        bigram_freq[bigram] += 1
      else
        bigram_freq[bigram] = 1
      end
    end

  most_frequent_bigram = bigram_freq.max_by { |bigram, count| count }
  most_frequent_bigram[0]
end




class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
  def inverse
    newHash = {}
    self.each { |k, v| newHash[v] = k } 
    newHash
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    pairs = []
    count = 0
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        if idx2 > idx1
          pairs << [ele1, ele2]
        end 
      end 
    end 

      pairs.each do |pair|
        if pair.sum == num
          count += 1
        end 
      end 
      count 
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}
    
    sorted = false
    until sorted 
      sorted = true 

      (0...length-1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end 
      end 
    end 
    self 
  end
end