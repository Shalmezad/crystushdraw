require "crystush2d"

module Crystushdraw
  class Program < Crystush2d::Program
    INSTRUCTIONS = Crystush2d::Program::INSTRUCTIONS.concat([
      "DRAW.LINEFROMPOINTS"
    ])

    def initialize(program : String)
      super(program)
    end

    def evaluate(stacks : Crystushdraw::PushStacks = Crystushdraw::PushStacks.new) : Crystushdraw::PushStacks
      return super(stacks)
    end

    def execute_instruction(instruction : String, stacks : Crystushdraw::PushStacks)
      if instruction.starts_with? "DRAW."
        execute_draw_instruction(instruction, stacks)
      else
        super(instruction, stacks)
      end
    end

    def execute_draw_instruction(instruction : String, stacks : Crystushdraw::PushStacks)
      if instruction == "DRAW.LINEFROMPOINTS"
        # We need 2 points:
        return if stacks.point_stack.size < 2
        # Pop them off:
        pointA = stacks.point_stack.pop
        pointB = stacks.point_stack.pop
        # Create a new drawable:
        line = Crystushdraw::Drawable::Line.new
        line.pointA = pointA
        line.pointB = pointB
        stacks.draw_stack.push line
      end
    end
  end
end
