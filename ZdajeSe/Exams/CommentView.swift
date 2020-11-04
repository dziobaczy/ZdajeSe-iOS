//
//  CommentView.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import SwiftUI

struct CommentView: View {
    
    @State var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(comment.author)
                .foregroundColor(.gray)
                .font(.system(size: 16))
            Text(comment.date.description)
                .foregroundColor(.lightGray)
                .font(.system(size: 12))
                .padding(.bottom, 4)
            Text(comment.comment)
                .font(.system(size: 16))
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: .mock)
    }
}
