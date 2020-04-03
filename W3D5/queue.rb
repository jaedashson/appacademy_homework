class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end

# q = Queue.new
# q.enqueue("First!")
# q.enqueue("Second!")
# q.enqueue("Third!")

# p q.dequeue
# p q.dequeue
# p q.dequeue
# p q.peek