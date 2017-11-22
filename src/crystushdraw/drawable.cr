require "magickwand-crystal"

module Crystushdraw
  abstract class Drawable

    abstract def draw(m_wand, p_wand, d_wand)

  end

  class Drawable::Line < Drawable

    property pointA : Crystush2d::Point = Crystush2d::Point.new(0.0,0.0)
    property pointB : Crystush2d::Point = Crystush2d::Point.new(0.0,0.0)

    def draw(m_wand, p_wand, d_wand)
      LibMagick.drawLine d_wand, pointA.x, pointA.y, pointB.x, pointB.y
    end

  end

end
