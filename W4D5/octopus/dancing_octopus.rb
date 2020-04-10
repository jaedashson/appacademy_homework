tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
    moves = 0

    loop do
        if tiles_array[moves] == direction
            break
        else
            moves +=1
        end
    end

    moves
end

# p slow_dance("up", tiles_array) # => 0
# p slow_dance("right-down", tiles_array) # => 3

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7}

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)