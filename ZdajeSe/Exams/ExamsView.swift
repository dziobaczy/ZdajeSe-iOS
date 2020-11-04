//
//  ExamsView.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct ExamsView: View {
    
    @ObservedObject var examsViewModel: ExamsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(examsViewModel.examsOverviews) { examOverview in
                    NavigationLink(destination: QuestionsList(questionsViewModel: .init(withExamId: examOverview.id))) {
                        Text(examOverview.title)
                    }
                }
            }
            .navigationTitle("Generatory 3.0")
        }
    }
}

struct ExamsView_Previews: PreviewProvider {
    static var previews: some View {
        ExamsView(examsViewModel: ExamsViewModel())
    }
}
