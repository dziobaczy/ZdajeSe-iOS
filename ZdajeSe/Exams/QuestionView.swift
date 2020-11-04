//
//  QuestionView.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question: Question
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.title)
                .font(.title2)
                .padding(.bottom, 12)
            ForEach(question.answers, id: \.answer) { answer in
                HStack {
                    Text(answer.answer)
                        .bold()
                    Spacer()
                    Image(systemName: answer.isCorrect ? "checkmark.square.fill" : "square")
                        .foregroundColor(.accent)
                        .font(Font.title3.bold())
                }
                .padding(.bottom, 8)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .mockABD_1)
    }
}
