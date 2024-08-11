//
//  ViewController.swift
//  MyLabXCTestCase
//
//  Created by 曹家瑋 on 2024/8/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始設置
        myLabel.text = "Label"
    }

    @IBAction func myButtonTapped(_ sender: UIButton) {
        // 當按鈕點擊後，更新標籤的文字
        myLabel.text = "Expected Text"
    }
    
}

