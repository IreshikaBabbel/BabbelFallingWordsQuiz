//
//  FallingCustomView.swift
//  BabbelFallingWordsQuiz
//
//  Created by Ireshika on 09.06.19.
//  Copyright © 2019 Ireshika Piyumalie. All rights reserved.
//

import UIKit

class FallingCustomView: UIView {

    @IBOutlet weak var secondaryLangContentView: UIView!
    
    @IBOutlet weak var secondaryLangTextLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Custom UI Implentation
    
    func setCustomUIImplementation() {
        secondaryLangContentView.layer.borderColor = UIColor(red: 26/255, green: 82/255, blue: 118/255, alpha: 1).cgColor
    }
}

