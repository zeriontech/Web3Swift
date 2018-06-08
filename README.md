# Web3Swift

[![CI Status](http://img.shields.io/travis/BlockStoreApp/Web3Swift.svg?style=flat)](https://travis-ci.org/BlockStoreApp/Web3Swift)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![codecov](https://codecov.io/gh/BlockStoreApp/Web3Swift/branch/develop/graph/badge.svg?token=SY7mpMQbGs)](https://codecov.io/gh/BlockStoreApp/Web3Swift)

## Installation

Web3Swift is available through [CocoaPods](http://cocoapods.org).
To install it, simply add the following line to your Podfile:

```ruby
pod 'Web3Swift', :git => 'https://github.com/BlockStoreApp/Web3Swift.git'
```

## Sending ether

To send some wei from an account with a private key `0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5` to an account with an address `0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403` on a mainnet:

```swift
import Web3Swift

func send(weiAmount: Int) throws {
    let sender: PrivateKey = EthPrivateKey(
        hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
    )
    let recipient: BytesScalar = EthAddress(
        hex: "0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403"
    )
    let network = InfuraNetwork(chain: "mainnet", apiKey: "metamask")
    _ = try SendRawTransactionProcedure(
        network: network,
        transactionBytes: EthDirectTransactionBytes(
            network: network,
            senderKey: sender,
            recipientAddress: recipient,
            weiAmount: EthNumber(value: weiAmount) 
        )
    ).call()
}
```

If you want to specify gas price or gas amount take a look at [`EthDirectTransactionBytes.swift`](https://github.com/BlockStoreApp/Web3Swift/blob/develop/Web3Swift/TransactionBytes/EthDirectTransactionBytes.swift).

To send ether instead of wei:

```swift
func send(ethAmount: Int) throws {
	...
	_ = try SendRawTransactionProcedure(
		..., 
		weiAmount: EthToWei(amount: ethAmount)
	).call()
}
```

## Author

- Timofey Solonin [@biboran](https://github.com/biboran), abdulowork@gmail.com
- Vadim Koleoshkin [@rockfridrich](https://github.com/rockfridrich), vadim@zerion.io

## License

Web3Swift is available under the Apache License 2.0. See the LICENSE file for more info.
