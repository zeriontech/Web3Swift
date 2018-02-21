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

    func testIncorrectHashingFunction() {
        expect(
            try SECP256k1Signature(
                privateKey: self.validPrivateKey,
                message: Array("Hello world".utf8),
                hashFunction: SHA3(variant: .keccak224).calculate,
                entropy: RandomNonce(size: 32)
            ).r()
        ).to(
            throwError(errorType: IncorrectHashLengthError.self)
        )
    }

    func testEqualSignatures() {
        let nonce = RandomNonce(size: 32)

        let firstSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        expect(
            try firstSignature.r() == secondSignature.r()
                && firstSignature.s() == secondSignature.s()
                && firstSignature.recoverID() == secondSignature.recoverID()
        ).to(
            equal(true)
        )
    }

    func testDifferentNonce() {
        let firstSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: RandomNonce(size: 32)
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: RandomNonce(size: 32)
        )

        expect(
            try firstSignature.r() == secondSignature.r()
                && firstSignature.s() == secondSignature.s()
                && firstSignature.recoverID() == secondSignature.recoverID()
        ).to(
            equal(false)
        )
    }

    func testDifferentMessages() {
        let nonce = RandomNonce(size: 32)

        let firstSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello world".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: Array("Hello worlds".utf8),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        expect(
            try firstSignature.r() == secondSignature.r()
                && firstSignature.s() == secondSignature.s()
                && firstSignature.recoverID() == secondSignature.recoverID()
        ).to(
            equal(false)
        )
    }

    private func testFirstExample() {
        let signature = SECP256k1Signature(
            privateKey: Array(hex: "0x4646464646464646464646464646464646464646464646464646464646464646"),
            message: Array(hex: "0xec098504a817c800825208943535353535353535353535353535353535353535880de0b6b3a764000080018080"),
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: RandomNonce(size: 32)
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

}
