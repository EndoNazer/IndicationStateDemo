//
//  MainEmptyState.swift
//  IndicationStateDemo
//
//  Created by Daniil on 01.11.2023.
//

import Foundation

struct MainEmptyState: TPEmpty {
    var type: EmptyType {
        .fullscreen(model: DefaultFullscreenEmptyModel(title: "MainEmptyState", description: "Description"))
//        .toast(model: TPToastModel(type: .information(title: "MainEmptyState")))
    }
}
