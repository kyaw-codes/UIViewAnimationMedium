//
//  ViewControllerTwo.swift
//  UIViewAnimationMedium
//
//  Created by Ko Kyaw on 26/09/2021.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    let expandableView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 1)
        return view
    }()
    
    let toggleButton: UIButton = {
        let btn = UIButton(type: .system)
        
        if #available(iOS 15.0, *) {
            btn.configuration = .tinted()
        }
        
        btn.setTitle("Toggle", for: .normal)
        return btn
    }()
    
    var leftConstraint: NSLayoutConstraint?
    var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(toggleButton)
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        toggleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        view.addSubview(expandableView)
        expandableView.translatesAutoresizingMaskIntoConstraints = false
        expandableView.trailingAnchor.constraint(equalTo: toggleButton.leadingAnchor, constant: -8).isActive = true
        expandableView.centerYAnchor.constraint(equalTo: toggleButton.centerYAnchor).isActive = true
        expandableView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        leftConstraint = expandableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        
        toggleButton.addTarget(self, action: #selector(didToggleButtonTap(_:)), for: .touchUpInside)
    }
    
    @objc private func didToggleButtonTap(_ sender: UIButton) {
        leftConstraint?.isActive = !isExpanded
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.expandableView.alpha = self.isExpanded ? 0.5 : 1
        } completion: { _ in
            self.isExpanded = !self.isExpanded
        }
    }

}
