Pod::Spec.new do |spec|
  spec.name         = 'GradientKit'
  spec.summary      = 'A simpler way to implement simple gradients on iOS.'
  spec.version      = '1.0'
  spec.license      = { :type => 'MIT' }
  spec.authors      =  { 'Joe Fabisevich' => 'github@fabisevi.ch' }
  spec.source_files = 'Source/*.swift'
  spec.homepage = 'https://github.com/mergesort'
  spec.source  = { :git => 'https://github.com/mergesort/GradientKit.git', :tag => "#{spec.version}" }

  spec.ios.deployment_target = '9.0'
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/mergesort'
  spec.framework = 'UIKit'
end