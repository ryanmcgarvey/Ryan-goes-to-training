require 'test/unit'
require 'shoulda'


#START:the_code
require 'fakefs/safe'
require 'stringio'
class FileSystemTest < Test::Unit::TestCase
  context "Playing with the file system" do
    setup do
      FakeFS.activate!
    end
  
    should "Write into the password file" do
      File.open("/etc/passwd", "w") do |f|
        f.write "Lol!!!1111! PWND!!!!"
      end
      assert_match /PWND/, File.read("/etc/passwd")
    end
  
    teardown do
      FakeFS.deactivate!
    end
  end
end
#END:the_code