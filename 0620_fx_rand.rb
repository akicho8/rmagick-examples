require "./setup"
layer = Image.read("logo:").first
d layer.fx("p * 0.5")
d layer.fx("p * 0.75 + rand() * 0.3")
d layer.fx("p * 0.50 + rand() * 0.3")
d layer.fx("p * 0.25 + rand() * 0.3")
