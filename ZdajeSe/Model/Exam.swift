//
//  Exam.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct Exam: Codable, Identifiable {
    let title: String
    let id: String
    let questions: [Question]
    
    enum CodingKeys: String, CodingKey {
        case questions = "data"
        case id, title
    }
}
