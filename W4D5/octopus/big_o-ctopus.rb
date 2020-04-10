fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# comparing all fish lengths to all other fish lengths
# O(n^2)
def sluggish_octopus(fish)
    longest_fish = fish.first

    fish.each do |current_fish|

        fish.each do |other_fish|
            if current_fish.length > other_fish.length
                longest_fish = current_fish
            else
                longest_fish = other_fish
            end
        end
    end

    longest_fish
end

# p sluggish_octopus(fish)

# O(n^2)
def bubble_octopus(fish)
    sorted = false

    until sorted
        sorted = true

        (0...fish.length - 1).each do |i|
            if fish[i].length > fish[i + 1].length
                fish[i], fish[i + 1] = fish[i + 1], fish[i]
                sorted = false
            end
        end
    end

    fish.last
end

# p fish
# p bubble_octopus(fish)
# p fish

# O(nlogn)
def dominant_sort(fish)
    return fish if fish.length <= 1

    mid = fish.length / 2

    left = fish[0...mid]
    right = fish[mid..-1]

    left_sorted = dominant_sort(left)
    right_sorted = dominant_sort(right)

    sorted = dominant_merge(left_sorted, right_sorted)
end

def dominant_merge(left, right)
    sorted = []

    until left.empty? || right.empty?
        if left.first.length < right.first.length
            sorted << left.shift
        else
            sorted << right.shift
        end
    end

    sorted + left + right
end

def dominant_octopus(fish)
    sorted = dominant_sort(fish)
    
    sorted.last
end

# p dominant_octopus(fish)

# O(n)
def clever_octopus(fish)
    longest_fish = fish.first

    (1...fish.length).each do |i|
        longest_fish = fish[i] if fish[i].length > longest_fish.length
    end

    longest_fish
end

# p clever_octopus(fish)