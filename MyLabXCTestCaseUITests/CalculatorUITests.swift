//
//  CalculatorUITests.swift
//  MyLabXCTestCaseUITests
//
//  Created by 曹家瑋 on 2024/8/12.
//

import XCTest

class CalculatorUITests: XCTestCase {

    /// 模擬用戶輸入數字並點擊按鈕，然後檢查結果是否正確顯示。
    func testCalculateButtonTap_displaysCorrectResult() {
        let app = XCUIApplication()
        app.launch()
        
        // Arrange: 獲取 UI 元件
        let firstNumberTextField = app.textFields["firstNumberTextField"]
        let secondNumberTextField = app.textFields["secondNumberTextField"]
        let calculateButton = app.buttons["calculateButton"]
        let resultLabel = app.staticTexts["resultLabel"]

        // Act: 模擬用戶輸入數字並點擊計算按鈕
        firstNumberTextField.tap()
        firstNumberTextField.typeText("10")
        
        secondNumberTextField.tap()
        secondNumberTextField.typeText("20")
        
        calculateButton.tap()
        
        // Assert: 驗證結果標籤顯示是否正確
        XCTAssertEqual(resultLabel.label, "Result: 30", "結果標籤應該顯示 'Result: 30'")
    }
    
    
    /// 模擬用戶輸入無效數字並點擊按鈕，然後檢查結果是否正確顯示。
    func testCalculateButtonTap_withInvalidInput_displaysZero() {
        let app = XCUIApplication()
        app.launch()

        // Arrange: 獲取 UI 元件
        let firstNumberTextField = app.textFields["firstNumberTextField"]
        let secondNumberTextField = app.textFields["secondNumberTextField"]
        let calculateButton = app.buttons["calculateButton"]
        let resultLabel = app.staticTexts["resultLabel"]

        // Act: 模擬用戶輸入無效數字並點擊計算按鈕
        firstNumberTextField.tap()
        firstNumberTextField.typeText("abc")
        
        secondNumberTextField.tap()
        secondNumberTextField.typeText("20")
        
        calculateButton.tap()

        // Assert: 驗證結果標籤顯示是否正確
        XCTAssertEqual(resultLabel.label, "Result: 20", "結果標籤應該顯示 'Result: 20'")
    }
    
}
