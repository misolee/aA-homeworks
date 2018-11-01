# # ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# # => "fiiiissshhhhhh"
#
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishes)
  longest = nil
  i = 0
  while i < fishes.length
    j = 0
    while j < fishes.length
      if fishes[i].length > fishes[j].length
        longest = fishes[i]
      else
        longest = fishes[j]
      end
      j += 1
    end
    i += 1
  end
  longest
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo.
# Remember that Big O is classified by the dominant term.

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return self if self.length <= 1

    mid = self.length / 2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    merged_array = []

    until left.empty? || right.empty?
      case prc.call(left[0], right[0])
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end
end

def dominant_octopus(fishes)
  prc ||= Proc.new { |a, b| a.length <=> b.length }

  sorted_fishes = fishes.merge_sort(&prc)
  sorted_fishes[-1]
end

# Clever Octopus
# Find the longest fish in O(n) time.
# The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fishes)
  longest = fishes[0]

  fishes.each do |fish|
    longest = fish if fish.length > longest.length
  end

  longest
end

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution.
# The game has tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle.
# We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move.
# This should take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if direction == tile
  end
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster.
# Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
