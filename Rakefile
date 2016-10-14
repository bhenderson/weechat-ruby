require 'rubygems'

VERSION = "0.2.0"

require 'rubygems'
require 'hoe'
require 'isolate/rake'

Hoe.plugin :isolate
Hoe.plugin :version, :git

Hoe.spec 'weechat-bhenderson' do
  developer 'Brian Henderson', 'henderson.bj@gmail.com'

  self.testlib     = :none
  self.urls        = ["https://github.com/bhenderson/weechat-ruby"]
  self.summary     = "An abstraction layer on top of the WeeChat API"
  self.description = self.summary + ", allowing a cleaner and more intuitive way of writing Ruby scripts for WeeChat."
  self.license "GPL3"
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
  end
rescue LoadError
end
