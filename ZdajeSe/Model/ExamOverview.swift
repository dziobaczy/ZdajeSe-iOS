//
//  ExamOverview.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct ExamOverview: Codable, Identifiable {
    let title: String
    let id: String
    
    struct ExamResponseWrapper: Codable {
        let pages: [ExamOverview]
    }
}
