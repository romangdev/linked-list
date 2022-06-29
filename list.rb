# frozen_string_literal: true

# Representing linked list objects
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
    @total_nodes
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    count = 0
    return 'out of range' if index.negative?
    return @head.value if count == index

    @loop_tmp = @head.next_node
    count += 1
    until count == index
      @loop_tmp = @loop_tmp.next_node
      count += 1
    end
    @loop_tmp.value
  end

  def pop
    @tail_pop.next_node = nil
    @tmp_tail = @tail_pop
    @total_nodes -= 1
  end

  def contains?(value)
    count = 0
    hold_node = @head
    until value == hold_node.value || count > size
      hold_node = hold_node.next_node unless hold_node.next_node.nil?
      count += 1
    end
    return true if hold_node.value == value
    return false if count > size
  end

  def find(value)
    count = 0
    hold_node = @head
    until value == hold_node.value || count > size
      hold_node = hold_node.next_node unless hold_node.next_node.nil?
      count += 1
    end
    return count if hold_node.value == value
    return nil if count > size
  end

  def to_s
    count = 0
    hold_node = @head
    until count >= size
      print "( #{hold_node.value} ) --> "
      hold_node = hold_node.next_node
      print "nil\n" if hold_node.nil?
      count += 1
    end
  end

  def insert_at(value, index)
    count = 0
    hold_node = @head
    until count == index
      hold_node = hold_node.next_node
      count += 1
    end
    count_two = 0
    pre_hold_node = @head
    until count_2 == count - 1
      pre_hold_node = pre_hold_node.next_node
      count_two += 1
    end
    pre_hold_node.next_node = Node.new(value, hold_node)
    @total_nodes += 1
  end

  def remove_at(index)
    count = 0
    pre_hold_node = @head
    until count == index - 1
      pre_hold_node = pre_hold_node.next_node
      count += 1
    end
    count_two = 0
    mid_hold_node = @head
    until count_2 == index
      mid_hold_node = mid_hold_node.next_node
      count_two += 1
    end
    @total_nodes -= 1
    post_hold_node = mid_hold_node.next_node
    pre_hold_node.next_node = post_hold_node
    mid_hold_node.next_node = nil
  end
end

# For creating node objects meant to work within linked lists
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
