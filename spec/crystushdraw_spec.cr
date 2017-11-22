require "./spec_helper"
require "./instructions/**"
require "magickwand-crystal"

describe Crystushdraw do

  it "should draw a line" do
    # Get a wand:
    LibMagick.magickWandGenesis
    m_wand = LibMagick.newMagickWand
    p_wand = LibMagick.newPixelWand
    d_wand = LibMagick.newDrawingWand

    # Make an image:
    LibMagick.pixelSetColor p_wand, "orange"
    LibMagick.magickNewImage m_wand, 640, 480, p_wand

    # Prep before line:
    LibMagick.drawSetStrokeOpacity d_wand, 1
    LibMagick.drawSetStrokeColor d_wand, p_wand
    LibMagick.drawSetStrokeWidth d_wand, 4
    LibMagick.drawSetStrokeAntialias d_wand, true
    LibMagick.pixelSetColor p_wand, "green"
    LibMagick.drawSetStrokeColor d_wand, p_wand

    # Make a line:
    line = Crystushdraw::Drawable::Line.new
    line.pointA.x = 20.0
    line.pointA.y = 20.0
    line.pointB.x = 40.0
    line.pointB.y = 60.0

    # Draw:
    line.draw(m_wand, p_wand, d_wand)

    # Write to an image:
    LibMagick.magickDrawImage m_wand, d_wand
    LibMagick.magickWriteImage m_wand, "test.jpg"

    # Cleanup the wands:
    LibMagick.destroyDrawingWand d_wand
    LibMagick.destroyPixelWand p_wand
    LibMagick.destroyMagickWand m_wand
    LibMagick.magickWandTerminus
  end
end
