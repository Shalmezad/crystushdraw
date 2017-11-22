describe Crystushdraw do
  it "should make a line from points" do
    program = "( 10.0 10.0 POINT.FROMFLOATS 20.0 30.0 POINT.FROMFLOATS DRAW.LINEFROMPOINTS )"
    program = Crystushdraw::Program.new(program)
    # Until I figure out what's wrong:
    program.configuration.debug_each_step = true
    stacks = program.evaluate
    stacks.point_stack.size.should eq(0)
    stacks.draw_stack.size.should eq(1)
  end
end
