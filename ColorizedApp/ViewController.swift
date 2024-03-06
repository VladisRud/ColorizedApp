//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Влад Руденко on 04.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Elements (View)
    let colorizedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        return view
    }()
    
    //MARK: - UI Elements (Stacks)
    private var redStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    private var greenStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    private var blueStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    //MARK: - UI Elements (Name Labels)
    let redNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red:"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let greenNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Green:"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let blueNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blue:"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - UI Elements (Count Labels)
    let redCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let blueCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let greenCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - UI Elements (Sliders)
    let redSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    let greenSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    let blueSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(colorizedView)
        view.addSubview(redStack)
        view.addSubview(greenStack)
        view.addSubview(blueStack)
        
        redStack.addArrangedSubview(redNameLabel)
        redStack.addArrangedSubview(redCountLabel)
        redStack.addArrangedSubview(redSlider)
        greenStack.addArrangedSubview(greenNameLabel)
        greenStack.addArrangedSubview(greenCountLabel)
        greenStack.addArrangedSubview(greenSlider)
        blueStack.addArrangedSubview(blueNameLabel)
        blueStack.addArrangedSubview(blueCountLabel)
        blueStack.addArrangedSubview(blueSlider)
        
        makeRandomColorLaunch()
        doConstrains()
        redSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
    }
    
    //MARK: - Constrains UI Elements
    func doConstrains() {
        NSLayoutConstraint.activate([
            colorizedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorizedView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            colorizedView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            colorizedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            redStack.topAnchor.constraint(equalTo: colorizedView.bottomAnchor, constant: 40),
            redStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            redStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            redStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            greenStack.topAnchor.constraint(equalTo: redStack.bottomAnchor),
            greenStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            greenStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            greenStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            blueStack.topAnchor.constraint(equalTo: greenStack.bottomAnchor),
            blueStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            blueStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            blueStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            redNameLabel.widthAnchor.constraint(equalToConstant: 50),
            redCountLabel.widthAnchor.constraint(equalToConstant: 50),
            greenNameLabel.widthAnchor.constraint(equalToConstant: 50),
            greenCountLabel.widthAnchor.constraint(equalToConstant: 50),
            blueNameLabel.widthAnchor.constraint(equalToConstant: 50),
            blueCountLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - Functions
    @objc func changeColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    func makeRandomColorLaunch() {
        let randomRed = Float.random(in: 0...1)
        let randomGreen = Float.random(in: 0...1)
        let randomBlue = Float.random(in: 0...1)
        
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(randomRed),
            green: CGFloat(randomGreen),
            blue: CGFloat(randomBlue),
            alpha: 1
        )
        
        redCountLabel.text = String(format: "%.2f", randomRed)
        greenCountLabel.text = String(format: "%.2f", randomGreen)
        blueCountLabel.text = String(format: "%.2f", randomBlue)
        
        redSlider.value = randomRed
        greenSlider.value = randomGreen
        blueSlider.value = randomRed
    }

}

