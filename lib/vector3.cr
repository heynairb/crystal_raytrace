require "math/math"

class Vector3
    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end
    property x : Float64
    property y : Float64
    property z : Float64

    def r
        @x
    end

    def g
        @y
    end

    def b
        @z
    end

    def r=(@x)
    end

    def g=(@y)
    end

    def b=(@z)
    end

    def +(j : Vector3)
        Vector3.new(@x + j.x, @y + j.y, @z + j.z)
    end

    def *(j : Vector3)
        Vector3.new(@x*j.x, @y*j.y, @z*j.z)
    end

    def *(j : Float64)
        Vector3.new(@x*j, @y*j, @z*j)
    end

    def -
        Vector3.new(-@x, -@y, -@z)
    end

    def -(j : Vector3)
        self + (-j)
    end

    def squared_length
        @x**2 + @y**2 + @z**2
    end

    def length
        Math.sqrt self.squared_length
    end

    def /(j : Vector3)
        Vector3.new(@x/j.x, @y/j.y, @z/j.z)
    end

    def /(j : Float64)
        Vector3.new(@x/j, @y/j, @z/j)
    end

    def dot(j : Vector3)
        @x * j.x + @y * j.y + @z * j.z
    end

    def cross(j : Vector3)
        Vector3.new(@y * j.z - @z * j.y, @x * j.z - @z * j.x, @x * j.y - @y * j.x)
    end

    def create_unit_vector
        self / self.length
    end

    def [](i : Int32)
        case i
            when 0
                @x
            when 1
                @y
            when 2
                @z
            else
                raise "out of bounds"
        end
    end

    def []=(i : Int32, value : Float64)
        case i
        when 0
            @x = value
        when 1
            @y = value
        when 2
            @z = value
        else
            raise "out of bounds"
        end
    end
end

struct Float64
    def *(j : Vector3)
        j*self
    end
end


