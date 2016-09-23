



class LRUCache
    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      @cache.count
    end

    def add(ele)
      if @cache.include?(ele)
        @cache.delete(ele)
        @cache << ele
      elsif @cache.count >= @size
        @cache.shift
        @cache << ele
      else
        @cache << ele
      end
    end

    def show
      p @cache
    end
  end
  
johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count == 2

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
