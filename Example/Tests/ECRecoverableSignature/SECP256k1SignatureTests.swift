//
// Created by Timofey on 2/10/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Foundation

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift
import XCTest

//FIXME: SigningError case is not tested
//FIXME: SignatureSerializationError case is not tested
//FIXME: A lot of copy paste tests.
final class SECP256k1SignatureTests: XCTestCase {

    private let validPrivateKey: [UInt8] = Array(hex: "bdd61bcde5541ac8ad18c0ec53356419a0e62e8f147a1cc16ea36799e2cc64dd")

    /// Assert incorrect hashing function throws error
    func testIncorrectHashingFunction() {
        expect(
            try SECP256k1Signature(
                privateKey: self.validPrivateKey,
                message: Array("Hello world".utf8),
                hashFunction: SHA3(variant: .keccak224).calculate
            ).r()
        ).to(
            throwError(errorType: IncorrectHashLengthError.self)
        )
    }

    /// Assert two signature with same message are equal
    func testEqualSignatures() {

        let firstSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate
        )

        expect(
            try firstSignature.r() == secondSignature.r()
                && firstSignature.s() == secondSignature.s()
                && firstSignature.recoverID() == secondSignature.recoverID()
        ).to(
            equal(true)
        )
    }

    /// Assert two signatures with different messages are not equal
    func testDifferentMessages() {

        let firstSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello worlds".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate
        )

        expect(
            try firstSignature.r() == secondSignature.r()
                && firstSignature.s() == secondSignature.s()
                && firstSignature.recoverID() == secondSignature.recoverID()
        ).to(
            equal(false)
        )
    }

    /// Assert example from EIP-155 matches SECP256k1Signature implementation
    func testOneRawMessage() {
        let signature = SECP256k1Signature(
            privateKey: Array(hex: "0x4646464646464646464646464646464646464646464646464646464646464646"),
            message: Array(hex: "0xec098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a764000080018080"),
            hashFunction: SHA3(variant: .keccak256).calculate
        )
        expect{
            try signature.r()
        }.to(
            equal(
                Data(hex: "0x28ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276")
            )
        )
        expect{
            try signature.s()
        }.to(
            equal(
                Data(hex: "0x67cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83")
            )
        )
    }

    /// Assert example from EIP-155 matches SECP256k1Signature implementation dependent upon SimpleRLP implementation
    func testOneRLP() {
        let signature: SECP256k1Signature
        do {
            signature = try SECP256k1Signature(
                privateKey: Array(hex: "0x4646464646464646464646464646464646464646464646464646464646464646"),
                message: Array(
                    SimpleRLP(
                        rlps: [
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x09" //nonce
                                )
                            ),
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x04a817c800" //gas price
                                )
                            ),
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x5208" //start gas
                                )
                            ),
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x3535353535353535353535353535353535353535" //to
                                )
                            ),
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x0de0b6b3a7640000" //value
                                )
                            ),
                            SimpleRLP(
                                bytes: Data() //data
                            ),
                            SimpleRLP(
                                bytes: Data(
                                    hex: "0x01" //chain id (mainnet in this case)
                                )
                            ),
                            SimpleRLP(
                                bytes: Data() //stubbed r according to EIP-155
                            ),
                            SimpleRLP(
                                bytes: Data() //stubbed s according to EIP-155
                            ),
                        ]
                    ).toData()
                ),
                hashFunction: SHA3(variant: .keccak256).calculate
            )
        } catch let err {
            expect { throw err }.toNot(throwError()); return
        }

        expect{
            try signature.r()
        }.to(
            equal(
                Data(hex: "0x28ef61340bd939bc2195fe537567866003e1a15d3c71ff63e1590620aa636276")
            )
        )
        expect{
            try signature.s()
        }.to(
            equal(
                Data(hex: "0x67cbe9d8997f761aecb703304b3800ccf555c9f3dc64214b297fb1966a3b6d83")
            )
        )
    }

}
