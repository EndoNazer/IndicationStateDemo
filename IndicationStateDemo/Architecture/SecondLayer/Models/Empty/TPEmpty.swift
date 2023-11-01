//
//  TPEmpty.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Foundation

protocol TPEmpty: Error, EmptyModel {
    var type: EmptyType { get }
}

enum EmptyType {
    case fullscreen(model: FullscreenEmptyModel)
    case toast(model: ToastModel)
    // Мб выпилить и оставить только общий custom
    case custom(model: CustomModel)
}
