//
//  WordDataModel.swift
//  BabbelFallingWordsQuiz
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import Foundation

struct WordDataModel {
    var defaultValue: String
    var secondaryValue: String
    
}

extension WordDataModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case defaultValue = "text_eng"
        case secondaryValue = "text_spa"
    }
}

struct WordDataListModel: Decodable {
    var response: [WordDataModel]
}
