//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Влад Руденко on 11.04.2024.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - Properties
    var redColor: Float = 0
    var greenColor: Float = 0
    var blueColor: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addRightBarButton()
        makeRandomColor()

        // Do any additional setup after loading the view.
    }
}

private extension StartViewController {
    //MARK: - UI Elements
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
    
    //MARK: - Button Func
    @objc func showColorSettings() {
        let setUpColorVC = SetUpColorController()
        setUpColorVC.redColor = redColor
        setUpColorVC.greenColor = greenColor
        setUpColorVC.blueColor = blueColor
        setUpColorVC.modalPresentationStyle = .fullScreen
        present(setUpColorVC, animated: true)
    }
    
}
