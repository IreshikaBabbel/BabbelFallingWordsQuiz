//
//  PlayGameVC.swift
//  BabbelFallingWordsQuiz
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController {

    // MARK: - UIView properties
    
    @IBOutlet weak var totalResultTextLabel: UILabel!
    @IBOutlet weak var defaultLangTextLabel: UILabel!
    @IBOutlet weak var falseAnswerButton: UIButton!
    @IBOutlet weak var trueAnswerButton: UIButton!
    @IBOutlet weak var defaultLangPlaceholderView: UIView!
    
    // MARK: - Custom Global properties
    
    let manager = PlayGameManager()
    
    // MARK: - Custom private properties
    
    private var wordDataModel = [WordDataModel]()
    private var currentDataModelCount = 0
    private var initialCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomUIPropertiesOfView()
        setInitialViewLogic()
    }
    
    // MARK: - Custom UI/Logic Implentation
    
    func setCustomUIPropertiesOfView()
    {
        defaultLangPlaceholderView.layer.borderColor = UIColor(red: 26/255, green: 82/255, blue: 118/255, alpha: 1).cgColor
        trueAnswerButton.layer.borderColor = UIColor(red: 130/255, green: 203/255, blue: 246/255, alpha: 1).cgColor
        falseAnswerButton.layer.borderColor = UIColor(red: 130/255, green: 203/255, blue: 246/255, alpha: 1).cgColor
    }

    func setInitialViewLogic() {
        manager.readLanguageDataFromJson().then{returnedModelArr in
            self.wordDataModel = returnedModelArr
            self.currentDataModelCount = self.initialCount
            self.manager.totalScore = self.initialCount
            self.totalResultTextLabel.text = "0"

        }
    }
    
    
}
