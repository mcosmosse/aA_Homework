class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent= (node)
        return @parent = nil if node == nil
        @parent.children.delete(self) if @parent
        @parent = node
        node.children << self if !node.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "not a node" if child_node.parent == nil
        child_node.parent = nil
    end

    def child_value
        children.map {|node| node.value}
    end

    def inspect 

        p " position: #{value}  possible moves: #{child_value} "
        puts

    end
    
    def dfs(target)
        if self.value == target
            return self 
        else
            self.children.each do |ele|
                result = ele.dfs(target)
                return result if result != nil
                # ele.dfs(target)
            end
        end
        return nil
    end

    def bfs(target)

        queue = [self]

        until queue.empty?
            if queue[0].value == target 
                return queue[0]
            else
                queue += queue[0].children
                queue.shift
            end
        end

    end
    
end