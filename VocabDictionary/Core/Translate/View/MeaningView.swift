//
//  MeaningView.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 13/08/2024.
//

import SwiftUI

struct MeaningView: View {
    let word: String
    let meaning: TranslatedMeaning
    var body: some View {
        HStack{
            Text(word)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text(meaning.partOfSpeech ?? "")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
        }
       
        ForEach(meaning.definitions ?? [], id: \.self) { definition in
                HStack {
                    Text("*" + (definition.definition ?? ""))
                        .font(.body)
                }
                .padding(.leading, 4)
        }
        if let synonyms = meaning.synonyms, !synonyms.isEmpty{
            SynonymView(synonyms: meaning.synonyms ?? [])
        }
    }
}
