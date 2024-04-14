//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Влад Руденко on 11.04.2024.
//

import UIKit

protocol SetUpColorViewControllerDelegate: AnyObject {
    func getColor(red redColor: Float, green greenColor: Float, blue blueColor: Float)
}

class StartViewController: UIViewController {
    
    //MARK: - Properties
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addRightBarButton()
        makeRandomColor()
    }
}

private extension StartViewController {
    //MARK: - UI Functions
    func addRightBarButton() {
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(showColorSettings))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func makeRandomColor() {
        redColor = Float.random(in: 0...1)
        greenColor = Float.random(in: 0...1)
        blueColor = Float.random(in: 0...1)
        
        view.backgroundColor = UIColor(
            red: CGFloat(redColor),
            green: CGFloat(greenColor),
            blue: CGFloat(blueColor),
            alpha: 1
        )
    }
    
    //MARK: - Button Function
    @objc func showColorSettings() {
        let setUpColorVC = SetUpColorViewController()
        setUpColorVC.delegate = self
        setUpColorVC.redColor = redColor
        setUpColorVC.greenColor = greenColor
        setUpColorVC.blueColor = blueColor
        setUpColorVC.modalPresentationStyle = .fullScreen
        present(setUpColorVC, animated: true)
    }
    
}

extension StartViewController: SetUpColorViewControllerDelegate {
    func getColor(red redColor: Float, green greenColor: Float, blue blueColor: Float) {
        self.redColor = redColor
        self.greenColor = greenColor
        self.blueColor = blueColor
        
        view.backgroundColor = UIColor(
            red: CGFloat(self.redColor),
            green: CGFloat(self.greenColor),
            blue: CGFloat(self.blueColor),
            alpha: 1
        )
    }
    
    
}
