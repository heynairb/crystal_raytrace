require "vector3"
require "ray"


def hit_sphere(center : Vector3, radius : Float64, r : Ray)
    oc = r.origin() - center
    a = r.direction().dot(r.direction())
    b = 2.0 * oc.dot(r.direction())
    c= oc.dot(oc) - radius**2
    discriminant = b**2 - 4*a*c
    if discriminant < 0
        return -1.0
    else
        return (-b - Math.sqrt(discriminant)) / (2.0 * a)
    end
end

def color(r : Ray)
    t = hit_sphere(Vector3.new(0,0,-1), 0.5, r)
    if t > 0.0
        n = (r.point_at_parameter(t) - Vector3.new(0,0,-1)).create_unit_vector()
        return 0.5 * Vector3.new(n.x + 1, n.y + 1, n.z + 1)
    end
    unit_direction = r.direction().create_unit_vector()
    t = 0.5 * (unit_direction.y() + 1.0)
    (Float64.new(1) - t) * Vector3.new(1.0, 1.0, 1.0)  + t * Vector3.new(0.5, 0.7, 1.0)
end

nx = 200
ny = 100
puts "P3\n#{nx} #{ny}\n255\n"
lower_left_corner = Vector3.new(-2.0, -1.0, -1.0)
horizontal = Vector3.new(4.0, 0.0, 0.0)
vertical = Vector3.new(0.0, 2.0, 0.0)
origin = Vector3.new(0.0, 0.0, 0.0)
(0...ny).reverse_each { |j|
    (0...nx).each { |i|
        u = (Float64.new i) / (Float64.new nx)
        v = (Float64.new j) / (Float64.new ny)
        r = Ray.new(origin, lower_left_corner + u*horizontal + v*vertical)
        col = color(r)
        ir = Int64.new (255.99*col[0])
        ig = Int64.new (255.99*col[1])
        ib = Int64.new (255.99*col[2])
        puts "#{ir} #{ig} #{ib}\n"
    }
}
