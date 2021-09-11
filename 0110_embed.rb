require "./setup"
d Image.read("netscape:").first
d Image.read("granite:").first
d Image.read("logo:").first
d Image.read("wizard:").first
d Image.read("rose:").first

d Image.read("null:") { |e| e.size = "800x600" }.first
d Image.read("plasma:red-blue") { |e| e.size = "800x600" }.first
d Image.read("gradient:white-blue") { |e| e.size = "800x600" }.first
d Image.read("xc:blue") { |e| e.size = "800x600" }.first
d Image.read("caption:foo bar") { |e| e.size = "800x600" }.first

