//
//  Answer.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct Answer: Codable {
    let answer: String
    let isCorrect: Bool
    
    enum CodingKeys: String, CodingKey {
        case answer
        case isCorrect = "correct"
    }
}
