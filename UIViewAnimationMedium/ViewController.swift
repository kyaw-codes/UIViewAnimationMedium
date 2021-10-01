//
//  ViewController.swift
//  UIViewAnimationMedium
//
//  Created by Ko Kyaw on 25/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(greenBox)
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        greenBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        greenBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        widthConstraint = greenBox.widthAnchor.constraint(equalToConstant: 100)
        widthConstraint?.isActive = true
        
        heightConstraint = greenBox.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint?.isActive = true
        
        greenBox.isUserInteractionEnabled = true
        
        greenBox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapGreenBox(_:))))
        
    }

    @objc private func didTapGreenBox(_ sender: UITapGestureRecognizer) {
        animationOne()
//        animationTwo()
//        animationThree()
//        animationFour()
//        animationFive()
//        animationSix()
    }

}

extension ViewController {
    
    // MARK: - Animations

    func animationOne() {
        UIView.animate(withDuration: 0.5) {
            self.greenBox.frame = CGRect(
                x: 0,
                y: self.greenBox.frame.origin.y,
                width: self.greenBox.frame.width,
                height: self.greenBox.frame.height)
        }
    }
    
    func animationTwo() {
        UIView.animate(withDuration: 0.3) {
            self.greenBox.backgroundColor = .systemBlue
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.greenBox.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.greenBox.alpha = 0.5
            }
        }
    }
    
    func animationThree() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.3,
            options: [.curveEaseIn],
            animations: {
                let transform = CGAffineTransform(translationX: 0, y: -60)
                    .concatenating(CGAffineTransform(scaleX: 4.5, y: 4.5))
                
                self.greenBox.transform = transform
            },
            completion: nil
        )
    }
    
    func animationFour() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.2,
            options: [.curveEaseInOut],
            animations: {
                self.greenBox.transform = CGAffineTransform(translationX: 0, y: 200)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.greenBox.layer.cornerRadius = 50
                }
            }
        )
    }
    
    func animationFive() {
        let overallDuration = 6.0
        
        UIView.animateKeyframes(withDuration: overallDuration, delay: 0, options: .calculationModeCubic) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.greenBox.transform = CGAffineTransform(translationX: 100, y: 0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/overallDuration, relativeDuration: 0.25) {
                self.greenBox.backgroundColor = .systemPink
                self.greenBox.layer.cornerRadius = 50
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3/overallDuration, relativeDuration: 0.5) {
                self.greenBox.transform = CGAffineTransform(scaleX: 2, y: 2)
                    .concatenating(CGAffineTransform(translationX: 0, y: -200))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 4/overallDuration, relativeDuration: 0.25) {
                self.greenBox.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    .concatenating(CGAffineTransform(translationX: 0, y: 200))
                
                if #available(iOS 15.0, *) {
                    self.greenBox.backgroundColor = .systemMint
                } else {
                    self.greenBox.backgroundColor = .cyan
                }
            }
            
            UIView.addKeyframe(withRelativeStartTime: 5/overallDuration, relativeDuration: 0.5) {
                self.greenBox.transform = .identity
                self.greenBox.layer.cornerRadius = 2
            }
        }
    }
    
    func animationSix() {
        widthConstraint?.constant = view.frame.width
        heightConstraint?.constant = view.frame.height
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

