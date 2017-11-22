require "crystush2d"
module Crystushdraw
  class PushStacks < Crystush2d::PushStacks
    property draw_stack : Array(Drawable) = [] of Drawable

    def to_s(io)
      super(io)
      io << "DRAW   : " << draw_stack << "\n"
    end
  end
end
