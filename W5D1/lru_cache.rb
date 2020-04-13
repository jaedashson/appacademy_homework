class LRUCache
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    @cache.length
  end

  def add(el)
    if count < @size
      @cache << el
      return
    end

    if count == @size
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      else
        @cache.shift
        @cache << el
      end  
    end
  end

  def show
    p @cache
  end

  private
  # def include?(ele)
  #   @cache.each_with_index do |cached, i|
  #     if ele.is_a?(Integer)
  #       return i if cached == ele
  #     elsif ele.is_a?(String)
  #       return i if cached == ele
  #     elsif ele.is_a?(Array)
  #       return i if cached == ele
  #     elsif ele.is_a?(Symbol)
  #       return i if cached == ele
  #     elsif ele.is_a?(Hash)
  #       return i if cached == ele
  #     end
  #   end
  # end
    
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]