Pod::Spec.new do |s|
  s.name             = 'Web3Swift.io'
  s.version          = '0.0.1'
  s.summary          = 'Web3 library in Swift'

  s.description      = <<-DESC
  Ethereum client library written in pure Swift.
                       DESC

  s.homepage         = 'https://github.com/zeriontech/Web3Swift'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 
    'Timofey Solonin' => 'abdulowork@gmail.com',
    'Vadim Koleoshkin' => 'vadim@zerion.io'
  }
  s.source           = { :git => 'https://github.com/zeriontech/Web3Swift.git', :tag => s.version.to_s }
  s.homepage         = 'https://web3swift.io'

  s.ios.deployment_target = '9.0'

  s.module_name = 'Web3Swift'
  s.source_files = 'Web3Swift/**/*'
  s.dependency 'SwiftyJSON', '= 4.1.0'
  s.dependency 'secp256k1_ios', '= 0.1.1'
  s.dependency 'CryptoSwift', '= 0.9.0'
  s.dependency 'BigInt.swift', '= 1.0.0'

end
