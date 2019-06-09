//
//  UserFeedbackVC.swift
//  BabbelFallingWordsQuiz
//
//  Created by Bhashitha on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import UIKit

protocol UserRetryDelegate {
    func userStatusForRetying(isRetryTouched: Bool)
}

class UserFeedbackVC: UIViewController {

    // MARK: - UIView properties
    
    @IBOutlet weak var medalStatusLabel: UILabel!
    @IBOutlet weak var scorePercentageLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    // MARK: - Custom Global properties
    
    var delegate: UserRetryDelegate?
    var userScorePercentageVal: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserFeedbackVCUIValues()
    }
    
    // MARK: - UI Logic Implementatin
    
    @IBAction func onRetryButtonTouch(_ sender: UIButton) {
        delegate?.userStatusForRetying(isRetryTouched: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUserFeedbackVCUIValues()
    {
        var userScoredVal = NSLocalizedString("EmptyMedal", comment: "")
        var medalTextColor = UIColor(red: 26/255, green: 82/255, blue: 118/255, alpha: 1)
        
        switch Int(userScorePercentageVal) {
        case 0...30:
            userScoredVal = NSLocalizedString("EmptyMedal", comment: "")
            medalTextColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1)
        case 31...50:
            userScoredVal = NSLocalizedString("BronzeMedal", comment: "")
            medalTextColor = UIColor(red: 176/255, green: 141/255, blue: 87/255, alpha: 1)
        case 51...70:
            userScoredVal = NSLocalizedString("SilverMedal", comment: "")
            medalTextColor = UIColor(red: 196/255, green: 202/255, blue: 206/255, alpha: 1)
        case 71...100:
            userScoredVal = NSLocalizedString("GoldMedal", comment: "")
            medalTextColor = UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
        default:
            print("Fallback option")
        }
        medalStatusLabel.text! = userScoredVal
        medalStatusLabel.textColor = medalTextColor
        scorePercentageLabel.textColor = medalTextColor
        
        let percentageVal = String(userScorePercentageVal)
        let scoreStrVal = NSLocalizedString("Score", comment: "")
        scorePercentageLabel.text! = "\(scoreStrVal) \(percentageVal) \("%")"
    }
    
}

