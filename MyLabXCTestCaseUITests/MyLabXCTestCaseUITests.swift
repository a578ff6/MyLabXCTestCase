//
//  MyLabXCTestCaseUITests.swift
//  MyLabXCTestCaseUITests
//
//  Created by 曹家瑋 on 2024/8/10.
//
import XCTest

class MyLabXCTestCaseUITests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // 在每個測試之前設定初始狀態
        continueAfterFailure = false

        // UI 測試必須啟動應用程式
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // 測試結束後的清理代碼
    }
    
    /// 測試按鈕是否存在於界面上
    /// 這個測試只檢查按鈕的存在性和可見性，無需在 ViewController 中設置 IBOutlet
    func testButtonExists() throws {
        let app = XCUIApplication()
        
        // 檢查名為 "MyButton" 的按鈕是否存在於介面中
        XCTAssertTrue(app.buttons["MyButton"].exists)
    }

    
    /// 測試按鈕點擊後標籤文字是否改變：涉及到 UI 元件之間的互動，因此需要在 ViewController 中設置相應的 IBOutlet 和 IBAction
    func testButtonTapChangesLabel() throws {
        // Arrange: 設置測試環境，用於訪問 App 的實例，並用來進行後續的 UI 操作。
        let app = XCUIApplication()
        
        // Act: 模擬用戶操作，使用按鈕的 accessibilityIdentifier（按鈕已經設定過），來找到按鈕並執行點擊操作。
        app.buttons["MyButton"].tap()
        
        // Assert: 驗證結果，通過標籤的 accessibilityIdentifier 找到標籤，然後驗證點擊按鈕後，標籤的文字是否如預期般改變。
        let label = app.staticTexts["MyLabel"]
        XCTAssertEqual(label.label, "Expected Text", "按鈕點擊後標籤應該顯示 'Expected Text'")
    }
    
}
