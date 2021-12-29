require "./setup"

gc = Draw.new
gc.font = "WebDings"
gc.pointsize = 24

metrics = gc.get_type_metrics("n")
metrics.width                   # => 24.0
metrics.height                  # => 24.0

metrics = gc.get_type_metrics("nn")
metrics.width                   # => 48.0
metrics.height                  # => 24.0
