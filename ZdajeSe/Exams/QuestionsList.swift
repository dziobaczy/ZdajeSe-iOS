//
//  QuestionsList.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct QuestionsList: View {
    
    @ObservedObject var questionsViewModel: QuestionsViewModel
    
    var body: some View {
        VStack {
            Text(questionsViewModel.title)
                .font(.title)
            List {
                ForEach(questionsViewModel.questions) { question in
                    Section {
                        QuestionView(question: question)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct QuestionsList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsList(questionsViewModel: .init(withExamId: "abd"))
    }
}
