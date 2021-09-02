require "./setup"
image = Magick::Image.read("logo:").first
d image.motion_blur(0, 10, 90 * 3) # radius, sigma, angle
