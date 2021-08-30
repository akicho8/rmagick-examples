require "pathname"

task :default => :test

task :test do
  Pathname.glob("0*") do |e|
    puts e
    system "ruby #{e}"
    unless $?.success?
      p $?
    end
  end
end

# task :clean do
#   FileUtils.rm_rf("_*", verbose: true, noop: true)
# end
