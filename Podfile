# Uncomment the next line to define a global platform for your project
platform :ios, '16.1'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

# Pods for CodeQuality
$SwiftLint = pod 'SwiftLint'

# Pods for UI
$TinyConstraints = pod 'TinyConstraints'

# Helper
$SwiftGen = pod 'SwiftGen', '~> 6.1'
$Kingfisher = pod 'Kingfisher'
$SwiftEntryKit = pod 'SwiftEntryKit', '~> 2.0'

workspace 'Movies'

target 'Movies' do

  project 'Movies.xcodeproj'
  
  # Pods for Movies
  $SwiftLint
  $TinyConstraints
  $SwiftEntryKit

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider

end

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Pods for Utilities

end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  $SwiftLint
  $SwiftGen
  $TinyConstraints
  $Kingfisher
  $SwiftEntryKit

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.1'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
