//
//  ExamsProvidable.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation
import Combine

enum ZSError: Error, LocalizedError {
    case networkError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .networkError(let message):
            return message
        }
    }
}

protocol ExamsProvidable: class {
    func getExams() -> AnyPublisher<[ExamOverview], ZSError>
    func getQuestions(forExamId exam: String) -> AnyPublisher<[Exam], ZSError>
}
