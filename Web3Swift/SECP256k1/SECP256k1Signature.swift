//
// Created by Timofey on 2/3/18.
//

import CryptoSwift
import Foundation
import secp256k1_ios

public final class IncorrectHashLengthError: DescribedError {

    private let length: Int
    public init(length: Int) {
        self.length = length
    }

    public var description: String {
        return "Hashing function produced digest of length \(self.length) when 32 was expected"
    }

}

public final class SigningError: DescribedError {

    private let hash: Array<UInt8>
    public init(hash: Array<UInt8>) {
        self.hash = hash
    }

    public var description: String {
        return "Libsecp256k1 failed raw signature for hash \(self.hash.toHexString())"
    }

}

public final class SignatureSerializationError: DescribedError {

    private let rs: Array<UInt8>
    private let recoveryID: Int32
    private let signature: secp256k1_ecdsa_recoverable_signature
    public init(
        rs: Array<UInt8>,
        recoveryID: Int32,
        signature: secp256k1_ecdsa_recoverable_signature
    ) {
        self.rs = rs
        self.recoveryID = recoveryID
        self.signature = signature
    }

    public var description: String {
        var tmp = signature.data
        let signatureHex: String = Array<UInt8>(
            UnsafeBufferPointer(
                start: &tmp.0,
                count: MemoryLayout.size(ofValue: tmp)
            )
        ).toHexString()
        return "Libsecp256k1 failed to serialize for raw signature\n" +
            "Raw signature hex: \(signatureHex)\n" +
            "RS value: \(self.rs.toHexString())\n" +
            "Recovery id: \(self.recoveryID)"
    }

}

/// This is an object that represents EC recoverable signature for EC secp256k1.
public final class SECP256k1Signature: ECRecoverableSignature {

    // swiftlint:disable:next large_tuple
    private let stickyComputation: StickyComputation<(r: Data, s: Data, recoveryID: UInt8)>

    //FIXME: Design is bad. There is no need to pass message and hashFunction at the same time.
    /**
        ctor

        - parameters:
            - privateKey: private key as defined in ecdsa
            - message: message as fined in ecdsa
            - hashFunction: hashing function that is used to compute message hash
    */
    init(
        privateKey: Array<UInt8>,
        message: Array<UInt8>,
        hashFunction: @escaping (Array<UInt8>) -> (Array<UInt8>)
    ) {
        stickyComputation = StickyComputation{
            var hash = hashFunction(message)
            guard hash.count == 32 else { throw IncorrectHashLengthError(length: hash.count) }
            var signature: secp256k1_ecdsa_recoverable_signature = secp256k1_ecdsa_recoverable_signature()
            var privateKey = privateKey
            guard secp256k1_ecdsa_sign_recoverable(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY)),
                &signature,
                &hash,
                &privateKey,
                nil,
                nil
            ) == 1 else {
                throw SigningError(hash: hash)
            }
            var rs: Array<UInt8> = Array<UInt8>(repeating: 0, count: 64)
            var recoveryID: Int32 = -1
            guard secp256k1_ecdsa_recoverable_signature_serialize_compact(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY)),
                &rs,
                &recoveryID,
                &signature
            ) == 1 && (0...255).contains(recoveryID) else {
                throw SignatureSerializationError(
                    rs: rs,
                    recoveryID: recoveryID,
                    signature: signature
                )
            }
            return (
                r: Data(bytes: rs.prefix(32)),
                s: Data(bytes: rs.suffix(32)),
                recoveryID: UInt8(recoveryID)
            )
        }
    }

    /**
        R point as defined in ecdsa

        - returns:
        32 byte `Data`

        - throws:
        `DescribedError` if something went wrong
    */
    public func r() throws -> Data {
        return try stickyComputation.result().r
    }

    /**
        S point as defined in ecdsa

        - returns:
        32 byte `Data`

        - throws:
        `DescribedError` if something went wrong
    */
    public func s() throws -> Data {
        return try stickyComputation.result().s
    }

    /**
        Recovery id as defined in ecdsa

        - returns:
        a single byte from 0 to 3

        - throws:
        `DescribedError` if something went wrong
    */
    public func recoverID() throws -> UInt8 {
        return try stickyComputation.result().recoveryID
    }

}
