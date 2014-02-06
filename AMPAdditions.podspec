Pod::Spec.new do |s|
  s.name     = 'AMPAdditions'
  s.version  = '0.8'
  s.license  = 'MIT'
  s.summary  = 'AMPAdditions: some categories and classes for improve the iOS Development.'
  s.homepage = 'https://github.com/alexito4/UIKit-AMPAdditions'
  s.authors  = {
  	'Alejandro Martinez' => 'alexito4@gmail.com'
  }
  s.source   = { 
  	:git => 'https://github.com/alexito4/UIKit-AMPAdditions.git'
  }

#  s.dependency 'BlocksKit', '~> 2.0.0'

  s.platform = :ios
  s.source_files = 'AMPAdditions/', 'AMPAdditions/**/*.{h,m}'
  s.requires_arc = true

  s.framework = 'MapKit', 'QuartzCore', 'CoreImage', 'CoreGraphics'
  #s.prefix_header_contents = "#import <SystemConfiguration/SystemConfiguration.h>"
end