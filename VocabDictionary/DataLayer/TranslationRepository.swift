//
//  TranslationRepository.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import Foundation
import Realm

protocol TranslationRepositoryProtocol {
    func getTranslation(word: String,completion: @escaping ([TranslatedWord]?, String?) -> Void)
}

class TranslationRepository: TranslationRepositoryProtocol {
    private var remoteDataSource: TranslationRemoteDataSourceProtocol?
    private var localDataSource:  LocalDataSourceProtocol?
    
    init(localDataSource:  LocalDataSourceProtocol? = nil,remoteDataSource: TranslationRemoteDataSourceProtocol? = nil) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getTranslation(word: String, completion: @escaping ([TranslatedWord]?, String?) -> Void) {
        fetchLocalTranslation(word: word) { translation, error in
            if error != nil {
                self.fetchTranslation(word: word) { result, error  in
                    if let error = error {
                        completion(nil, error)
                    }else {
                        let translations = self.translateToWordArray(from: result ?? [])
                        self.saveTranslatedWords(translatedWords: translations)
                        completion(translations, nil)
                    }
                }
            } else if let data = translation{
                completion(data, nil)
            }
        }
        
    }
    
    
    func fetchTranslation(word: String, completion: @escaping (TranslationResponse?, String?) -> Void) {
        remoteDataSource?.fetchTranslation(word: word) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure.customDescription)
            }
        }
    }
    
  
    func fetchLocalTranslation(word: String, completion: @escaping ([TranslatedWord]?, String?) -> Void) {
        let localData = self.fetchTranslatedWords(word: word)
        if  !localData.isEmpty{
            completion(localData, nil)
        }else{
            completion(nil, "No data")
        }
    }
    
   
}
//MARK:  Convert Remote to Wird
extension TranslationRepository{
    func translateToWord(from translation: Translation) -> TranslatedWord {
        return TranslatedWord(translation: translation)
    }
    
    func translateToWordArray(from translations: [Translation]) -> [TranslatedWord] {
        return translations.map { translateToWord(from: $0) }
    }
    

}
//MARK: Convert Local to Word
extension TranslationRepository{
    func saveTranslatedWords(translatedWords: [TranslatedWord]) {
      localDataSource?.save(translatedWords)
    }
    
    func fetchTranslatedWords(word: String) -> [TranslatedWord] {
        guard let translation = self.searchTranslatedWords(searchTerm: word) else {return []}
        return translation
    }
    
    private func getRealmData() -> [TranslatedWord]{
        return localDataSource?.getAll() ?? []
    }
    
    private func searchTranslatedWords(searchTerm: String) -> [TranslatedWord]? {
        let translatedWords = getRealmData()
        return translatedWords.filter({$0.word?.lowercased() == searchTerm.lowercased()})
    }

}
