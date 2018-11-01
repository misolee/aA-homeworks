class LRUCache
  def initialize(number)
    @number = number
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.length >= @number
      @cache.shift
      @cache << el
    elsif @cache.include?(el)
      @cache.delete(el)
      @cache << el
    else
      @cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    puts @cache
  end

  private
  # helper methods go here!

end
