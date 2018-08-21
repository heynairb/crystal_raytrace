require "vector3"
require "ray"

def color(r : Ray)
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
