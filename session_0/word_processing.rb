# frozen_string_literal: true

# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
  words.map(&:downcase)
end

# print lower_case(['', 'HELLO', 'WoRlD', 'nice'])
# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  words.map(&:downcase!)
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  words.select { |word| word.start_with?(prefix) }
end

# print words_with_prefix('apple', ['apple', 'ball', 'applesauce'])
# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
#
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
  current_max = 0
  current_max += 1 while word_1[current_max] == word_2[current_max] && current_max != word_1.size
  current_max
end

# print similarity_score('apple', 'apple')
# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.
def most_similar_words(chosen_word, words)
  current_max = 0
  word_list = []
  words.each do |w|
    current_score = similarity_score(w, chosen_word)
    if current_score > current_max
      current_max = current_score
      word_list = [w]
    elsif current_score == current_max
      word_list.push(w)
    end
  end
  word_list
end
# print most_similar_words('apple', ['ball', 'applesauce', 'bike', 'apple'])
