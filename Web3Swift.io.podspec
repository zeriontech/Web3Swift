Pod::Spec.new do |s|
  s.name             = 'Web3Swift.io'
  s.version          = '0.0.3'
  s.summary          = 'Web3 library for Swift. Construct and sign transactions, interact with smart contracts.'

  s.description      = <<-DESC
Ethereum client library written in pure Swift.
Sign transactions and messages, interact with smart contracts,
encode and decode ABI messages. 
                       DESC

  s.homepage         = 'https://github.com/zeriontech/Web3Swift'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 
    'Timofey Solonin' => 'abdulowork@gmail.com',
    'Vadim Koleoshkin' => 'vadim@koleoshkin.com'
  }
  s.source           = { :git => 'https://github.com/zeriontech/Web3Swift.git', :tag => s.version.to_s }
  s.homepage         = 'https://web3swift.io'

  s.ios.deployment_target = '10.0'

  s.module_name = 'Web3Swift'
  s.source_files = 'Web3Swift/**/*'
  s.dependency 'SwiftyJSON', '~> 4.3'
  s.dependency 'secp256k1_ios', '~> 0.1'
  s.dependency 'CryptoSwift', '~> 1.0'
  s.dependency 'BigInt', '~> 5.0'

end
