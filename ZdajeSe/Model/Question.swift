//
//  Question.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct Question: Codable, Identifiable {
    let title: String
    let id: Int
    let answers: [Answer]
    
    enum CodingKeys: String, CodingKey {
        case title = "question"
        case id, answers
    }
    
// not suported yet
//    let comments: [Comment]
    
}
