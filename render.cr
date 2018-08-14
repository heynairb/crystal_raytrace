require "vector3"

nx = 200
ny = 100
puts "P3\n#{nx} #{ny}\n255\n"
(0...ny).reverse_each { |j|
    (0...nx).each { |i|
        r = (Float64.new i) / (Float64.new nx)
        g = (Float64.new j) / (Float64.new ny)
        b = 0.2
        color = Vector3.new(r,g,b)
        ir = Int64.new (255.99*color.r)
        ig = Int64.new (255.99*color.g)
        ib = Int64.new (255.99*color.b)
        puts "#{ir} #{ig} #{ib}\n"
    }
}
