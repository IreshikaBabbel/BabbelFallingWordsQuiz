//
//  PlayGameVC.swift
//  BabbelFallingWordsQuiz
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import UIKit

class PlayGameVC: UIViewController, UserRetryDelegate, CAAnimationDelegate{

    // MARK: - UIView properties
    
    @IBOutlet weak var defaultLangContainerView: UIView!
    @IBOutlet weak var totalResultTextLabel: UILabel!
    @IBOutlet weak var defaultLangTextLabel: UILabel!
    @IBOutlet weak var falseAnswerButton: UIButton!
    @IBOutlet weak var trueAnswerButton: UIButton!
    @IBOutlet weak var defaultLangPlaceholderView: UIView!
    private var animator : UIViewPropertyAnimator? = nil

    // MARK: - Custom Global properties
    
    let manager = PlayGameManager()
    
    // MARK: - Custom private properties
    
    private var wordDataModel = [WordDataModel]()
    private var currentDataModelCount = 0
    private var initialCount = 0
    private var secondaryUIView: FallingCustomView!

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
            self.totalResultTextLabel.text = "\(0)/ \(self.wordDataModel.count)"
            self.setAnimationToCurrentModel(currentModel: self.wordDataModel[self.currentDataModelCount])
        }
    }
    
    @IBAction func onTrueAnswerButtonTouch(_ sender: UIButton) {
        self.getResultForAnswer(isAnswerTrue: true)
        self.setUIIterationOfSecondaryLangUI()
    }
    
    
    @IBAction func onFalseAnswerButtonTouch(_ sender: UIButton) {
        self.getResultForAnswer(isAnswerTrue: false)
        self.resetExsistingAnimation()
        self.defaultLangContainerView.layer.add(self.getShakeAnimation(), forKey: "shake")
    }
    
    // MARK: - Animation UI Implentation
    
    func setAnimationToCurrentModel(currentModel: WordDataModel)
    {
        currentDataModelCount += 1
        secondaryUIView = setSecondaryLangUIToMainView()
        defaultLangTextLabel.text! = currentModel.defaultValue
        secondaryUIView.secondaryLangTextLabel.text = currentModel.secondaryValue
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: [], animations: { ()->
            Void in
            self.secondaryUIView.frame.origin.y = self.view.frame.maxY
            
        }, completion: { _ in
            self.getResultForAnswer(isAnswerTrue: false)
            self.defaultLangContainerView.layer.add(self.getShakeAnimation(), forKey: "shake")
        })
    }
    
    func setSecondaryLangUIToMainView() -> FallingCustomView {
        let fallingCustomView =  Bundle.main.loadNibNamed("FallingCustomView", owner: self, options: nil)?.first as! FallingCustomView
        fallingCustomView.frame =
            CGRect(x:  0, y: 100.0, width: 150, height: 225)
        view.addSubview(fallingCustomView)
        fallingCustomView.clipsToBounds = true
        fallingCustomView.center.x = view.center.x
        return fallingCustomView
    }
    
    func getShakeAnimation() -> CAKeyframeAnimation
    {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        animation.delegate = self
        return animation
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.setUIIterationOfSecondaryLangUI()
    }
    
    // MARK: - Animation Logic Implentation
    
    func getResultForAnswer(isAnswerTrue: Bool) -> Void {
        var totalResultForUIUpdate = "0"
        if isAnswerTrue {
            totalResultForUIUpdate =   manager.setTotalScoreAccordingToUserTap( scoreVal: 1 );
        }
        else{
            totalResultForUIUpdate =   manager.setTotalScoreAccordingToUserTap( scoreVal: 0 );
        }
        totalResultTextLabel.text = "\(totalResultForUIUpdate)/ \(self.wordDataModel.count)"

    }
    
    func setUIIterationOfSecondaryLangUI() {
        if currentDataModelCount != wordDataModel.count
        {
            resetSecondaryViewAnimation()
        }
        else
        {
            resetExsistingAnimation()
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let  userFeedbackVC = storyBoard.instantiateViewController(withIdentifier: "UserFeedbackVC") as! UserFeedbackVC
            userFeedbackVC.delegate = self
            userFeedbackVC.modalPresentationStyle = .overCurrentContext
            userFeedbackVC.userScorePercentageVal = Int(manager.setPercentageOfTotalScore(totalModelCount: wordDataModel.count))
            self.present(userFeedbackVC, animated: true, completion:  {
            })
        }
    }
    
    func resetSecondaryViewAnimation(){
        resetExsistingAnimation()
        setAnimationToCurrentModel(currentModel: wordDataModel[currentDataModelCount])
    }
    
    func resetExsistingAnimation(){
        self.view.subviews.forEach({$0.layer.removeAllAnimations()})
        animator?.stopAnimation(true)
        secondaryUIView.removeFromSuperview()
        self.view.layer.removeAllAnimations()
    }
    
    func userStatusForRetying(isRetryTouched: Bool) {
        if isRetryTouched
        {
            setInitialViewLogic()
        }
    }
}
