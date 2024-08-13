//
//  Translation.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 07/08/2024.
//

import Foundation
import CoreData


struct TranslatedWord: Identifiable, Hashable,Entity {
    
    typealias RealmEntityType = TranslatedWordRM
    var realmObject: TranslatedWordRM{
        return TranslatedWordRM(entity: self)
    }
    
    var id = UUID().uuidString
    var word: String?
    var phonetic: String?
    var phonetics: [TranslatedPhonetic]?
    var meanings: [TranslatedMeaning]?
    var license: TranslatedLicense?
    var sourceUrls: [String]?
    public init(entity: RealmEntityType) {
        self.word = entity.word
        self.phonetic = entity.phonetic
        self.phonetics = entity.phonetics.map { TranslatedPhonetic(entity: $0) }
        self.meanings = entity.meanings.map { TranslatedMeaning(entity: $0) }
        self.license = entity.license.map { TranslatedLicense(entity: $0) }
        self.sourceUrls = entity.sourceUrls.map { $0}
    }
    init(id: String = "",translation: Translation) {
        self.id = id
        self.word = translation.word
        self.phonetic = translation.phonetic
        self.phonetics = translation.phonetics?.map { TranslatedPhonetic(phonetic: $0) }
        self.meanings = translation.meanings?.map { TranslatedMeaning(meaning: $0) }
        self.license = translation.license.map { TranslatedLicense(license: $0) }
        self.sourceUrls = translation.sourceUrls
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(word)
        hasher.combine(phonetic)
        hasher.combine(phonetics)
        hasher.combine(meanings)
        hasher.combine(license)
        hasher.combine(sourceUrls)
    }
}

struct TranslatedPhonetic: Identifiable, Hashable,Entity {
    typealias RealmEntityType = WordPronunciationRM
    var realmObject: WordPronunciationRM{
        return WordPronunciationRM(entity: self)
    }
    var id = UUID()
    var text: String?
    var audio: String?
    var sourceURL: String?
    var license: TranslatedLicense?
    
    public init(entity: RealmEntityType) {
        self.text = entity.text
        self.audio = entity.audio
        self.sourceURL = entity.sourceURL
        self.license = entity.license.map { TranslatedLicense(entity: $0) }
    }
    init(phonetic: Phonetic) {
        self.text = phonetic.text
        self.audio = phonetic.audio
        self.sourceURL = phonetic.sourceURL
        self.license = phonetic.license.map { TranslatedLicense(license: $0) }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(text)
        hasher.combine(audio)
        hasher.combine(sourceURL)
        hasher.combine(license)
    }
}

struct TranslatedMeaning: Identifiable, Hashable,Entity  {
    typealias RealmEntityType = WordMeaningRM
    
    var realmObject: WordMeaningRM{
        return WordMeaningRM(entity: self)
    }
    
    var id = UUID()
    var partOfSpeech: String?
    var definitions: [TranslatedDefinition]?
    var synonyms: [String]?
    
    public init(entity: RealmEntityType) {
        self.partOfSpeech = entity.partOfSpeech
        self.synonyms = entity.synonyms.map {$0}
        self.definitions = entity.definitions.map { TranslatedDefinition(entity: $0) }
    }
    
    init(meaning: Meaning) {
        self.partOfSpeech = meaning.partOfSpeech
        self.definitions = meaning.definitions?.map { TranslatedDefinition(definition: $0) }
        self.synonyms = meaning.synonyms
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(partOfSpeech)
        hasher.combine(definitions)
        hasher.combine(synonyms)
    }
}

struct TranslatedDefinition: Identifiable, Hashable, Entity {
    typealias RealmEntityType = WordDefinitionRM
    var realmObject: WordDefinitionRM{
        return WordDefinitionRM(entity: self)
    }
    var id = UUID()
    var definition: String?
    var example: String?
    
    public init(entity: RealmEntityType) {
        self.definition = entity.definition
        self.example = entity.example
    }
    init(definition: Definition) {
        self.definition = definition.definition
        self.example = definition.example
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(definition)
        hasher.combine(example)
    }
}

struct TranslatedLicense: Identifiable, Hashable, Entity {
    typealias RealmEntityType = WordLicenseRM
    var realmObject: WordLicenseRM{
        return WordLicenseRM(entity: self)
    }
    var id = UUID()
    var name: String?
    var url: String?
    
    public init(entity: RealmEntityType) {
        self.name = entity.name
        self.url = entity.url
    }

    init(license: License) {
        self.name = license.name
        self.url = license.url
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(url)
    }
}

