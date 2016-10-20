//
//  LoginViewController.swift
//  codepath_week2_lab_facebook
//
//  Created by StudyBlue on 10/19/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var fieldSuperview: UIView!
    @IBOutlet weak var labelSuperview: UIView!
    @IBOutlet weak var activityAnimator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    var logoInitialY: CGFloat!
    var logoOffset: CGFloat!
    
    var fieldInitialY: CGFloat!
    var fieldOffset: CGFloat!
    
    var labelInitialY: CGFloat!
    var labelOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        logoInitialY = logoImage.frame.origin.y
        logoOffset = -25
        
        fieldInitialY = fieldSuperview.frame.origin.y
        fieldOffset = -40
        
        labelInitialY = labelSuperview.frame.origin.y
        labelOffset = -310
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main){ (notification: Notification) in
            self.logoImage.frame.origin.y = self.logoInitialY + self.logoOffset
            self.fieldSuperview.frame.origin.y = self.fieldInitialY + self.fieldOffset
            self.labelSuperview.frame.origin.y = self.labelInitialY + self.labelOffset
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main){ (notification: Notification) in
            self.logoImage.frame.origin.y = self.logoInitialY
            self.fieldSuperview.frame.origin.y = self.fieldInitialY
            self.labelSuperview.frame.origin.y = self.labelInitialY
        }
        
    }
    
    @IBAction func didTapOutsideTextField(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func didPressLogIn(_ sender: UIButton) {
        logInButton.isSelected = true
        activityAnimator.startAnimating()
        
        if self.emailTextField.text == "qwert" && self.passwordTextField.text == "asdf" {
            delay(1, closure: {
                self.activityAnimator.stopAnimating()
                self.performSegue(withIdentifier: "successSegue", sender: nil)
                self.logInButton.isSelected = false
            })
        } else {
            delay(2, closure: { () -> () in
                self.activityAnimator.stopAnimating()
                let alertController = UIAlertController(title: "That wasn't it.", message: "Your email-password combo was incorrect", preferredStyle: .alert)
                let oopsAction = UIAlertAction(title: "Try Again", style: .default, handler: { (action: UIAlertAction) in
                })
                alertController.addAction(oopsAction)
                self.present(alertController, animated: true, completion: nil)
                self.logInButton.isSelected = false
            })
        }
        
        // End of didPressLogin
    }












    
    
    
}
