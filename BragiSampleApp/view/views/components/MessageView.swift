//
//  MessageView.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import UIKit

protocol MessageView: UIView {
    var label: UILabel { get }
    func show(in view: UIView, text: String)
}

class DefaultMessageView: UIView, MessageView {
    
    // MARK: - Properties
    
    lazy private(set) var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Private properties
    
    private var text: String?
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: CGRect.zero)

        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func show(in view: UIView, text: String) {
        if superview == nil {
            view.addSubview(self)
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
        
        alpha = 0
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.alpha = 1
        }
        
        label.text = text
    }
    
    // MARK: Private methods
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Edges.container).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Edges.container).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: Edges.internal).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Edges.internal).isActive = true
    }
    
}

fileprivate enum Frames {
    static let messageHeight = CGFloat(64.0)
}
