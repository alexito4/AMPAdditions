Pod::Spec.new do |s|
  s.name     = 'AMPAdditions'
  s.version  = '0.6.2'
  s.license  = 'MIT'
  s.summary  = 'AMPAdditions: some categories for improve the iOS Development.'
  s.homepage = 'https://github.com/alexito4/UIKit-AMPAdditions'
  s.authors  = {
  	'Alejandro Martinez' => 'alexito4@gmail.com'
  }
  s.source   = { 
  	:git => 'https://github.com/alexito4/UIKit-AMPAdditions.git'
  }

  s.dependency 'BlocksKit', '~> 1.8.1'

  s.platform = :ios
  s.source_files = 'AMPAdditions/'
  s.requires_arc = true

  s.framework = 'MapKit', 'QuartzCore', 'CoreImage', 'CoreGraphics'
  #s.prefix_header_contents = "#import <SystemConfiguration/SystemConfiguration.h>"
end