//
//  DiscountCalculatorTests.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/11.
//

import XCTest
@testable import MyLabXCTestCase

/// 測試計算折扣的功能
class DiscountCalculatorTests: XCTestCase {
    
    func testDiscountCalculation() {
        // Arrange: 準備測試數據
        let originalPrice: Double = 100.0
        let discountRate: Double = 0.2
        let expectedPrice: Double = 80
        
        // Act: 執行測試邏輯
        let actualPrice = calculateDiscountedPrice(originalPrice: originalPrice, discountRate: discountRate)
        
        // Assert: 驗證測試結果
        XCTAssertEqual(actualPrice, expectedPrice, "計算的折扣價格應該是： \(expectedPrice)")
    }

    // 這邊假設是 App 中的函數
    func calculateDiscountedPrice(originalPrice: Double, discountRate: Double) -> Double {
        return originalPrice * (1 - discountRate)
    }

}
