# This class represents a tree
# where each node has an array of children.

class Tree

  ##
  # reads the key of the tree's root
  attr_reader :key

  ## 
  # sets the key of the tree's root node
  # unless intended new key is nil
  # (to remove a node, set the entire node to nil)
  def key=(new_key)
    if !new_key.nil?
      @key = new_key
    end
    @key
  end

  ##
  # sets or reads the array of children for this instance
  attr_accessor :children


  ##
  # Creates a new tree with the root node key specified by 
  # the +key+ param as the @key for the instance
  def initialize(key)
    @key = key
    @children = []
  end

#Breadth First Search - first in first out
# check if my_tree.key == target_key
# if equal, return my_tree
# else add my_tree.children to queue
# while queue is not empty 
#   get first element is queue(current_element) and remove it from the queue
#   check if current_element.key == target_key
#   if yes return current_element
#   if not true, add current_element.children to the queue
# end
# if queue is empty it doesn't exist in the data set, return nil
  # Searches through all nodes of the tree, spreading 
  # outward from the root. Looks for any node with key equal
  # to the +target_key+ param. Returns nil if no such node is found.
  def breadth_first_search(target_key)
   
    queueArr = [] 
    my_tree = self.key
    queueArr.unshift(my_tree)
    # puts queueArr eq to "A at this point
    if my_tree === target_key
      return my_tree
    end
    puts self.children
    #   status = queueArr.unshift(self.children)
    # end
    # puts status
    end  
end

my_tree = Tree.new('A')
b_node = Tree.new('B')
c_node = Tree.new('C')
d_node = Tree.new('D')
e_node = Tree.new('E')
f_node = Tree.new('F')
g_node = Tree.new('G')

my_tree.children << b_node
my_tree.children << c_node
b_node.children << d_node
b_node.children << e_node
b_node.children << f_node
e_node.children << g_node

#          D 
#        /
#     B  -- E -- G
#   /   \
# A        F
#   \
#     C 



puts "\n-- expect node E --"
e_result = my_tree.breadth_first_search('E')
p e_result
# ["A"]
# ["B", "C"]
# ["C", "D", "E", "F"]
# ["D", "E", "F"]
# ["E", "F"]
# #<Tree:0x007fee51891dd0 @key="E", @children=[#<Tree:0x007fee51891ce0 @key="G", @children=[]>]>

puts "\n-- expect node G --"
g_result = my_tree.breadth_first_search('G')
p g_result
# ["A"]
# ["B", "C"]
# ["C", "D", "E", "F"]
# ["D", "E", "F"]
# ["E", "F"]
# ["F", "G"]
# ["G"]
# #<Tree:0x007fe77c29dae0 @key="G", @children=[]>


puts "\n-- expect nil -- "
h_result = my_tree.breadth_first_search('H')
p h_result
# ["A"]
# ["B", "C"]
# ["C", "D", "E", "F"]
# ["D", "E", "F"]
# ["E", "F"]
# ["F", "G"]
# ["G"]
# nil

