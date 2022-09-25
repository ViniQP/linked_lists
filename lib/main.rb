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
      @head = value
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
    if head_null? == true
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
    return "EMPTY LIST!" if head_empty

    temp = @head
    unless temp.next_node == nil
      temp = temp.next_node
    end
    
    temp
  end

  def at(index)
    return "EMPTY LIST!" if head_empty?

    count = index
    temp = @head
    while count > 0
      break if temp.next_node == nil

      count -= 1 
      temp = temp.next_node 
    end
    temp
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
list.append("yo bitch")
list.append("jesser we need to cook")
p list.head

puts list.at(2)