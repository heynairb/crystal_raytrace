require "vector3"
class Ray
    def initialize(@A : Vector3, @B : Vector3)
    end

    def origin()
        @A
    end

    def direction()
        @B
    end

    def point_at_parameter(t : Float64)
        @A + t*@B
    end

end
