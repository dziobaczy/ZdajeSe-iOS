//
//  QuestionsViewModel.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation
import Combine

class QuestionsViewModel: NSObject, ObservableObject {
    
    @Published private(set) var title: String = ""
    @Published private(set) var questions = [Question]()
    
    private let examId: String
    
    private let examsProvidable: ExamsProvidable
    private var cancllabels = [AnyCancellable]()
    
    init(withExamId examId: String, examsProvidable: ExamsProvidable = LocalStore()) {
        self.examsProvidable = examsProvidable
        self.examId = examId
        super.init()
        startSinking()
    }
    
    private func startSinking() {
        examsProvidable.getExamDetails(forExamId: examId)
            .sink(receiveCompletion: { _ in }) { [weak self] exam in
                self?.title = exam.title
                self?.questions = exam.questions
            }.store(in: &cancllabels)
    }
    
}
