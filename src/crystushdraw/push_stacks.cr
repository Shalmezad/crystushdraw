require "crystush2d"
module Crystushdraw
  class PushStacks < Crystush2d::PushStacks
    property draw_stack : Array(Drawable) = [] of Drawable

    def to_s(io)
      super(io)
      io << "DRAW   : " << draw_stack << "\n"
    end

    def draw(width : Int32, height : Int32, filename : String)
      # Get a wand:
      LibMagick.magickWandGenesis
      m_wand = LibMagick.newMagickWand
      p_wand = LibMagick.newPixelWand
      d_wand = LibMagick.newDrawingWand

      # Make an image:
      LibMagick.pixelSetColor p_wand, "white"
      LibMagick.magickNewImage m_wand, width, height, p_wand

      # Prep before line:
      LibMagick.drawSetStrokeOpacity d_wand, 1
      LibMagick.drawSetStrokeColor d_wand, p_wand
      LibMagick.drawSetStrokeWidth d_wand, 4
      LibMagick.drawSetStrokeAntialias d_wand, true
      LibMagick.pixelSetColor p_wand, "black"
      LibMagick.drawSetStrokeColor d_wand, p_wand

      # Make a line:
      draw_stack.each do |drawable|
        drawable.draw(m_wand, p_wand, d_wand)
      end

      # Write to an image:
      LibMagick.magickDrawImage m_wand, d_wand
      LibMagick.magickWriteImage m_wand, filename

      # Cleanup the wands:
      LibMagick.destroyDrawingWand d_wand
      LibMagick.destroyPixelWand p_wand
      LibMagick.destroyMagickWand m_wand
      LibMagick.magickWandTerminus
    end

  end
end
