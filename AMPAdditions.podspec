Pod::Spec.new do |s|
  s.name     = 'AMPAdditions'
  s.version  = '0.10.6'
  s.summary  = 'AMPAdditions: some categories and classes for improve the iOS Development.'
  s.homepage = 'https://github.com/alexito4/AMPAdditions'
  s.author       = { "Alejandro Martínez" => "alexito4@gmail.com" }
  s.license      = { :type => 'MIT'}
  s.source       = { :git => "https://github.com/alexito4/AMPAdditions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexito4'

  s.platform = :ios, '7.0'
  s.requires_arc = true
  s.framework = 'MapKit', 'QuartzCore', 'CoreImage', 'CoreGraphics'
  s.source_files = 'AMPAdditions/', 'AMPAdditions/**/*.{h,m}'

end
