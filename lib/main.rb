class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def head_empty?
    head == nil ? true : false
  end

  def append(value)
    if head_empty?
      add_start(value)
    else
      temp = @head
      unless temp.next_node == nil
        temp = temp.next_node
      end
      temp.next_node = Node.new(value)
    end
  end

  def add_start(value)
    if head_empty?
      @head = Node.new(value)
    else 
      temp = @head
      @head = Node.new(value, temp)
    end
  end

  def size
    if head_empty? == true
      return 0
    end
    
    temp = @head
    count = 1
    while temp.next_node != nil 
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
    size = self.size
    self.size.times do 
      return true if temp.value == value
      temp = temp.next_node
    end

    false
  end

  def find(value)
    return if head_empty?
    return if contains?(value) == false

    counter = 0
    temp = @head
    return counter if temp.value == value
    
    while temp.value != value
      temp = temp.next_node
      counter += 1
    end

    counter
  end

  def to_s
    return if head_empty?
    
    count = self.size
    string = ""
    temp = @head
    while count > 0
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
list.add_start("los pollos")
list.append("jesser we need to cook")
list.add_start("better call saul")
p list.head
puts list.size
puts "-----------"
puts list.contains?("asac schrader")
puts list.contains?("yo")
puts list.contains?("los pollos")
puts "----------------"
puts list.find("yo")
puts list.find("better call saul")
puts list.find("jesser we need to cook")
puts list.find("los pollos")
p list.find("asac schrader")

puts list.at(1)
puts list.to_s