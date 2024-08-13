//
//  ContentView.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 07/08/2024.
//
import Foundation
import SwiftUI

struct ContentView: View {

    var body: some View {
        let repoLayer = TranslationRepository(localDataSource: LocalDataSource(realmManager: RealmManager<TranslatedWordRM>()) , remoteDataSource: RemoteDataSource(httpClient: HttpClient(urlsession: URLSession.shared)))
           let viewModel = TranslationViewModel(dataService: repoLayer)
        TranslateWordView(viewModel: viewModel)
        .padding()
    }
}

#Preview {
    ContentView()
}
