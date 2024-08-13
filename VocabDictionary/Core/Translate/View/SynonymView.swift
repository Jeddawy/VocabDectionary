//
//  SynonymView.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 13/08/2024.
//

import SwiftUI

struct SynonymView: View {
    let synonyms: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Synonyms:")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.top, 5)

            ForEach(synonyms, id: \.self) { synonym in
                Text(synonym)
                    .font(.body)
                    .padding(.top, 2)
            }
        }
    }
}
