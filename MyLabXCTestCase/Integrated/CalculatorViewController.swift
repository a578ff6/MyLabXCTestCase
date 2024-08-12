//
//  CalculatorViewController.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/12.
//

import UIKit

/// 綜合應用部分
/// 在其中設置兩個 UITextField 讓用戶輸入數值，以及一個按鈕來計算這兩個數值的和，並將結果顯示在一個 UILabel 上。
class CalculatorViewController: UIViewController {
    
    // 保持 private 且只在測試中有限制地暴露屬性，借此保護屬性同時進行測試，
    internal var testableFirstNumberTextField: UITextField {
        return firstNumberTextField
    }

    internal var testableSecondNumberTextField: UITextField {
        return secondNumberTextField
    }

    internal var testableResultLabel: UILabel {
        return resultLabel
    }

    internal var testableCalculateButton: UIButton {
        return calculateButton
    }
    
    internal func testableCalculateButtonTapped() {
        calculateButtonTapped()
    }


    private let firstNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter first number"
        textField.keyboardType = .numberPad
        textField.accessibilityIdentifier = "firstNumberTextField"
        return textField
    }()
    
    private let secondNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter second number"
        textField.keyboardType = .numberPad
        textField.accessibilityIdentifier = "secondNumberTextField"
        return textField
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Result"
        label.accessibilityIdentifier = "resultLabel"
        return label
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.accessibilityIdentifier = "calculateButton"
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    private func setupUI() {
        view.addSubview(firstNumberTextField)
        view.addSubview(secondNumberTextField)
        view.addSubview(resultLabel)
        view.addSubview(calculateButton)
        
        firstNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        secondNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstNumberTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            firstNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstNumberTextField.widthAnchor.constraint(equalToConstant: 200),
            
            secondNumberTextField.topAnchor.constraint(equalTo: firstNumberTextField.bottomAnchor, constant: 20),
            secondNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondNumberTextField.widthAnchor.constraint(equalToConstant: 200),
            
            calculateButton.topAnchor.constraint(equalTo: secondNumberTextField.bottomAnchor, constant: 20),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func calculateButtonTapped() {
        let firstNumber = Int(firstNumberTextField.text ?? "") ?? 0
        let secondNumber = Int(secondNumberTextField.text ?? "") ?? 0
        let sum = firstNumber + secondNumber
        resultLabel.text = "Result: \(sum)"
    }

}
