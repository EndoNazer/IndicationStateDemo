//
//  TPFullscreenError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol FullscreenError {
    var title: String { get }
    var description: String { get }
}

struct DefaultFullscreenError: FullscreenError {
    let title: String
    let description: String
}
