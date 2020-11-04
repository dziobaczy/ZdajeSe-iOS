//
//  Comment.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct Comment: Codable, Identifiable {
    let author: String
    let comment: String
    let date: Date
    
    var id: String {
        author + date.description
    }
}

extension Comment {
    static let mock = Comment(author: "Me", comment: "Now this is a comment", date: .distantPast)
}
