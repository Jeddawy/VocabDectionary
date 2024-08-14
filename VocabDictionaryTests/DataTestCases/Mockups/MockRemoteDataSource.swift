//
//  MockRemoteDataSource.swift
//  VocabDictionaryTests
//
//  Created by Ibrahim El-geddawy on 14/08/2024.
//

@testable import VocabDictionary
import Foundation

class MockRemoteDataSource: TranslationRemoteDataSourceProtocol{
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchTranslation(word: String, completion: @escaping (Result<TranslationResponse, HttpError>) -> Void) {
        let url = URL(string: URLs.urlString(word))!
        httpClient.fetch(url: url, completion: completion)
    }
    
}
