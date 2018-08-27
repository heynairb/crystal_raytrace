require "vector3"

struct HitRecord
    property t, p, normal
    def initialize(@t : Float64, @p : Vector3, @normal : Vector3)
    end
end

abstract class Hitable
    abstract def hit(ray : Ray, t_min : Float64, t_max : Float64)
end


