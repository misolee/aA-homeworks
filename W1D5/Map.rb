require "byebug"
class Map
  def initialize
    @my_map = []
  end

  def set(key, value)
    @my_map << [key, value] if @my_map.empty?
    key_flag = false
    @my_map.each do |pair|
      if pair[0] == key
        pair[1] = value
        key_flag = true
      end
    end
    @my_map << [key, value] if key_flag == false
    @my_map
  end

  def get(key)
    @my_map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def delete(key)
    @my_map.each do |pair|
      @my_map.delete(pair) if pair[0] == key
    end
    @my_map
  end

  def show
    @my_map
  end
end
