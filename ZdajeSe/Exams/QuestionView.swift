//
//  QuestionView.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct QuestionView: View {
    
    @State var question: Question
    @State var isCommentsSectionExpanded: Bool = false
    
    var commentsDescription: String {
        guard let comments = question.comments else { return "0 komentarzy" }
        if comments.count == 1 {
            return "1 komentarz"
        } else {
            return "\(comments.count) komentarzy"
        }
    }
    
    var isCommentsButtonEnabled: Bool {
        question.comments != nil
    }
    
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
            Button(action: { isCommentsSectionExpanded.toggle() }, label: {
                Text(commentsDescription)
                    .foregroundColor(isCommentsButtonEnabled ? .accent : .gray)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 8)
            .disabled(!isCommentsButtonEnabled)
            if isCommentsSectionExpanded {
                ForEach(question.comments ?? []) { comment in
                    CommentView(comment: comment)
                        .padding(.bottom, 8)
                }
                .padding(.top, 14)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: .mockABD_1)
    }
}
