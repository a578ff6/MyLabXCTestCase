//
//  MyLabXCTestCaseTests.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/10.
//

import XCTest
@testable import MyLabXCTestCase


final class MyLabXCTestCaseTests: XCTestCase {

    // 在這裡設置每個測試前的初始化代碼
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    // 在這裡編寫每個測試後的清理代碼
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // 這是第一個測試方法（先間單點到為止）
        XCTAssertTrue(true)                 // 這裡是一個簡單的斷言
    }

    // 是用來測試程式碼性能
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}


