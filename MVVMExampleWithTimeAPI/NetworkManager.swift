//
//  NetworkManager.swift
//  MVVMExampleWithTimeAPI
//
//  Created by David Yoon on 2022/02/24.
//

import Foundation
import Alamofire

struct NetworkManager {
    func requestTime() {
        guard let url = URL(string: "http://worldclockapi.com/api/json/utc/now") else { return }
        
        AF.request(url, method: .get)
            .responseDecodable(of: TimeModel.self) { response in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                        print(error.localizedDescription)
                }
            }
            .resume()
        
    }
}
