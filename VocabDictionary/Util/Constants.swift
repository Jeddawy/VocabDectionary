//
//  Constants.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import Foundation
struct URLs{
    static let baseUrlString = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    static func urlString(_ word: String) -> String {
         return baseUrlString + "\(word)"
     }
    
}
