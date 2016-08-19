# DIY ADTs
#
# After you finish the exercises, or if you get stuck on one of the problems, you
# can view the solutions here.
#
# Exercise 1 - Stack
#
# Let's write a Stack class. To do this, use the following framework:
#
 class Stack
    def initialize
      @stack = []
    end

    def add(el)
      @stack.push(el)
    end

    def remove
      @stack.pop
    end

    def show
      @stack.dup
    end
  end

# To test that your code works, create a new instance of the Stack class, and play
# around with adding and removing elements. Remember, a stack follows the principle of LIFO!
#
# Exercise 2 - Queue
#
# Now let's write a Queue class. We will need the following instance methods:
#  enqueue(el), dequeue, and show.
class Queue
  def initialize
    @queue = []
  end
  def enqueue(el)
    @queue.push el
  end
  def dequeue(el)
    @queue.shift
  end

  def show
    @queue.dup
  end

end


#
# Test your code to ensure it follows the principle of FIFO.
#
# Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a 2D array.
# Let's write a Map class (following a similar pattern to Stack and Queue) that
# implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always
#  unique. When implemented with arrays, a map might look something like this:
#   my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods:
#  assign(key, value), lookup(key), remove(key), show. Note that the assign method
#  can be used to either create a new key-value pair or update the
#   value for a pre-existing key. It's up to you to check whether a key currently exists!
class Map
  def initialize
    @map = []
  end

  def assign(k, v)
    kv_idx = @map.index {|kv| kv[0] == k}
    kv_idx ? @map[kv_idx][1] = v : @map.push([k, v])
    [k, v]
  end

  def lookup(k)
    @map.each {|kv| return kv[1] if kv[0] == k}
    nil
  end

  def remove(k)
    @map.select! {|kv| kv[0] != k}
    nil
  end

  def show
    deep_dup(@map)
  end

  private


  def deep_dup(array)
    array.collect { |e| e.is_a?(Array) ? deep_dup(e) : e } ###one liner from old soln
  end
end
# As always, test your code thoroughly to make sure all properties of maps are enforced.
