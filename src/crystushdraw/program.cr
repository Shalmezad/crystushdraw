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
      puts "Evaluating: '#{program}'"
      return super(stacks)
    end

    def execute_instruction(instruction : String, stacks : Crystushdraw::PushStacks)
      puts "Executing: '#{instruction}'"
      if instruction.starts_with? "DRAW."
        puts "Handling my self"
        execute_draw_instruction(instruction, stacks)
      else
        puts "Falling down"
        super(instruction, stacks)
      end
    end

    def execute_draw_instruction(instruction : String, stacks : Crystushdraw::PushStacks)
      if instruction == "DRAW.LINEFROMPOINTS"
        # We need 2 points:
        return if stacks.point_stack.size < 2
        # Pop them off:
        # TODO: Finish coding me
      end
    end
  end
end
