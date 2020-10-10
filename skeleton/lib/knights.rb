require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :root_node

    def initialize(arr)
        @root_node = PolyTreeNode.new(arr)
        @considered_positions = [arr]
    end
    
    def self.valid_moves(pos)
        x, y = pos 

        new_arr =[ 
        [x - 2, y + 1], 
        [x + 2, y + 1],
        [x - 2, y - 1],
        [x + 2, y - 1],
        [x + 1, y - 2],
        [x + 1, y + 2],
        [x - 1, y - 2],
        [x - 1, y + 2]]

        new_arr.select { |p| p[0] < 8 && p[0] >= 0 && p[1] < 8 && p[1] >= 0}
    end

    def new_move_positions(pos)
        arr = KnightPathFinder.valid_moves(pos).select { |p| !@considered_positions.include?(p) }
        @considered_positions += arr
        arr
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?

            new_move_positions(queue[0].value).each do |pos|
                new_node = PolyTreeNode.new(pos)
                queue[0].add_child(new_node)
                queue << new_node 
            end
            queue.shift
        end
        @root_node
    end



end



p new_knight = KnightPathFinder.new([0,0])
# p KnightPathFinder.valid_moves([4,4])
p new_knight.build_move_tree

