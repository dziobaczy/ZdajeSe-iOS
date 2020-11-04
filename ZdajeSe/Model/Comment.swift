//
//  Comment.swift
//  ZdajeSe
//
//  Created by Piotr Szadkowski on 04/11/2020.
//

import Foundation

struct Comment: Codable {
    let author: String
    let comment: String
    let date: Date
}
