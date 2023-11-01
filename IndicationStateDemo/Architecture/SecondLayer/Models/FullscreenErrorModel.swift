//
//  FullscreenErrorModel.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol FullscreenErrorModel: ErrorModel {
    var title: String { get }
    var description: String { get }
}
