//
//  NetworkingService.swift
//  GameApaka
//
//  Created by Халим Магомедов on 26.12.2021.
//

import Foundation

protocol Networking {
    func request (urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task
    }
    
    private func createDataTask ( from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
    }
}
