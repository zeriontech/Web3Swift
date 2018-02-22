//
// Created by Timofey on 2/3/18.
//

import CryptoSwift
import Foundation
import secp256k1_ios

public final class IncorrectHashLengthError: Swift.Error {}

public final class SigningError: Swift.Error {}

public final class SignatureSerializationError: Swift.Error {}

/// This is an object that represents EC recoverable signature for EC secp256k1.
public final class SECP256k1Signature: ECRecoverableSignature {

    // swiftlint:disable:next large_tuple
    private let stickyComputation: StickyComputation<(r: Data, s: Data, recoveryID: UInt8)>

    //FIXME: Design is bad. There is no need to pass message and hashFunction at the same time.
    /// ctor
    ///
    /// - Parameters:
    ///   - privateKey: private key as defined in ecdsa
    ///   - message: message as fined in ecdsa
    ///   - hashFunction: hashing function that is used to compute message hash
    init(
        privateKey: Array<UInt8>,
        message: Array<UInt8>,
        hashFunction: @escaping (Array<UInt8>) -> (Array<UInt8>)
    ) {
        stickyComputation = StickyComputation{

            var hash = hashFunction(message)
            guard hash.count == 32 else { throw IncorrectHashLengthError() }
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
                throw SigningError()
            }

            var rs: Array<UInt8> = Array<UInt8>(repeating: 0, count: 64)
            var recoveryID: Int32 = -1
            guard secp256k1_ecdsa_recoverable_signature_serialize_compact(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY)),
                &rs,
                &recoveryID,
                &signature
            ) == 1 && (0...255).contains(recoveryID) else {
                throw SignatureSerializationError()
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
        `Swift.Error` if something went wrong
    */
    public func r() throws -> Data {
        return try stickyComputation.result().r
    }

    /**
        S point as defined in ecdsa

        - returns:
        32 byte `Data`

        - throws:
        `Swift.Error` if something went wrong
    */
    public func s() throws -> Data {
        return try stickyComputation.result().s
    }

    /**
        Recovery id as defined in ecdsa

        - returns:
        a single byte from 0 to 3

        - throws:
        Swift.Error if something went wrong
    */
    public func recoverID() throws -> UInt8 {
        return try stickyComputation.result().recoveryID
    }

}
