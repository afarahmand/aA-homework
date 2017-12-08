class Stack
  attr_accessor :stack

  def initialize(arr = [])
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  attr_accessor :queue

  def initialize(arr = [])
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  attr_accessor :keys, :values

  def initialize
    @keys = []
    @values = []
  end

  def assign(k, v)
    if @keys.include?(k)
      @values[@keys.index(k)] = v
    else
      @keys.push(k)
      @values.push(v)
    end
  end

  def lookup(k)
    @values[@keys.index(k)]
  end

  def remove(k)
    idx = @keys.index(k)
    @keys.delete_at(idx)
    @values.delete_at(idx)
  end

  def show
    return "{}" if @keys.length < 1

    str = "{"
    @keys.each_with_index do |k, index|
      str+="#{k}=>#{@values[index]}, "
    end

    return str.chop.chop + "}"
  end
end
