//
// Created by Timofey on 3/12/18.
//

import Foundation

private final class IncorrectNumberOfElementsError<T>: DescribedError {

    private let collection: AnyCollection<T>
    init(collection: AnyCollection<T>) {
        self.collection = collection
    }

    var description: String {
        return "Collection was expected to have 1 element but had \(collection.count)"
    }

}

extension Collection {

    func single() throws -> Self.Element {
        if self.count == 1, let first = self.first {
            return first
        } else {
            throw IncorrectNumberOfElementsError(
                collection: AnyCollection<Self.Element>(Array(self))
            )
        }
    }

}