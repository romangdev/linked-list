class LinkedList
  attr_accessor :head, :total_nodes

  def initialize(value)
    @head = Node.new(value)
    @tmp_tail = @head
    @total_nodes = 1
  end

  def append(value)
    @tail = Node.new(value)
    @tmp_tail.next_node = @tail
    @tail_pop = @tmp_tail
    @tmp_tail = @tail
    @total_nodes += 1
  end

  def prepend(value)
    @tmp_head = @head
    @head = Node.new(value, @tmp_head)
    @total_nodes += 1
  end

  def size
    return @total_nodes
  end

  def head
    return @head.value
  end

  def tail 
    return @tail.value
  end

  def at(index)
    count = 0
    return "out of range" if index < 0
    return @head.value if count == index
    @loop_tmp = @head.next_node
    count += 1
    until count == index
      @loop_tmp = @loop_tmp.next_node
      count += 1
    end
    return @loop_tmp.value
  end

  def pop
    @tail_pop.next_node = nil
    @tmp_tail = @tail_pop
    @total_nodes -= 1
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new(5)
linked_list.append(8)
linked_list.append(82)
linked_list.prepend(10)
puts linked_list.at(3)
linked_list.pop
puts linked_list.size
puts linked_list.at(2)
