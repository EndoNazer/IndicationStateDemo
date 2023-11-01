//
//  UIView+prepare.swift
//  IndicationStateDemo
//
//  Created by Daniil on 27.10.2023.
//

import UIKit

protocol Preparable {}

extension Preparable {
    func prepare(block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension UIView: Preparable {}
