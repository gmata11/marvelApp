//
//  MockCancellable.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation
import Moya

class MockCancellable: Cancellable {

    static var `default`: MockCancellable { MockCancellable() }

    var isCancelled: Bool = false

    func cancel() {
        isCancelled = true
    }

}
