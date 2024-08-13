//
//  ServiceAPIError.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 07/08/2024.
//

import Foundation

enum HttpError: Error{
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String{
        switch self{
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "You can try the search again at later time or head to the web instead."
        case let .requestFailed(description): return "Request Failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Request invalid status code: \(statusCode)"
        case let .unknownError(error): return "An unknown error occured \(error.localizedDescription)"
        }
    }
}


protocol HttpClientProtocol {
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<[T], HttpError>) -> Void)
}

class HttpClient: HttpClientProtocol {
    
    // MARK: Properties
    private var urlSession: URLSession
    
    // MARK: Init
    init(urlsession: URLSession) {
        self.urlSession = urlsession
    }
    
    // MARK: Public Func
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<[T], HttpError>) -> Void) {
        
        self.urlSession.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request Failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else{
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data,
                  let object = try? JSONDecoder().decode([T].self, from: data) else {

                completion(.failure(HttpError.jsonParsingFailure))
                return
            }
            completion(.success(object))
        })
        .resume()
    }
    
}
