//
//  HTTPClient.swift
//  IPTV
//
//  Created by race on 2022/2/11.
//

import Foundation

struct HTTPClient {
    static let shared = HTTPClient()
    
    func fetchFromUrl(_ urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
}
