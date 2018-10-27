class Queue
  def initialize
    @queue_array = []
  end

  def enqueue(el)
    @queue_array.unshift(el)
  end

  def dequeue
    @queue_array.pop
  end

  def peek
    @queue_array[-1]
  end
end
