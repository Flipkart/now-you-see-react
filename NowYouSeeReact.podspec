Pod::Spec.new do |s|
  s.name             = 'NowYouSeeReact'
  s.version          = '1.0.0'
  s.summary          = 'View tracking framework for React Native on iOS'
  
  s.description      = <<-DESC
  'NowYouSeeReact adds support for react native views on top of the iOS tracking framework NowYouSeeMe.'
  DESC
  
  s.homepage         = 'https://github.com/Flipkart/now-you-see-react'
  s.license          = { :type => 'Apache, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'naveen-c' => 'naveen.c@flipkart.com' }
  s.source           = { :git => 'https://github.com/Flipkart/now-you-see-react.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '10.0'
  s.swift_version = '5'
  
  s.source_files = 'Source/Classes/**/*.{h,m,swift}'
  s.resource_bundles =  { 'NowYouSeeReact' => ['Source/**/*.{xcassets,xib,storyboard}'] } 
  
  s.dependency 'NowYouSeeMe'
  s.dependency 'React-Core'
  
end
