//
//  TranslateWordView.swift
//  VocabDictionary
//
//  Created by Ibrahim El-geddawy on 08/08/2024.
//

import SwiftUI

struct TranslateWordView: View {
    
    @ObservedObject var viewModel: TranslationViewModel
    @State private var showLoading = false
    @State private var showError = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    VStack(spacing: 16) {
                        TextField("Translate", text: $viewModel.translatedText)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .padding(.vertical)
                            .overlay(
                                Capsule()
                                    .stroke(lineWidth: 0.5)
                                    .foregroundStyle(Color(.systemGray4))
                                    .shadow(color: .black.opacity(0.4), radius: 2)
                            )
                        
                        Button(action: {
                            viewModel.translate()
                        }, label: {
                            Text("Translate")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    }
                    .padding()
                    Spacer()
                }
                .navigationTitle("Translate")
                
                if showLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                        .padding()
                }
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationDestination(isPresented: $viewModel.shouldNavigateToDetails) {
                TranslationDetailsView(translations: viewModel.translations)
            }
        }
        .onReceive(viewModel.$isLoading) { isLoading in
            showLoading = isLoading
        }
        
    }
}

//#Preview {
//    TranslateWordView(viewModel: TranslationViewModel())
//}
