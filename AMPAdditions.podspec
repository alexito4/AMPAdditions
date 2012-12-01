Pod::Spec.new do |s|
  s.name     = 'AMPAdditions'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'UIKit Additions: some categories for improve the iOS Development.'
  s.homepage = 'https://github.com/alexito4/UIKit-AMPAdditions'
  s.authors  = {
  	'Alejandro Martinez' => 'alexito4@gmail.com'
  }
  s.source   = { 
  	:git => 'https://github.com/alexito4/UIKit-AMPAdditions.git', 
  	#:tag => '0.9' 
  	:commit => 'ba32e99a2221e3a153c7148972febf4581855010'
  }
  s.platform = :ios
  s.source_files = 'AMPAdditions/'
  s.requires_arc = true

  #s.framework = 'SystemConfiguration'
  #s.prefix_header_contents = "#import <SystemConfiguration/SystemConfiguration.h>"
end