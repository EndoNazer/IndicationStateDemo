//
//  FullscreenState.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Foundation

enum FullscreenState {
    case loading
    case empty(FullscreenEmptyModel)
    case error(FullscreenErrorModel)
    case hidden
}
