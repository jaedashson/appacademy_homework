class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end
end

# test_stack = Stack.new

# test_stack.push("apple")
# test_stack.push("banana")

# p test_stack.peek

# test_stack.push("clementine")
# p test_stack.peek

# puts "going to start popping!"

# p test_stack.pop
# p test_stack.pop
# p test_stack.pop
# p test_stack.peek