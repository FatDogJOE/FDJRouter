#
# Be sure to run `pod lib lint FDJRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FDJRouter'
  s.version          = '0.1.0-beta.2'
  s.summary          = '一个可以处理页面之间传值的Router'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "一个可以处理页面之间传值的Router，页面任务完成以后会有回调"

  s.homepage         = 'https://github.com/FatDogJOE/FDJRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'likethephoenix@163.com' => 'likethephoenix@163.com' }
  s.source           = { :git => 'https://github.com/FatDogJOE/FDJRouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FDJRouter/Classes/**/*'
  s.public_header_files = 'FDJRouter/Classes/**/*.h'
  
  # s.resource_bundles = {
  #   'FDJRouter' => ['FDJRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
