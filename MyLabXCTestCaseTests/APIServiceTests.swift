//
//  APIServiceTests.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/12.
//

import XCTest
@testable import MyLabXCTestCase

class APIServiceTests: XCTestCase {

    var apiService: APIService!
    
    override func setUpWithError() throws {
        super.setUp()
        // 初始化 APIService
        apiService = APIService()
    }

    override func tearDownWithError() throws {
        // 釋放 APIService
        apiService = nil
        super.tearDown()
    }

    /// 200 OK - 成功的請求
    func testFetchDataReturnsStatusCode200() throws {
        // 準備階段（Arrange）
        let expectation = self.expectation(description: "等待 API 回傳狀態碼 200")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

        // 執行階段（Act）
        apiService.fetchData(from: url) { result in
            switch result {
            case .success(let statusCode):
                // 驗證階段（Assert）
                // print("Received status code: \(statusCode)")              // 觀察用
                XCTAssertEqual(statusCode, 200, "回傳的狀態碼應該是 200")    // 用於驗證具體的測試結果是否符合預期。失敗時會顯示錯誤訊息，並標記測試為失敗。
            case .failure(let error):
                // print("Error occurred: \(error.localizedDescription)")    // 觀察用
                XCTFail("請求失敗，錯誤訊息: \(error.localizedDescription)") // 用於處理非預期情況或強制測試失敗。它不進行比較，而是立即標記測試失敗，並顯示錯誤訊息。
            }
            
            // 當 API 回應後，通知測試繼續執行
            expectation.fulfill()
        }
        
        // 等待非同步操作完成，最多等待 5 秒
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // 404 Not Found - 資源未找到
    func testFetchDataReturnsStatusCode404() throws {
        let expectation = self.expectation(description: "等待 API 回傳狀態碼 404")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/0")!

        apiService.fetchData(from: url) { result in
            switch result {
            case .success(let statusCode):
                XCTAssertEqual(statusCode, 404, "回傳的狀態碼應該是 404")
            case .failure(let error):
                XCTFail("請求失敗，錯誤訊息: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }


}
