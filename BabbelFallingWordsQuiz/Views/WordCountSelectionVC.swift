//
//  LanguageSelectionVC.swift
//  BabbelFallingWordsQuiz
//
//  Created by Bhashitha on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import UIKit
import QuartzCore

class WordCountSelectionVC: UIViewController {
    
    // MARK: - UI properties

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var wordCountSlider: UISlider!
    @IBOutlet weak var sliderMaxValLabel: UILabel!
    
    @IBOutlet weak var sliderSelectedValLabel: UILabel!
    @IBOutlet weak var sliderMinValLabel: UILabel!
    // MARK: - Custom Global properties
    
    let manager = PlayGameManager()
    var wordDataModel = [WordDataModel]()
    var sliderSelectedVal = 1
    // MARK: - Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialViewLogic()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UI Logics
    func setCustomUIForView()
    {
    }

    func setInitialViewLogic() {
        manager.readLanguageDataFromJson().then{returnedModelArr in
            self.wordDataModel = returnedModelArr
            self.wordCountSlider.minimumValue = 1
            self.wordCountSlider.maximumValue = Float(self.wordDataModel.count)
            self.sliderMaxValLabel.text = String(self.wordDataModel.count)
            self.sliderMinValLabel.text = "1"
        }
    }
   

    @IBAction func onWordCountSliderValChanged(_ sender: UISlider) {
        sliderSelectedVal = Int(sender.value)
        sliderSelectedValLabel.text = "\(sliderSelectedVal)"
    }
    @IBAction func onGoButtonTouch(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let  playGameVC = storyBoard.instantiateViewController(withIdentifier: "PlayGameVC") as! PlayGameVC
        let accessValueOfModel = sliderSelectedVal - 1
        playGameVC.wordDataModel = Array(wordDataModel[0...accessValueOfModel])
        self.navigationController?.pushViewController(playGameVC, animated: true)

    }
    
}
