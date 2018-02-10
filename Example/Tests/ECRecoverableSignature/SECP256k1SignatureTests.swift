//
// Created by Timofey on 2/10/18.
// Copyright (c) 2018 CocoaPods. All rights reserved.
//

import Foundation

import Quick
import Nimble
import XCTest
import CryptoSwift
@testable import Web3Swift

//FIXME: SigningError case is not tested
//FIXME: SignatureSerializationError case is not tested
//FIXME: A lot of copy paste tests.
final class SECP256k1SignatureTests: XCTestCase {

    private let validPrivateKey = Data(hex: "bdd61bcde5541ac8ad18c0ec53356419a0e62e8f147a1cc16ea36799e2cc64dd").map{$0}

    func testIncorrectHashingFunction() {
        expect(
            try SECP256k1Signature(
                privateKey: self.validPrivateKey,
                message: "Hello world".utf8.map{$0},
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
            message: "Hello world".utf8.map{$0},
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: "Hello world".utf8.map{$0},
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
            message: "Hello world".utf8.map{$0},
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: RandomNonce(size: 32)
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: "Hello world".utf8.map{$0},
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
            message: "Hello world".utf8.map{$0},
            hashFunction: SHA3(variant: .keccak256).calculate,
            entropy: nonce
        )

        let secondSignature = SECP256k1Signature(
            privateKey: self.validPrivateKey,
            message: "Hello worlds".utf8.map{$0},
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

}