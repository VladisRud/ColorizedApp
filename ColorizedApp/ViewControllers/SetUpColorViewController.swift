//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Влад Руденко on 04.03.2024.
//

import UIKit

class SetUpColorViewController: UIViewController {
    
    //MARK: - Properties
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0
    weak var delegate: SetUpColorViewControllerDelegate?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpElements()
        addElementsOnScreen()
        doConstrainsViewAndStacks()
        doConstrainsLabels()
        doConstrainsTextFields()
        doConstrainsButton()
        setUpColorOnScreenAndElements()
        
        redSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        doneButton.addTarget(self, action: #selector(exitToStartVC), for: .touchUpInside)
    }
    
    //MARK: - UI Elements (View)
    private let colorizedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - UI Elements (Stacks)
    private var redStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private var greenStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    private var blueStack: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    //MARK: - UI Elements (Name Labels)
    private let redNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Red:"
        return label
    }()
    
    private let greenNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Green:"
        return label
    }()
    
    private let blueNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue:"
        return label
    }()
    
    //MARK: - UI Elements (Count Labels)
    private let redCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let blueCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let greenCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - UI Elements (Sliders)
    private let redSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    private let greenSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    private let blueSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .gray
        return slider
    }()
    
    //MARK: - UI Elements (TextFields)
    private let redTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let greenTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let blueTextField: UITextField = {
        let textField = UITextField()

        return textField
    }()
    
    //MARK: - UI Elements (Buttons)
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

}

extension SetUpColorViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

private extension SetUpColorViewController {
    //MARK: - UI Functions
    func setUpElements() {
        // Stacks
        [
            redStack,
            greenStack,
            blueStack
        ].forEach {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 12
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Name Labels
        [
            redNameLabel,
            greenNameLabel,
            blueNameLabel
        ].forEach {
            $0.textAlignment = .left
            $0.font = .systemFont(ofSize: 15)
            $0.adjustsFontSizeToFitWidth = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Count Labels
        [
            redCountLabel,
            greenCountLabel,
            blueCountLabel
        ].forEach {
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15)
            $0.adjustsFontSizeToFitWidth = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // TextFields
        [
            redTextField,
            greenTextField,
            blueTextField
        ].forEach {
            $0.keyboardType = .decimalPad
            $0.font = .systemFont(ofSize: 15)
            $0.textAlignment = .center
            $0.borderStyle = .roundedRect
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.delegate = self
        }
        
        // Sliders
        [
            redSlider,
            greenSlider,
            blueSlider
        ].forEach {
            $0.minimumValue = 0
            $0.maximumValue = 1
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func addElementsOnScreen() {
        [
            colorizedView,
            redStack,
            greenStack,
            blueStack,
            doneButton
        ].forEach {
            view.addSubview($0)
        }
        
        [
            redNameLabel,
            redCountLabel,
            redSlider,
            redTextField
        ].forEach {
            redStack.addArrangedSubview($0)
        }
        
        [
            greenNameLabel,
            greenCountLabel,
            greenSlider,
            greenTextField
        ].forEach {
            greenStack.addArrangedSubview($0)
        }
        
        [
            blueNameLabel,
            blueCountLabel,
            blueSlider,
            blueTextField
        ].forEach {
            blueStack.addArrangedSubview($0)
        }
    }
    
    func doConstrainsViewAndStacks() {
        NSLayoutConstraint.activate([
            colorizedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorizedView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            colorizedView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            colorizedView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            redStack.topAnchor.constraint(equalTo: colorizedView.bottomAnchor, constant: 40),
            redStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            redStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            redStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            greenStack.topAnchor.constraint(equalTo: redStack.bottomAnchor, constant: 10),
            greenStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            greenStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            greenStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            blueStack.topAnchor.constraint(equalTo: greenStack.bottomAnchor, constant: 10),
            blueStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            blueStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            blueStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
    }
    
    func doConstrainsLabels() {
        NSLayoutConstraint.activate([
            redNameLabel.widthAnchor.constraint(equalToConstant: 50),
            redCountLabel.widthAnchor.constraint(equalToConstant: 50),
            greenNameLabel.widthAnchor.constraint(equalToConstant: 50),
            greenCountLabel.widthAnchor.constraint(equalToConstant: 50),
            blueNameLabel.widthAnchor.constraint(equalToConstant: 50),
            blueCountLabel.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func doConstrainsTextFields() {
        NSLayoutConstraint.activate([
            redTextField.widthAnchor.constraint(equalToConstant: 50),
            greenTextField.widthAnchor.constraint(equalToConstant: 50),
            blueTextField.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func doConstrainsButton() {
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 75),
            doneButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    
    
    //MARK: - UIElements Functions
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
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        redColor = redSlider.value
        greenColor = greenSlider.value
        blueColor = blueSlider.value
    }
    
    func setUpColorOnScreenAndElements() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: 1
        )
        
        redCountLabel.text = String(format: "%.2f", redColor)
        greenCountLabel.text = String(format: "%.2f", greenColor)
        blueCountLabel.text = String(format: "%.2f", blueColor)
        
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
        
        redTextField.text = String(format: "%.2f", redColor)
        greenTextField.text = String(format: "%.2f", greenColor)
        blueTextField.text = String(format: "%.2f", blueColor)
    }
    
    func updateElementsAfterTF() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: 1
        )
        
        redCountLabel.text = String(format: "%.2f", redColor)
        greenCountLabel.text = String(format: "%.2f", greenColor)
        blueCountLabel.text = String(format: "%.2f", blueColor)
        
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
        
        redTextField.text = String(format: "%.2f", redColor)
        greenTextField.text = String(format: "%.2f", greenColor)
        blueTextField.text = String(format: "%.2f", blueColor)
    }
    
    //MARK: - Button Function
    @objc func exitToStartVC() {
        view.endEditing(true)
        delegate?.getColor(red: redColor, green: greenColor, blue: blueColor)
        dismiss(animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension SetUpColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            redColor = Float(textField.text ?? "0") ?? 0
        case greenTextField:
            greenColor = Float(textField.text ?? "0") ?? 0
        default:
            blueColor = Float(textField.text ?? "0") ?? 0
        }
        
        print(redColor)
        print(greenColor)
        print(blueColor)
        
        updateElementsAfterTF()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Check if it is number or dots
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        guard replacementStringCharacterSet.isSubset(of: allowedCharacterSet) || string.isEmpty || string == "," else {
            showAlert(message: "Please, type number in range 0.00 - 1.00")
            return false
        }
        
        // Get new text from acces range
        var newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        
        // If comma, change to dot
        newText = newText.replacingOccurrences(of: ",", with: ".")
        
        // If the new text is not empty and is not a number, or is greater than length 4, or greater than 1.00 - reject the input
        if !newText.isEmpty {
            guard let number = Double(newText), number <= 1 else {
                showAlert(message: "Number cannot be greater than 1.00")
                return false
            }
            
            if newText.count > 4 {
                showAlert(message: "Maximum number length - 4 symbols.")
                return false
            }
        }
        
        textField.text = newText
        
        return false
    }
    
    // alert for all types of wrongs
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Wrong", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

