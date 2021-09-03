require "pathname"

task :default => :test
task :build => [:clean, :renum, :test]

task :test do
  Pathname.glob("0*") do |e|
    puts e
    system "ruby #{e}"
    unless $?.success?
      p $?
    end
  end
end

task :clean do
  Dir.chdir(__dir__) do
    FileUtils.rm_rf(Pathname.glob("_*"), verbose: true)
    FileUtils.rm_rf(Pathname.glob("xmp*"), verbose: true)
  end
end

task :renum do
  system "saferenum . -x"
end

