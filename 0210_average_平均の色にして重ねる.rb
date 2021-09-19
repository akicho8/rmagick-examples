require "./setup"
list = ImageList.new("logo:", "rose:", "netscape:")
list.each { |e| e.resize!(800, 600) }
d list.average
