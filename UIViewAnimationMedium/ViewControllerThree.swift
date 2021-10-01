//
//  ViewControllerThree.swift
//  UIViewAnimationMedium
//
//  Created by Ko Kyaw on 26/09/2021.
//

import UIKit

class ViewControllerThree: UIViewController {
    
    let vectorImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "vector"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Getting Started!"
        lbl.font = .boldSystemFont(ofSize: 24)
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "UIKit animation methods are pretty handy. You can do a lot of cool stuff with it without touching the verbose CABasicAnimation things. But, it has some limitation; you can't animate the view's underlying layer."
        lbl.font = .preferredFont(forTextStyle: .subheadline, compatibleWith: .current)
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.textAlignment = .center
        lbl.adjustsFontForContentSizeCategory = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let progressView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false

        for i in 0...2 {
            let dot = UIView()
            dot.widthAnchor.constraint(equalToConstant: i == 0 ? 28 : 10).isActive = true
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
            dot.layer.cornerRadius = 10 / 2
            dot.backgroundColor = i == 0 ? .systemBlue : UIColor(white: 0.8, alpha: 1)
            
            sv.addArrangedSubview(dot)
        }
        return sv
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Reload animation", for: .normal)
        if #available(iOS 15.0, *) {
            btn.configuration = .filled()
        } else {
            btn.backgroundColor = .systemBlue
            btn.setTitleColor(.white, for: .normal)
            btn.layer.cornerRadius = 8
        }
        btn.addTarget(self, action: #selector(didButtonTapped(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        initLayout()
        initAnimation()
    }
    
    func initLayout() {
        view.addSubview(vectorImageView)
        vectorImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vectorImageView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        vectorImageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 40).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        
        view.addSubview(progressView)
        progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        progressView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.15).isActive = true
        progressView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32).isActive = true
        
        view.addSubview(button)
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func initAnimation() {
        vectorImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        vectorImageView.alpha = 0
        
        self.titleLabel.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
        self.titleLabel.alpha = 0.5
        
        self.descriptionLabel.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        self.descriptionLabel.alpha = 0.5
        
        self.progressView.alpha = 0
        self.progressView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        self.button.transform = CGAffineTransform(translationX: 0, y: 400)
        self.button.alpha = 0.5
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubicPaced) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                /// Note: '.identity' converts the current transform state into original state.
                self.vectorImageView.transform = .identity
                self.vectorImageView.alpha = 1
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.45) {
                self.titleLabel.alpha = 1
                self.titleLabel.transform = .identity
                
                self.descriptionLabel.alpha = 1
                self.descriptionLabel.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.progressView.transform = .identity
                self.progressView.alpha = 1
                
                self.button.alpha = 1
                self.button.transform = .identity
            }
        }
    }
    
    @objc private func didButtonTapped(_ sender: UIButton) {
        initAnimation()
    }

}
