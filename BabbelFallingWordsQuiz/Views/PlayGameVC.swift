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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomUIPropertiesOfView()

    }
    
    // MARK: - Custom UI/Logic Implentation
    
    func setCustomUIPropertiesOfView()
    {
        defaultLangPlaceholderView.layer.borderColor = UIColor(red: 26/255, green: 82/255, blue: 118/255, alpha: 1).cgColor
        trueAnswerButton.layer.borderColor = UIColor(red: 130/255, green: 203/255, blue: 246/255, alpha: 1).cgColor
        falseAnswerButton.layer.borderColor = UIColor(red: 130/255, green: 203/255, blue: 246/255, alpha: 1).cgColor
    }

}
