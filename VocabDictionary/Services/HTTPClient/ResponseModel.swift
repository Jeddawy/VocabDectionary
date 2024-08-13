//
//  ResponseModel.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 13/08/2024.
//

import Foundation

typealias TranslationResponse = [Translation]

// MARK: - Translation
struct Translation: Codable, Equatable{
    static func == (lhs: Translation, rhs: Translation) -> Bool {
        return true
    }
    
    var word:String?
   var phonetic: String?
    var phonetics: [Phonetic]?
    var meanings: [Meaning]?
    var license: License?
    var sourceUrls: [String]?
}

// MARK: - License
struct License: Codable {
    let name: String?
    let url: String?
}

// MARK: - Meaning
struct Meaning: Codable{
    let partOfSpeech: String?
    let definitions: [Definition]?
    let synonyms: [String]?
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String?
    let example: String?
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let text: String?
    let audio: String?
    let sourceURL: String?
    let license: License?

    enum CodingKeys: String, CodingKey {
        case text, audio
        case sourceURL = "sourceUrl"
        case license
    }
}
