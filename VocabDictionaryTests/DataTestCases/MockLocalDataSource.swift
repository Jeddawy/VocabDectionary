//
//  MockLocalDataSource.swift
//  VocabDictionaryTests
//
//  Created by Ibrahim El-geddawy on 13/08/2024.
//

@testable import VocabDictionary
import Foundation
class MockLocalDataSource: LocalDataSourceProtocol {
    var translatedWords: [TranslatedWord]
    
    init(translatedWords: [TranslatedWord]) {
        self.translatedWords = translatedWords
    }
    
    func save(_ entities: [VocabDictionary.TranslatedWord]) {
        //
    }
    
    func getAll() -> [VocabDictionary.TranslatedWord]? {
        //
        return self.translatedWords
    }
}
