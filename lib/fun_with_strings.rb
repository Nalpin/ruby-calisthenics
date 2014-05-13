module FunWithStrings
  def palindrome?
    s = self.downcase.gsub(/\W/,"")
    s == s.reverse
  end
  def count_words
    h = Hash.new(0)
    self.split(/\W/).select {|w| !w.empty?}.each {|w| h[w.downcase] += 1}
    h
  end
  def anagram_groups
    self.split.group_by {|w| w.downcase.chars.sort}.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
