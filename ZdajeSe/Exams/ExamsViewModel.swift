//
//  ExamsViewModel.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation
import Combine

class ExamsViewModel: NSObject, ObservableObject {
    
    @Published private(set) var examsOverviews = [ExamOverview]()
    
    private let examsProvidable: ExamsProvidable
    private var cancellabels = [AnyCancellable]()
    
    init(examsProvidable: ExamsProvidable = LocalStore()) {
        self.examsProvidable = examsProvidable
        super.init()
        startSinking()
    }
    
    private func startSinking() {
        examsProvidable.getExams()
            .sink(receiveCompletion: { _ in }) { [weak self] examsOverviews in
                self?.examsOverviews = examsOverviews
            }.store(in: &cancellabels)
    }
    
}
