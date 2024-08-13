//
//  RemoteDataSource.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import Foundation
protocol TranslationRemoteDataSourceProtocol {
    func fetchTranslation(word: String,completion: @escaping (Result<TranslationResponse, HttpError>) -> Void)
}

class RemoteDataSource: TranslationRemoteDataSourceProtocol {
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchTranslation(word: String, completion: @escaping (Result<TranslationResponse, HttpError>) -> Void) {
        let url = URL(string: URLs.urlString(word))!
        httpClient.fetch(url: url, completion: completion)
    }
    
}
