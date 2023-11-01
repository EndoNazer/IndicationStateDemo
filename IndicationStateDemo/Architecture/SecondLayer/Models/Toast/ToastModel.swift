//
//  TPToastError.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol ToastModel: ErrorModel, EmptyModel {
    var text: String { get }
}
