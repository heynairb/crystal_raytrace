require "hitable"
require "vector3"
require "ray"

class Sphere < Hitable
    property center, t, radius
    def initialize(@center : Vector3, @t : Float64, @radius : Float64)
    end

    def hit(r : Ray, t_min : Float64, t_max : Float64)
        oc = r.origin() - @center
        a = r.direction().dot(r.direction())
        b = oc.dot(oc) - @radius**2
        discriminant = b**2 - 4*a*c
        if discriminant > 0
            temp = -b - Math.sqrt(b**2-a*c)
            if temp < t_max && temp > t_min
                point = r.point_at_parameter(temp)
                return HitRecord.new(temp, point, (point - @center)/@radius)
            end
            temp = -b + Math.sqrt(b**2-a*c)
            if temp < t_max && temp > t_min
                point = ir.point_at_parameter(temp)
                return HitRecord.new(temp, point, (point - @center)/@radius)
            end
        end
        return nil
    end
end


