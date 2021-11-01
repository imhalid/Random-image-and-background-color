//
//  ViewController.swift
//  RandomImage
//
//  Created by Halid İçli on 31.10.2021.
//

import UIKit

class ViewController: UIViewController {
    var integer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = random()
        myButton()
        button.addTarget(self, action: #selector(randomColor), for: .touchUpInside)
        randomImage()
        imageView.frame = CGRect(x: 50, y: 120 / 2, width: 300, height: 300)
        view.addSubview(counterText)
        view.addSubview(imageView)
        textture()
    }
    
        let contactShadowSive: CGFloat = 20
        let imageView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .separator
            imageView.layer.cornerRadius = CGFloat(15)
            imageView.layer.masksToBounds = true
            imageView.layer.shadowColor = CGColor(srgbRed: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            imageView.layer.shadowRadius = 10
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowPath = CGPath(rect: CGRect(x: 0, y: 0, width: 300, height: 300), transform: nil)
            return imageView
    }()
    
    var counterText = UILabel()
    func textture() {
        counterText.text = "0"
        counterText.frame = CGRect(x: 175, y: 490, width: 40, height: 40)
        counterText.layer.masksToBounds = true
        counterText.layer.cornerRadius = 10
        counterText.layer.borderWidth = 2
        counterText.layer.borderColor = UIColor.systemIndigo.cgColor
//        counterText.backgroundColor = .separator
        counterText.textAlignment = .center
    }
 
    func randomImage() {
        let urlString = "https://source.unsplash.com/random"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    var button = UIButton()

    @objc func randomColor() {
        self.view.backgroundColor = random()
        randomImage()
        
        integer += 1
        counterText.text = "\(integer)"
        
    }
    

    
    
    func myButton() {
        button.configuration = .gray()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .quaternarySystemFill
        button.configuration?.baseForegroundColor = .systemBackground
        button.configuration?.image = UIImage(systemName: "eject.fill")
        buttonCordinate()
    }
    
    func buttonCordinate() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    @objc  func random() -> UIColor {
        return UIColor(
            red:   .random(in: 0.5...1),
            green: .random(in: 0.5...1),
            blue:  .random(in: 0.5...1),
            alpha: 1.0
        )
    }
}

