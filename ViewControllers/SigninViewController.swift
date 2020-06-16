//
//  SigninViewController.swift
//  ProjectforOldmanTests
//
//  Created by Peem on 26/5/2563 BE.
//  Copyright © 2563 Peem. All rights reserved.
//

import UIKit

final class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var signinAPIManager: SigninAPIManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
        signinButton.layer.cornerRadius = 20
        signinButton.clipsToBounds = true
        signinButton.layer.shadowRadius = 10
        signinButton.layer.shadowOpacity = 1.0
        signinButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        signinButton.layer.shadowColor = UIColor.white.cgColor
        
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
        registerButton.layer.shadowRadius = 10
        registerButton.layer.shadowOpacity = 1.0
        registerButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        registerButton.layer.shadowColor = UIColor.white.cgColor
        
        setupView()
        setupData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches,
                           with: event)
        
        view.endEditing(true)
    }

    @IBAction func signinButtonTapped(_ sender: Any) {
        signinAPIManager?.signin(optionalEmail: emailTextField.text,
                                 optionalPassword: passwordTextField.text)
    }
    
    private func setupView() {
        setupTextFields()
    }
    
    private func setupTextFields() {
        let textFields = [emailTextField, passwordTextField]
        
        textFields.forEach{ $0?.delegate = self }
    }
    
    private func setupData() {
        setupServices()
    }
    
    private func setupServices() {
        signinAPIManager = SigninAPIManagerImplementation()
        signinAPIManager?.setSigninAPIManagerDelegate(self)
    }
    
}

extension SigninViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            signinAPIManager?.signin(optionalEmail: emailTextField.text,
                                     optionalPassword: passwordTextField.text)
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
}

extension SigninViewController: SigninAPIManagerDelegate {
    
    func didSigninCompletion(user: User) {
        let alertController = UIAlertController(title: "Success",
                                                message: "เข้าสู่ระบบเสร็จสิ้น",
                                                preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm",
                                          style: .default,
                                          handler: nil)

        alertController.addAction(confirmAction)
        
        present(alertController,
                animated: true,
                completion: nil)
       
    }
    
    func didSigninFailure(error: Error) {
        let alertController = UIAlertController(title: "Warning!",
                                                message: ErrorHelper.errorMessage(genernalError: error as! GeneralError),
                                                preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm",
                                          style: .cancel,
                                          handler: nil)
        
        alertController.addAction(confirmAction)
        
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func RegisterTapButton(){
       let vc = storyboard?.instantiateViewController(identifier: "register") as! RegisterTableViewController
       vc.modalPresentationStyle = .fullScreen
       present(vc,animated: true)
       }
    
}
