//
//  MainViewController.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var serviceManager : ServiceManagerProtocol?
    var sesssionManager : SessionManagerProtocol?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var ceditScoreArcView: ArcView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ceditScoreArcView.counter = 0
        scoreLabel.text = ""
        
        sesssionManager = SessionManager.sharedInstance
        serviceManager = ServiceManager()
        serviceManager?.getCreditData(handler : { [weak self] error in
            if let _ = error {
                self?.showAlert(viewController: self!, title: "Network Error", message: "Please Check Connection")
            } else {
                
                //set data
                if let maxScore = self?.sesssionManager?.creditInfoUser?.maxScoreValue {
                    self?.ceditScoreArcView.totalScore = maxScore
                    self?.totalLabel.text = "out of \(maxScore)"
                }
                if let currentScore = self?.sesssionManager?.creditInfoUser?.score {
                    self?.ceditScoreArcView.counter = currentScore
                    self?.scoreLabel.text = "\(currentScore)"
 
                }
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //TODO: - Add a retry && move to extension
    func showAlert(viewController : UIViewController, title : String, message : String) {
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            viewController.dismiss(animated: true, completion: { () -> Void in
            })
        }
        let alertView:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertView.addAction(alertAction)
        viewController.present(alertView, animated: true, completion: { () -> Void in
            
        })
    }


}
