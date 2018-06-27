//
//  ViewController.swift
//  Quiz IT
//
//  Created by Jonas Kühn on 26.06.18.
//  Copyright © 2018 sanoj.de. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    let inputContainerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginRegisterButton: UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        btn.setTitle("Register", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        btn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return btn
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Gamename"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let usernameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(inputContainerView)
        view.addSubview(loginRegisterButton)
        
        setupInputContainer()
        setupLoginRegisterButton()
    }
    var inputContainerHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var usernameTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupInputContainer() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerHeightAnchor = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputContainerHeightAnchor?.isActive = true
        
        //GAMENAMETEXTFIELD
        inputContainerView.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        //GAMENAMESEPERATOR
        inputContainerView.addSubview(nameSeperatorView)
        nameSeperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //USERNAMETEXTFIELD
        inputContainerView.addSubview(usernameTextField)
        usernameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: nameSeperatorView.topAnchor).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        usernameTextFieldHeightAnchor = usernameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        usernameTextFieldHeightAnchor?.isActive = true
        
        //USERNAMESEPERATOR
        inputContainerView.addSubview(usernameSeperatorView)
        usernameSeperatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        usernameSeperatorView.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor).isActive = true
        usernameSeperatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        usernameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //PASSWORDTEXTFIELD
        inputContainerView.addSubview(passTextField)
        passTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passTextField.topAnchor.constraint(equalTo: nameSeperatorView.topAnchor).isActive = true
        passTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    /*
     *
     *UNNUSED BACKGROUND STUFF HERE
     *
     */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func handleLoginRegister() {
        handleLogin()
    }
    
    @objc func handleLogin() {
        //@Firebase - if-- game (name) exists -> login --else-- create game (name) --
    }
    
    
    func handleRegister(){
        guard let gamename = nameTextField.text, let username = usernameTextField.text, let password = passTextField.text else{
            print("Non valid form")
            return
        }
        
        let values = ["gamename": gamename, "gamepassword":password, "username":username ]
        
        let ref = Database.database().reference(fromURL: "https://quiz-it-96145.firebaseio.com/")
        let usersRef = ref.child("games")
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let values2 = ["username": username, "logintime":"\(day).\(month) - \(hour):\(minutes)"]
        print("\(day).\(month) - \(hour):\(minutes)")
        usersRef.updateChildValues(values2, withCompletionBlock: { (err, ref) in
            if err != nil {
                return
            }
            print("SAVED USER SUCESSFULLY")
            self.dismiss(animated: true, completion: nil)
        })
        }
        
     }

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
