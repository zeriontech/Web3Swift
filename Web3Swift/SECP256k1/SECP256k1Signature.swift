//
// Created by Timofey on 2/3/18.
//

import CryptoSwift
import Foundation
import secp256k1_ios

final class IncorrectHashLengthError: Swift.Error {}

final class SigningError: Swift.Error {}

final class SignatureSerializationError: Swift.Error {}

final class SECP256k1Signature: ECRecoverableSignature {

    private let stickyComputation: StickyComputation<(r: Data, s: Data, recoveryID: UInt8)>
    //FIXME: Design is bad. There is no need to pass message and hashFunction at the same time.
    init(
        privateKey: Array<UInt8>,
        message: Array<UInt8>,
        hashFunction: @escaping (Array<UInt8>) -> (Array<UInt8>),
        entropy: Entropy
    ) {
        stickyComputation = StickyComputation{

            var hash = hashFunction(message)
            guard hash.count == 32 else { throw IncorrectHashLengthError() }
            var signature: secp256k1_ecdsa_recoverable_signature = secp256k1_ecdsa_recoverable_signature()
            var privateKey = privateKey
            var entropy = try Array(entropy.toData())
            guard secp256k1_ecdsa_sign_recoverable(
                secp256k1_context_create(UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY)),
                &signature,
                &hash,
                &privateKey,
                secp256k1_nonce_function_rfc6979,
                &entropy
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

    func r() throws -> Data {
        return try stickyComputation.result().r
    }

    func s() throws -> Data {
        return try stickyComputation.result().s
    }

    func recoverID() throws -> UInt8 {
        return try stickyComputation.result().recoveryID
    }

}
