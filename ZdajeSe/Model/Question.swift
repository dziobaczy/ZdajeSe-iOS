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

extension Question {
    static let mockABD_1 = Question(title: "Zaznacz poprawne stwierdzenia dotyczące grup plików (filegroup)", id: 1000, answers: [.init(answer: "Tworząc tabelę nie możemy określić, do którego pliku trafi, lecz możemy określić do której grupy plików trafi", isCorrect: true), .init(answer: "Zawsze istnieje grupa zawierająca pliki podstawowe (*.mdf) i grupa z plikami rozszerzonymi (*.ndf)", isCorrect: false), .init(answer: "Grupa plików może zawierać pliki zlokalizowane na różnych dyskach", isCorrect: true), .init(answer: "Grupie plików zawsze odpowiada folder na dysku", isCorrect: false)])
}
