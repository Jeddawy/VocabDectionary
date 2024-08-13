//
//  TranslationDetailsView.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import SwiftUI

struct TranslationDetailsView: View {
    let translations: [TranslatedWord]

    var body: some View {
        List(translations) { translation in
            Section(header: TranslationHeaderView(translation: translation)) {
                VStack(alignment: .leading) {
                    //MARK: Definitions
                    ForEach(translation.meanings ?? [], id: \.self) { meaning in
                        MeaningView(word: translation.word ?? "", meaning: meaning)
                    }
                }
            }
        }
        .navigationTitle("Translations")
    }
}

//#Preview {
//    TranslationDetailsView(translations: [
//        TranslatedWord(translation: Translation(word: "hello", phonetic: "Hell", phonetics: [Phonetic(text: "", audio: nil, sourceURL: nil, license: nil)], meanings: [Meaning(partOfSpeech: "test", definitions: [Definition(definition: "test", example: "(test)")], synonyms: ["hi", "hey"])], license: nil, sourceUrls: nil))
//    ])
//}

struct TranslationHeaderView: View {
    let translation: TranslatedWord

    var body: some View {
        HStack {
            Text(translation.word ?? "")
                .font(.headline)
                .fontWeight(.bold)
            
            if let phonetic = translation.phonetic {
                Text(phonetic)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading, 4)
            }
        }
    }
}
