require "./setup"
tp NoiseType.values
image = Image.read("logo:").first
d image.add_noise(ImpulseNoise)
NoiseType.values do |e|
  d image.add_noise(e), e
end
# >> |-----------------------------|
# >> | UniformNoise                |
# >> | GaussianNoise               |
# >> | MultiplicativeGaussianNoise |
# >> | ImpulseNoise                |
# >> | LaplacianNoise              |
# >> | PoissonNoise                |
# >> | RandomNoise                 |
# >> |-----------------------------|
