$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'

Motion::Project::App.setup do |app|
  app.name = 'iOSQA'
  app.icons = [ "Parade" ]
  app.device_family = [:iphone, :ipad]
  app.provisioning_profile = "./profiles/personal.mobileprovision"
end
