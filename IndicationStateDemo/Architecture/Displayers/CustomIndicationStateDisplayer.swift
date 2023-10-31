//
//  CustomIndicationStateDisplayer.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

protocol CustomIndicationStateDisplayer: HiddenableDisplayer {
    func handleState(_ state: CustomError)
}
