//
//  DefaultLoadingView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

final class DefaultLoadingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        let loader = UIActivityIndicatorView(style: .large)
        loader.startAnimating()
        loader.color = .green
        loader.isHidden = false
        addSubview(loader)

        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: centerYAnchor),
            loader.heightAnchor.constraint(equalToConstant: 50),
            loader.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
