#START:syntax
l = ->x,y{"woo ugly #{x+y}"}    # same as lambda {|x,y| x + y }

# Three ways to call...
p l.call(1,2)   # => "woo ugly 3"
p l[1,2]
p l.(1,2)
#END:syntax

#START:example
parsers = {
   def:       ->node{MethodNode.new(node.name, node.body)}, 
   class_def: ->node{ClassNode.new(node)}
}
parsers[:def].(node)
#END:example