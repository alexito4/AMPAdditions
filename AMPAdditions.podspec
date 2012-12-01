Pod::Spec.new do |s|
  s.name     = 'AMPAdditions'
  s.version  = '0.0.2'
  s.license  = 'MIT'
  s.summary  = 'UIKit Additions: some categories for improve the iOS Development.'
  s.homepage = 'https://github.com/alexito4/UIKit-AMPAdditions'
  s.authors  = {
  	'Alejandro Martinez' => 'alexito4@gmail.com'
  }
  s.source   = { 
  	:git => 'https://github.com/alexito4/UIKit-AMPAdditions.git', 
  	#:tag => '0.9' 
  	:commit => 'aa931657d0c5787766ef95aa501c7a0c0f901a95'
  }
  s.platform = :ios
  s.source_files = 'AMPAdditions/'
  s.requires_arc = true

  #s.framework = 'SystemConfiguration'
  #s.prefix_header_contents = "#import <SystemConfiguration/SystemConfiguration.h>"
end