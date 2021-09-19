require "./setup"
class App
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def run
    canvas = Image.new(*params[:rect]) { |e| e.background_color = params[:base_color] }
    w, h = params.values_at(:w, :h)
    (canvas.rows.fdiv(h)).ceil.times do |y|
      (canvas.columns.fdiv(w)).ceil.times do |x|
        if (x + y).even?
          g = Draw.new
          g.fill(params[:accent_color])
          g.rectangle(x * w, y * h, x * w + w - 1, y * h + h - 1)
          g.draw(canvas)
        end
      end
    end
    file = Pathname(output)
    FileUtils.makedirs(file.dirname)
    canvas.write("PNG24:#{file}")
  end

  def output
    params[:output] || "_checker.png"
  end
end

if true
  rows = [
    { name: "light", rect: Rect[1920, 1080], base_color: "#fff", accent_color: "rgba(  0,  0,  0,0.05)", w: 16, h: 16 },
    { name: "dark",  rect: Rect[1920, 1080], base_color: "#333", accent_color: "rgba(255,255,255,0.05)", w: 16, h: 16 },
  ].collect.with_index do |params, i|
    App.new(params.merge(output: "_checker/checker_#{params[:name]}.png")).run
    App.new(params.merge(output: "../bioshogi/lib/bioshogi/assets/images/background/checker_#{params[:name]}.png")).run
  end
  `open _checker`
end

# >> |---------------|
# >> | file          |
# >> |---------------|
# >> | checker/0.png |
# >> | checker/1.png |
# >> |---------------|