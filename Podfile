# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def code_quality
    pod 'SwiftLint'
    pod 'QNRequest', '~> 1.3.2'
end

def available_pods
    use_frameworks!
    code_quality
    
end

target 'iPOSBilling' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  available_pods
end




post_install do |installer|
  
    installer.pods_project.build_configurations.each do |config|
        print "Setting the default SWIFT_VERSION to 5.0\n"
        config.build_settings['SWIFT_VERSION'] = '5.0'
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
    
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
       config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
       config.build_settings.delete 'ARCHS'
      end
     end
    
    installer.pods_project.targets.each do |target|
       if ['DisplaySwitcher','Kingfisher', 'SlideMenuControllerSwift', 'KMPlaceholderTextView'].include? "#{target}"
          print "Setting #{target}'s SWIFT_VERSION to 4.0\n"
          target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
          end
       end
    end
end

