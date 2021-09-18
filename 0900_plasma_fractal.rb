require "./setup"

d Image.read("plasma:fractal") { |e| e.size = "800x600" }.first
