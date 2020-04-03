class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each_with_index do |pair, i|
            if pair[0] == key
                @map[i] = [key, value]
                return
            end
        end

        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            return pair[1] if pair[0] == key
        end
    end

    def delete(key)
        @map.each_with_index do |pair, i|
            @map.delete_at(i) if pair[0] == key
        end
    end

    def show
        @map.map(&:clone)
    end
end

m = Map.new

m.set("nj", "new jersey")
m.set("la", "louisiana")
p m.get("la")
m.set("la", "los angeles")
p m.get("la")
m.set("ny", "new york")
m.delete("ny")
p m.show