# Web3Swift

[![CI Status](http://img.shields.io/travis/BlockStoreApp/Web3Swift.svg?style=flat)](https://travis-ci.org/BlockStoreApp/Web3Swift)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![codecov](https://codecov.io/gh/BlockStoreApp/Web3Swift/branch/develop/graph/badge.svg?token=SY7mpMQbGs)](https://codecov.io/gh/BlockStoreApp/Web3Swift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### CocoaPods

Web3 is available through [CocoaPods](https://cocoapods.org/pods/Web3Sw1ft). To install
it, simply add the following line to your `Podfile`:

```ruby
pod 'Web3Sw1ft'
```

## Dealing with ERC-20 tokens

### Sending tokens to an address

To send some ERC-20 tokens, for example [OmiseGO](https://etherscan.io/token/OmiseGo), we need to get the smart contract address. 
OMG tokens are managed by smart contract at `0xd26114cd6EE289AccF82350c8d8487fedB8A0C07`. 
In this example we send token from an account with a private key `0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5` to an account with an address `0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403` on a mainnet:

```swift
import Web3Swift

let network: Network = InfuraNetwork(
    chain: "mainnet", apiKey: "metamask"
)

let sender: PrivateKey = EthPrivateKey(
    hex: "0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5"
)

let recipient: BytesScalar = EthAddress(
    hex: "0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403"
)

let token: BytesScalar = EthAddress(
    hex: "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07"
)

let amount: BytesScalar = EthNumber(
    hex: "0xde0b6b3a7640000" // 10^18 in hex that represents 1 OMG token
)

let response = try SendRawTransactionProcedure(
    network: network,
    transactionBytes: EthContractCallBytes(
        network: network,
        senderKey: sender,
        contractAddress: token,
        weiAmount: EthNumber(
            hex: "0x00" //We do not need to provide ethers to not payable functions.
        ),
        functionCall: EncodedABIFunction(
            signature: SimpleString(
                string: "transfer(address,uint256)"
            ),
            parameters: [
                ABIAddress(
                    address: recipient
                ),
                ABIUnsignedNumber(
                    origin: amount
                )
            ]
        )
    )
).call()

//If Ethereum network accepts the transaction, you could get transaction hash from the response. Otherwise, library will throw `DescribedError`
print(response["result"].string ?? "Something went wrong")
```

You can swiftly deal with other ERC-20 functions just by encoding another `EncodedABIFunction` .

### Sending delegated tokens to an address 

Here is an example of encoding `transferFrom(from,to,value)` function

```swift
EncodedABIFunction(
    signature: SimpleString(
        string: "transferFrom(address,address,uint256)"
    ),
    parameters: [
        ABIAddress(
            address: EthAddress(
                hex: "0xFBb1b73C4f0BDa4f67dcA266ce6Ef42f520fBB98"
            )
        ),
        ABIAddress(
            address: EthAddress(
                hex: "0x79d2c50Ba0cA4a2C6F8D65eBa1358bEfc1cFD403"
            )
        ),
        ABIUnsignedNumber(
            origin: EthNumber(
                hex: "0x01"
            )
        )
    ]
)
```
More encoding example including advanced ones are placed at [`Example/Tests/ABI`](https://github.com/zeriontech/Web3Swift/tree/develop/Example/Tests/ABI)

### Checking an address balance
You do not need to send transaction for reading data from a smart contract. Here is an example of checking address balance by making a call to smart contract function `balanceOf(owner)`.

```swift
let balance = try HexAsDecimalString(
    hex: EthContractCall(
        network: InfuraNetwork(
            chain: "mainnet", apiKey: "metamask"
        ),
        contractAddress: EthAddress(
            hex: "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07" //OmiseGO token contract
        ),
        functionCall: EncodedABIFunction(
            signature: SimpleString(
                string: "balanceOf(address)"
            ),
            parameters: [
                ABIAddress(
                    address: EthAddress(
                        hex: "0xFBb1b73C4f0BDa4f67dcA266ce6Ef42f520fBB98" //Bittrex 
                    )
                )
            ]
        )
    )
).value()

print(balance) // 13098857909137917398909558 is 13 098 857.909137917398909558 OMG tokens
```

## Author

- Timofey Solonin [@biboran](https://github.com/biboran), abdulowork@gmail.com
- Vadim Koleoshkin [@rockfridrich](https://github.com/rockfridrich), vadim@zerion.io

## License

Web3Swift is available under the Apache License 2.0. See the LICENSE file for more info.
