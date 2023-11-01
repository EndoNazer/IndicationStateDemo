//
//  TPError.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol TPError: Error, ErrorModel {
    var type: ErrorType { get }
}

enum ErrorType {
    case fullscreen(error: FullscreenErrorModel)
    case toast(error: ToastModel)
    // Мб выпилить и оставить только общий custom
    case custom(error: CustomModel)
}

// Type-Erasure для TPError
struct AnyTPError: TPError {
    var type: ErrorType {
        get {
            base.type
        }
    }
    
    private var base: any TPError

    init(_ base: any TPError) {
        self.base = base
    }
}
