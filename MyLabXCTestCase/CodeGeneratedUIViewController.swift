//
//  CodeGeneratedUIViewController.swift
//  MyLabXCTestCase
//
//  Created by 曹家瑋 on 2024/8/12.
//

import UIKit

class CodeGeneratedUIViewController: UIViewController {
    
    // 設置按鈕跟標籤
    private let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.accessibilityIdentifier = "MyButton"
        button.addTarget(self, action: #selector(myButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.accessibilityIdentifier = "MyLabel"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // 設置佈局
    private func setupUI() {
        view.addSubview(myButton)
        view.addSubview(myLabel)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            myLabel.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // 點擊按鈕後更新標籤的文字
    @objc private func myButtonTapped() {
        myLabel.text = "Expected Text"
    }

}
