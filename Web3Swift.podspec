Pod::Spec.new do |s|
  s.name             = 'Web3Swift'
  s.version          = '0.1.0'
  s.summary          = 'Blah blah blah.'

  s.description      = <<-DESC
  Blah blah blah blah.
                       DESC

  s.homepage         = 'https://github.com/BlockStoreApp/Web3Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'biboran' => 'tim-solonin2@yandex.ru' }
  s.source           = { :git => 'https://github.com/BlockStoreApp/Web3Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Web3Swift/**/*'
  s.dependency 'SwiftyJSON', '~> 4.0'

end
