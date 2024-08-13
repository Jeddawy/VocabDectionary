//
//  RealmModels.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 12/08/2024.
//

import Foundation
import RealmSwift

class TranslatedWordRM: Object, RealmEntity {
  typealias EntityType = TranslatedWord

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
  @Persisted var word: String?
  @Persisted var phonetic: String?
  @Persisted var phonetics = List<WordPronunciationRM>() // Assuming WordPronunciationRM is compatible
  @Persisted var meanings = List<WordMeaningRM>() // Assuming WordMeaningRM is compatible
  @Persisted var license: WordLicenseRM? // Assuming WordLicenseRM is compatible
  @Persisted var sourceUrls = List<String>()

  convenience required init(entity: EntityType) {
      self.init()
      self.id = UUID().uuidString // Generate a new ID for Realm object
      self.word = entity.word
      self.phonetic = entity.phonetic
      self.phonetics.append(objectsIn: entity.phonetics?.map { WordPronunciationRM(entity: $0) } ?? [])
      self.meanings.append(objectsIn: entity.meanings?.map { WordMeaningRM(entity: $0) } ?? [])
      self.license = entity.license.map { WordLicenseRM(entity: $0) }
      self.sourceUrls.append(objectsIn: entity.sourceUrls ?? [])
  }

  var entityObject: TranslatedWord {
      return TranslatedWord(entity: self)
  }
    override class func primaryKey() -> String? {
        return "id"
    }
}
class WordPronunciationRM: Object, RealmEntity {
    typealias EntityType = TranslatedPhonetic

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var text: String?
    @Persisted var audio: String?
    @Persisted var sourceURL: String?
    @Persisted var license: WordLicenseRM? // Assuming WordLicenseRM is compatible

    convenience required init(entity: EntityType) {
        self.init()
        self.id = UUID().uuidString
        self.text = entity.text
        self.audio = entity.audio
        self.sourceURL = entity.sourceURL
        self.license = entity.license.map { WordLicenseRM(entity: $0) }
    }

    var entityObject: TranslatedPhonetic {
        return TranslatedPhonetic(entity: self)
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}
class WordMeaningRM: Object, RealmEntity {
    typealias EntityType = TranslatedMeaning

//    @Persisted(primaryKey: true) var id: ObjectId = ObjectId()
    @Persisted(primaryKey: true) var id: String = UUID().uuidString

    @Persisted var partOfSpeech: String?
    @Persisted var definitions = List<WordDefinitionRM>()
    @Persisted var synonyms = List<String>()

    convenience required init(entity: EntityType) {
        self.init()
        self.id = UUID().uuidString
        self.partOfSpeech = entity.partOfSpeech
        self.definitions.append(objectsIn: entity.definitions?.map { WordDefinitionRM(entity: $0) } ?? [])
        self.synonyms.append(objectsIn: entity.synonyms ?? [])
    }

    var entityObject: TranslatedMeaning {
        return TranslatedMeaning(entity: self)
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

class WordDefinitionRM: Object, RealmEntity {
    typealias EntityType = TranslatedDefinition

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var definition: String?
    @Persisted var example: String?

    convenience required init(entity: EntityType) {
        self.init()
        self.id = UUID().uuidString
        self.definition = entity.definition
        self.example = entity.example
    }

    var entityObject: TranslatedDefinition {
        return TranslatedDefinition(entity: self)
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}
class WordLicenseRM: Object, RealmEntity {
    
    typealias EntityType = TranslatedLicense

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String?
    @Persisted var url: String?

    convenience required init(entity: EntityType) {
        self.init()
        self.id = UUID().uuidString
        self.name = entity.name
        self.url = entity.url
    }

    var entityObject: TranslatedLicense {
        return TranslatedLicense(entity: self)
    }
    override class func primaryKey() -> String? {
        return "id"
    }
}

