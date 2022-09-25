class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def head_empty?
    head == nil ? true : false
  end

  def prepend(value)
    if head_empty?
      @head = Node.new(value)
    else 
      temp = @head
      @head = Node.new(value)
      @head.next_node = temp
    end
  end

  def append(value)
    if head_empty?
      prepend(value)
    else
      temp = @head
      unless temp.next_node == nil
        temp = temp.next_node
      end
      temp.next_node = Node.new(value)
    end
  end

  def size
    if head_empty? == true
      return 0
    end
    
    temp = @head
    count = 1
    unless temp.next_node == nil 
      temp = temp.next_node
      count += 1
    end

    count
  end

  def tail
    return "EMPTY LIST!" if head_empty?

    temp = @head
    unless temp.next_node == nil
      temp = temp.next_node
    end
    
    temp
  end

  def at(index)
    return "EMPTY LIST!" if head_empty?

    count = 0
    temp = @head
    while count < index
      break if temp.next_node == nil

      count += 1 
      temp = temp.next_node 
    end
    temp.nil? ? "NOT FOUND!" : temp
  end

  def pop
    return "EMPTY LIST!" if head_empty?
    
    if self.size == 1
      return_value = @head
      @head = nil
    else
      temp = at(self.size - 1)
      return_value = temp.next_node
      temp.next_node = nil
    end
    
    return_value
  end

  def contains?(value)
    return false if head_empty?

    temp = @head
    unless temp.value == value || temp.next_node == nil
      temp = temp.next_node
    end

    return false if temp.next_node == nil
    true
  end

  def find(value)
    return false if head_empty?
    return if contains?(value) == false

    count = 0
    temp = @head
    return count if head.value == value
    unless temp.value == value
      temp = temp.next_node
      count += 1
    end

    count
  end

  def to_s
    return if head_empty?
    
    count = self.size
    string = ""
    temp = @head
    while count >= 0
      string += "(#{temp.value}) -> "
      temp = temp.next_node
      count -= 1
    end
    string += "nil"

    string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# spdksapdokasfopdaskf 

list = LinkedList.new
list.append("yo")
list.append("jesser we need to cook")
list.prepend("better call saul")
p list.head
puts list.contains?("asac schrader")
puts list.contains?("yo")

puts list.find("yo")
p list.find("asac schrader")

puts list.at(1)
puts list.to_s