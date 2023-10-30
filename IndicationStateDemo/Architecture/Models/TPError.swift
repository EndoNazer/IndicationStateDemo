//
//  TPError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol TPError: Error {
    var type: ErrorType { get }
}

enum ErrorType {
    case fullscreen(error: FullscreenError)
    case toast(error: ToastError)
    case custom(error: CustomError)
}

// Type-Erasure для TPError
struct AnyTPError: TPError {
    private var base: TPError

    init(_ base: TPError) {
        self.base = base
    }

    var type: ErrorType {
        get {
            base.type
        }
    }
}
