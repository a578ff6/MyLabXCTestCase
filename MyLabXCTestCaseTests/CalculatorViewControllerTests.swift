//
//  CalculatorViewControllerTests.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/12.
//

import XCTest
@testable import MyLabXCTestCase

class CalculatorViewControllerTests: XCTestCase {

    var calculatorVC: CalculatorViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        // 初始化 CalculatorViewController
        calculatorVC = CalculatorViewController()
        calculatorVC.loadViewIfNeeded()             // 確保 view 已經加載
    }

    override func tearDownWithError() throws {
        // 釋放 CalculatorViewController
        calculatorVC = nil
        super.tearDown()
    }

    // 測試有效數字輸入情境
    func testCalculateButtonTapped_withValidInput_shouldDisplayCorrectResult() {
        // Arrange: 設置初始的輸入數值
        calculatorVC.testableFirstNumberTextField.text = "10"
        calculatorVC.testableSecondNumberTextField.text = "20"
        
        // Act: 執行計算按鈕的點擊行為
        calculatorVC.testableCalculateButtonTapped()
        
        // Assert: 驗證結果標籤是否顯示正確的計算結果
        XCTAssertEqual(calculatorVC.testableResultLabel.text, "Result: 30", "結果標籤應該顯示 'Result: 30'")
    }

    // 測試無效輸入的情境（例如文字或空值）
    func testCalculateButtonTapped_withInvalidInput_shouldDisplayZero() {
        // Arrange: 設置無效的輸入數值
        calculatorVC.testableFirstNumberTextField.text = "abc"
        calculatorVC.testableSecondNumberTextField.text = "20"
        
        // Act: 執行計算按鈕的點擊行為
        calculatorVC.testableCalculateButtonTapped()
        
        // Assert: 驗證結果標籤是否顯示正確的結果，無效輸入應顯示 'Result: 20'
        XCTAssertEqual(calculatorVC.testableResultLabel.text, "Result: 20", "結果標籤應該顯示 'Result: 20'")
    }
    
    // 測試當一個輸入框為空時的情境
    func testCalculateButtonTapped_withEmptyInput_shouldDisplayOtherNumber() {
        // Arrange: 設置一個輸入框為空
        calculatorVC.testableFirstNumberTextField.text = ""
        calculatorVC.testableSecondNumberTextField.text = "15"
        
        // Act: 執行計算按鈕的點擊行為
        calculatorVC.testableCalculateButtonTapped()
        
        // Assert: 驗證結果標籤是否顯示正確的結果
        XCTAssertEqual(calculatorVC.testableResultLabel.text, "Result: 15", "結果標籤應該顯示 'Result: 15'")
    }

}
