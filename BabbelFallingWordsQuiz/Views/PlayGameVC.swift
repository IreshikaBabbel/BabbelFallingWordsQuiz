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
            self.totalResultTextLabel.text = "0"
            self.setAnimationToCurrentModel(currentModel: self.wordDataModel[self.currentDataModelCount])

        }
    }
    
    @IBAction func onTrueAnswerButtonTouch(_ sender: UIButton) {
        self.getResultForAnswer(isAnswerTrue: true)
        self.setUIIterationOfSecondaryLangUI()
    }
    
    
    @IBAction func onFalseAnswerButtonTouch(_ sender: UIButton) {
        self.getResultForAnswer(isAnswerTrue: false)
        self.setUIIterationOfSecondaryLangUI()
    }
    
    // MARK: - Animation UI Implentation
    
    func setAnimationToCurrentModel(currentModel: WordDataModel)
    {
        currentDataModelCount += 1
        secondaryUIView = setSecondaryLangUIToMainView()
        defaultLangTextLabel.text! = currentModel.defaultValue
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: [], animations: { ()->
            Void in
            self.secondaryUIView.frame.origin.y = self.view.frame.maxY
            
        }, completion: { _ in
            self.getResultForAnswer(isAnswerTrue: false)
            self.setUIIterationOfSecondaryLangUI()
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
    
    // MARK: - Animation Logic Implentation
    
    func getResultForAnswer(isAnswerTrue: Bool) -> Void {
        if isAnswerTrue {
            totalResultTextLabel.text =   manager.setTotalScoreAccordingToUserTap( scoreVal: 1 );
        }
        else{
            totalResultTextLabel.text =   manager.setTotalScoreAccordingToUserTap( scoreVal: 0 );
        }
    }
    
    func setUIIterationOfSecondaryLangUI() {
        if currentDataModelCount != wordDataModel.count
        {
            resetSecondaryViewAnimation()
        }
        else
        {

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
}
