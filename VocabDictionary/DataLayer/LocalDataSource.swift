//
//  LocalDataSource.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import Foundation

protocol LocalDataSourceProtocol {
    func save(_ entities: [TranslatedWord])
    func getAll() -> [TranslatedWord]?
}


class LocalDataSource: LocalDataSourceProtocol {
    
    private let realmManager: RealmManager<TranslatedWordRM>

    init(realmManager: RealmManager<TranslatedWordRM>) {
      self.realmManager = realmManager
    }

    func save(_ entity: [TranslatedWord]) {
       let realmManager =  RealmManager<TranslatedWordRM>()
        try? realmManager.save(items: entity)
    }

    func getAll() -> [TranslatedWord]? {
        return realmManager.fetchAll()
    }
    
}
