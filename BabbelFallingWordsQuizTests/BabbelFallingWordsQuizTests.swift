//
//  BabbelFallingWordsQuizTests.swift
//  BabbelFallingWordsQuizTests
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import XCTest
@testable import BabbelFallingWordsQuiz

class BabbelFallingWordsQuizTests: XCTestCase {

    var manager: PlayGameManager!
    var languageModel = [WordDataModel]()
    
    override func setUp() {
        super.setUp()
        manager = PlayGameManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReadLanguageDataFromJsonSuccess() {
        manager.readLanguageDataFromJson().then{returnedModelArr in
            self.languageModel = returnedModelArr
        }
        XCTAssertNotNil(languageModel.count)
    }
    
    func testSetTotalScoreAccordingToUserTapSuccess() {
        manager.totalScore = 10
        let totalScoreTest  = manager.setTotalScoreAccordingToUserTap(scoreVal: 5)
        XCTAssertEqual(Int(totalScoreTest), 15)
    }
    
    func testSetPercentageOfTotalScoreSuccess() {
        manager.totalScore = 5
        let totalScoreTest  = manager.setPercentageOfTotalScore(totalModelCount: 10)
        XCTAssertEqual(Int(totalScoreTest), 50)
    }
    
}
