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

protocol ExamsProvidable {
    func getExams() -> AnyPublisher<[ExamOverview], ZSError>
    func getExamDetails(forExamId exam: String) -> AnyPublisher<Exam, ZSError>
}

struct LocalStore: ExamsProvidable {
    
    private let bundle: Bundle
    
    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    func getExams() -> AnyPublisher<[ExamOverview], ZSError> {
        let examsOverviews = bundle.decode(ExamOverview.ExamResponseWrapper.self, from: "index.json")
        return Just(examsOverviews)
            .map(\.pages)
            .mapError({ failure -> ZSError in
                .networkError(message: "Couldn't fetch file from bundle")
            })
            .eraseToAnyPublisher()
    }
    
    func getExamDetails(forExamId exam: String) -> AnyPublisher<Exam, ZSError> {
        let hurExam = bundle.decode(Exam.self, from: "hur.json")
        return Just(hurExam)
            .mapError({ failure -> ZSError in
                .networkError(message: "Couldn't fetch file from bundle")
            })
            .eraseToAnyPublisher()
    }
    
    
}
