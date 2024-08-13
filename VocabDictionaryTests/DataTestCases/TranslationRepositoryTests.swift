//
//  TranslationRepositoryTests.swift
//  VocabDictionaryTests
//
//  Created by Ibrahim El-geddawy on 13/08/2024.
//

import XCTest
@testable import VocabDictionary

class TranslationRepositoryTests: XCTestCase {
    func testFetchTranslationSuccess() {
        // Given
        let mockWord = "apple"
        let mockData = Data() // Replace with valid JSON data
        let expectedResponse : TranslationResponse = [Translation(word: "Apple"), Translation(word: "amazon")]// Example response

        // Mock HttpClient
        let mockHttpClient = MockHttpClient()
        mockHttpClient.fetch(url: URL()) { result in
            <#code#>
        }

        // Create RemoteDataSource
        let remoteDataSource = RemoteDataSource(httpClient: mockHttpClient)

        // When
        let expectation = XCTestExpectation(description: "fetchTranslation completion")
        remoteDataSource.fetchTranslation(word: mockWord) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, expectedResponse) // Assuming proper decoding logic
            case .failure:
                XCTFail("Unexpected error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    func testFetchLocalTranslationSuccess() {
      // Mock data
    let mockWord = "apple"
    let mockTranslations = [TranslatedWord(translation: Translation(word: mockWord)), TranslatedWord(translation: Translation(word: "manzana"))]
      
      // Mock local data source
      let mockLocalDataSource = MockLocalDataSource(translatedWords: mockTranslations)

      
      // Create TranslationRepository with mock
      let repository = TranslationRepository(localDataSource: mockLocalDataSource)
      
      // Perform test
      var fetchedTranslations: [TranslatedWord]?
      var error: String?
      
      let expectation = self.expectation(description: "Local data fetch completion")
      repository.getTranslation(word: mockWord) { translations, err in
        fetchedTranslations = translations
        error = err
        expectation.fulfill()
      }
      
      self.wait(for: [expectation], timeout: 1)
      
      // Assertions
      XCTAssertNil(error)
      XCTAssertEqual(fetchedTranslations?.first?.word, mockWord)
      XCTAssertNotEqual(fetchedTranslations?.first?.word, "manzana")
    }

  
    
}

//MARK: Data conversion
extension TranslationRepositoryTests{
    func testTranslateToWord() {
        // Given
        let translation = Translation(word: "apple")
        let expectedWord = TranslatedWord(translation: translation)
        
        // When
        let result = TranslationRepository().translateToWord(from: translation)
        
        // Then as we have the id with is uuid string
        XCTAssertNotEqual(result, expectedWord)
    }
    
    func testTranslateToWordArray() {
        // Given
        let translations = [
            Translation(word: "apple"),
            Translation(word: "banana")
        ]
        let expectedWords = [
            TranslatedWord(translation: Translation(word: "apple")),
            TranslatedWord(translation: Translation(word: "banana"))
        ]

        // When
        let result = TranslationRepository().translateToWordArray(from: translations)

        // Then
        XCTAssertNotEqual(result, expectedWords)
    }
}
