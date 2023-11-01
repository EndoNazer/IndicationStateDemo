//
//  View.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import UIKit

final class MainView: UIView, DefaultFullscreenIndicationView {
    var actionPublisher: AnyPublisher<Void, Never> {
        button.publisher(for: .touchUpInside)
            .mapToVoid()
            .eraseToAnyPublisher()
    }

    private let button = UIButton().prepare {
        $0.setTitle("JUST DO IT", for: .normal)
        $0.backgroundColor = .gray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

        registrateDefaultStateViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = .white
        let label = UILabel(frame: .zero)
        label.text = "text"
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)

        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(button)
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20).isActive = true
    }
}
