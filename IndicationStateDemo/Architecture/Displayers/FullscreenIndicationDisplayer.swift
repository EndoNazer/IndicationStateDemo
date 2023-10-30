//
//  TPFullscreenIndicationDisplayer.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import UIKit

protocol FullscreenIndicationDisplayer: HiddenableDisplayer {
    func displayError(_ error: FullscreenError)
    func displayLoader()
    func displayEmpty()
}

// Отображение для UIKit
// TODO: Надо сделать хранение вьюх
// TODO: Надо проработать возможность регистрации своих вьюх для отображения
extension FullscreenIndicationDisplayer where Self: UIViewController {
    func displayError(_ error: FullscreenError) {
        let errorView = UIView(frame: .zero)
        errorView.backgroundColor = .red
        view.addSubview(errorView)

        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.heightAnchor.constraint(equalToConstant: 50),
            errorView.widthAnchor.constraint(equalToConstant: 100)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak errorView] in
            errorView?.removeFromSuperview()
        }
    }

    func displayLoader() {
        let loader = UIActivityIndicatorView(style: .large)
        loader.startAnimating()
        loader.color = .green
        loader.isHidden = false
        view.addSubview(loader)

        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loader.heightAnchor.constraint(equalToConstant: 50),
            loader.widthAnchor.constraint(equalToConstant: 50)
        ])

        view.layoutIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak loader] in
            loader?.removeFromSuperview()
        }
    }

    func displayEmpty() {
        let emptyView = UIActivityIndicatorView(style: .large)
        emptyView.backgroundColor = .cyan
        view.addSubview(emptyView)

        emptyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyView.heightAnchor.constraint(equalToConstant: 50),
            emptyView.widthAnchor.constraint(equalToConstant: 100)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak emptyView] in
            emptyView?.removeFromSuperview()
        }
    }

    func hideAll() {
        
    }
}

// Можно так же для SwiftUI сделать, но я пока не думал как. Вопрос к знатокам
