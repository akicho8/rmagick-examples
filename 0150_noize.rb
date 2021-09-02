require "./setup"
image = Magick::Image.read("logo:").first

tp Magick::NoiseType.values

d image.add_noise(Magick::ImpulseNoise)

Magick::NoiseType.values { |e| d image.add_noise(e) }

# >> |-----------------------------|
# >> | UniformNoise                |
# >> | GaussianNoise               |
# >> | MultiplicativeGaussianNoise |
# >> | ImpulseNoise                |
# >> | LaplacianNoise              |
# >> | PoissonNoise                |
# >> | RandomNoise                 |
# >> |-----------------------------|
