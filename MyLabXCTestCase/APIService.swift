//
//  APIService.swift
//  MyLabXCTestCaseTests
//
//  Created by 曹家瑋 on 2024/8/12.
//

import Foundation


/// APIService 是一個用來發送 HTTP 請求並處理回應的服務類別。
/// 借此模擬與伺服器的網路交互，並將回應的狀態碼或錯誤回傳給呼叫方。
class APIService {
    
    /// 發送 HTTP 請求到指定的 URL，並回傳 HTTP 狀態碼或錯誤。
    func fetchData(from url: URL, completion: @escaping (Result<Int, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                completion(.success(httpResponse.statusCode))
            } else {
                let error = NSError(domain: "InvalidResponse", code: 0, userInfo: nil)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
