//
//  NetworkingDataFetcher.swift
//  GameApaka
//
//  Created by Халим Магомедов on 26.12.2021.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData <T: Decodable>(urlString: String, responce: @escaping(T?)->Void)
}


class NetworkingDataFetcher: DataFetcher {
    var networking: Networking
    
    init(networking: Networking = NetworkService() ) {
        self.networking = networking

    }
    func fetchGenericJSONData<T>(urlString: String, responce: @escaping (T?) -> Void) where T : Decodable {
        print (T.self)
        networking.request(urlString: urlString) { (data, error) in
            if let error =  error {
                print ("Error received request data: \(error.localizedDescription)")
                responce(nil)
            }
            let decoded = self.decodeJSON(type: T.self, from: data)
            responce(decoded)
        }
        
    }
    
    func decodeJSON <T: Decodable>(type: T.Type, from: Data?)-> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print ("Failet to decode json \(jsonError) ")
            return nil
        }
    }
}
