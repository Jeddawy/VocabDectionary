//
//  TranslateWordViewModel.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import Foundation
import Combine

class TranslationViewModel: ObservableObject {
    @Published var translatedText: String = ""
    @Published var translations: [TranslatedWord] = []
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false

    @Published var errorMessage: String?
    @Published var shouldNavigateToDetails = false

    
    private let dataService: TranslationRepositoryProtocol // Replace with your API service

    init(dataService: TranslationRepositoryProtocol) {
        self.dataService = dataService
    }

    func translate() {
        isLoading = true
        errorMessage = nil
        showError = false
        dataService.getTranslation(word: translatedText) { translations, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.showError = true
                    self.errorMessage = error
                }else{
                    self.translations = translations ?? []
                    self.shouldNavigateToDetails = true
                }
            }
        }
    }
}
