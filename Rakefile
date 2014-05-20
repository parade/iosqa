$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bubble-wrap'
provision_path = "./profiles/personal.mobileprovision"

Motion::Project::App.setup do |app|
  app.name = 'iOSQA'
  app.icons = [ "Icon", "icon_57x57@2x.png", "icon_37x37@2x.png", "icon_32x32@2x.png" ]
  app.prerendered_icon = true
  app.device_family = [:iphone, :ipad]
  if File.file?(provision_path)
    app.provisioning_profile = provision_path
  end
end
