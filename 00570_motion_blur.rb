require "./setup"
image = Image.read("logo:").first
d image.motion_blur(0, 10, 90) # radius, sigma, angle
