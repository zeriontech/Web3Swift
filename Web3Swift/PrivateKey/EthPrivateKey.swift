//
// Created by Timofey on 3/7/18.
//

import CryptoSwift
import Foundation
import secp256k1_ios

private final class InvalidPrivateKeyError: DescribedError {

    var description: String {
        return "Private key was incorrect"
    }

}

private final class UnableToSerializePublicKeyError: DescribedError {

    var description: String {
        return "Could not serialize public key for unknown reason"
    }

}

public final class EthPrivateKey: PrivateKey {

    private let bytes: BytesScalar
    init(bytes: BytesScalar) {
        self.bytes = FixedLengthBytes(
            origin: bytes,
            length: 32
        )
    }

    public func value() throws -> Data {
        return try bytes.value()
    }

    //TODO: I have no idea how to decompose that cryptography in a reasonable way. Let's leave the comments for a bit of explanation aid for now
    //swiftlint:disable function_body_comments
    public func address() throws -> BytesScalar {
        let bytes = self.bytes
        return SimpleBytes{
            var publicKeyStructure = secp256k1_pubkey()
            var privateKey = try Array<UInt8>(bytes.value())
            guard secp256k1_ec_pubkey_create(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN) | UInt32(SECP256K1_CONTEXT_VERIFY)),
                &publicKeyStructure,
                &privateKey
            ) == 1 else {
                throw InvalidPrivateKeyError()
            }
            var publicKey = Array<UInt8>(repeating: 0x00, count: 65)
            var outputLength = Int(65) //header byte + the public key itself
            guard secp256k1_ec_pubkey_serialize(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN) | UInt32(SECP256K1_CONTEXT_VERIFY)),
                &publicKey,
                &outputLength,
                &publicKeyStructure,
                UInt32(SECP256K1_EC_UNCOMPRESSED)
            ) == 1 else {
                throw UnableToSerializePublicKeyError()
            }
            return Data(
                bytes: SHA3(
                    variant: .keccak256
                ).calculate(
                    for: Array(publicKey.dropFirst()) //We need to drop the first value because its a header byte
                ).suffix(20)
            )
        }
    }

}