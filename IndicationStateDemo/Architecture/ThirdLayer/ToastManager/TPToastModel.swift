//
//  TPToastModel.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import UIKit

struct TPToastModel: ToastModel {
    enum `Type` {
        case alarm(title: String)
        case information(title: String)
        case error(message: String)
    }

    struct Action {
        var title: String
        var buttonSubject: PassthroughSubject<Void, Never>?

        init(title: String, buttonSubject: PassthroughSubject<Void, Never>? = nil) {
            self.title = title
            self.buttonSubject = buttonSubject
        }
    }

    var type: Type
    var action: Action?

    var text: String {
        switch type {
        case let .alarm(title):
            return title
        case let .error(message):
            return message
        case let .information(title):
            return title
        }
    }

    init(type: Type, action: Action? = nil) {
        self.type = type
        self.action = action
    }
}
