//
//  ViewController.swift
//  StateCheckSample
//
//  Created by Satoshi Komatsu on 2019/02/09.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var currentTime: Date!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentTime = Date()
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.currentTimeUpdate),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        
        currentTimeLabel.text = dateFormatting()
    }
    
    @objc func currentTimeUpdate() {
        currentTime = Date()
        currentTimeLabel.text = dateFormatting()
    }
    
    func dateFormatting() -> String {
        formatter.setLocalizedDateFormatFromTemplate("jms")
        
        return formatter.string(from: currentTime)
    }
}
