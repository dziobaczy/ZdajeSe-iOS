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
    let comments: [Comment]?
    
    enum CodingKeys: String, CodingKey {
        case title = "question"
        case id, answers, comments
    }
}

extension Question {
    static let mockABD_1 = Question(title: "Zaznacz poprawne stwierdzenia dotyczące grup plików (filegroup)", id: 1000, answers: [.init(answer: "Tworząc tabelę nie możemy określić, do którego pliku trafi, lecz możemy określić do której grupy plików trafi", isCorrect: true), .init(answer: "Zawsze istnieje grupa zawierająca pliki podstawowe (*.mdf) i grupa z plikami rozszerzonymi (*.ndf)", isCorrect: false), .init(answer: "Grupa plików może zawierać pliki zlokalizowane na różnych dyskach", isCorrect: true), .init(answer: "Grupie plików zawsze odpowiada folder na dysku", isCorrect: false)], comments: [.init(author: "Me", comment: "Now this is a comment", date: .init(timeIntervalSince1970: 1604523809.0646172))])
}
