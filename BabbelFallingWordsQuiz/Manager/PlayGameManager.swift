//
//  PlayGameManager.swift
//  BabbelFallingWordsQuiz
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import Foundation
import Promises

class PlayGameManager {
    
    var totalScore = 0
    
    
    func readLanguageDataFromJson() -> Promise<[WordDataModel]> {
        return Promise<[WordDataModel]>(on: .global(qos: .background)) { (fullfill, reject) in
            var languageModel = [WordDataModel]()
            if let path = Bundle.main.path(forResource: "words", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    languageModel = try decoder.decode([WordDataModel].self, from: data)
                    
                } catch {
                    fullfill(languageModel)
                }
                fullfill(languageModel)
            }
        }
    }
    
    func setTotalScoreAccordingToUserTap(scoreVal: Int) -> String {
        totalScore += scoreVal
        if totalScore < 0
        {
            totalScore = 0
        }
        return   String(totalScore)
    }
    
    func setPercentageOfTotalScore(totalModelCount: Int) -> Int{
        return  Int(totalScore * 100/totalModelCount)
    }
}
