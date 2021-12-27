//
//  NewPasswordVC.swift
//  Apelsin
//
//  Created by 1 on 08/12/21.
//

import UIKit

class NewPasswordVC: UIViewController {
    
    let leftArrowButton              = UIButton()
    let newPassworLabel              = UILabel()
    let createPasswordLabel          = UILabel()
    let passwordTextField            = UITextField()
    let reenterPasswordLabel         = UILabel()
    let reenterPasswordTextField     = UITextField()
    let passwordLabel                = UILabel()
    let contuneButton                = UIButton()
    let charactersLabel              = UILabel()
    let eyePassworButton              = UIButton()
    let eyeButton                 = UIButton()
    var isTapped                    = true
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9236214757, green: 0.9337256551, blue: 0.9419805408, alpha: 1)
        initViews()
        
    }
    func initViews() {
        view.addSubview(leftArrowButton)
        leftArrowButton.setImage(UIImage(named: "left-arrow"), for: .normal)
        leftArrowButton.addTarget(self, action: #selector(RegisterSmsVC), for: .touchUpInside)
        leftArrowButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.left.equalToSuperview().inset(15)
            make.height.width.equalTo(35)
        }
        view.addSubview(newPassworLabel)
        newPassworLabel.text = "Yangi parol"
        newPassworLabel.font = .boldSystemFont(ofSize: 35)
        newPassworLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newPassworLabel.numberOfLines = 1
        newPassworLabel.clipsToBounds = true
        newPassworLabel.snp.makeConstraints { make in
            make.top.equalTo(leftArrowButton.snp.bottom).offset(25)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.width.equalTo(250)
            
        }
        view.addSubview(createPasswordLabel)
        createPasswordLabel.text = "Parol yarating"
        createPasswordLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        createPasswordLabel.numberOfLines = 1
        createPasswordLabel.clipsToBounds = true
        createPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(newPassworLabel.snp.bottom).offset(20)
            make.left.equalTo(newPassworLabel.snp.left)
            make.height.equalTo(20)
            make.width.equalTo(150)
            
        }
        view.addSubview(passwordTextField)
        passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        passwordTextField.layer.cornerRadius = 18
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(createPasswordLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        view.addSubview(reenterPasswordLabel)
        reenterPasswordLabel.text = "Parolni qayta kiriting"
        reenterPasswordLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reenterPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.left.equalTo(passwordTextField.snp.left)
            make.height.equalTo(30)
            make.width.equalTo(250)
        }
        view.addSubview(reenterPasswordTextField)
        reenterPasswordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        reenterPasswordTextField.layer.borderWidth = 1
        reenterPasswordTextField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        reenterPasswordTextField.layer.cornerRadius = 18
        reenterPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(reenterPasswordLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        view.addSubview(passwordLabel)
        passwordLabel.text = "Parol yarating"
        passwordLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordLabel.font = .boldSystemFont(ofSize: 18)
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(reenterPasswordTextField.snp.bottom).offset(10)
            make.left.equalTo(reenterPasswordTextField.snp.left)
            make.height.equalTo(35)
            make.width.equalTo(150)
        }
        view.addSubview(contuneButton)
        contuneButton.setTitle("Davom ettirish", for: .normal)
        contuneButton.setTitleColor(#colorLiteral(red: 0.9321255684, green: 0.7949922085, blue: 0.5578553081, alpha: 1), for: .normal)
        contuneButton.addTarget(self, action: #selector(gotoPinkod), for: .touchUpInside)
        contuneButton.backgroundColor = #colorLiteral(red: 0.9543620944, green: 0.9001482129, blue: 0.8403456807, alpha: 1)
        contuneButton.layer.cornerRadius = 18
        contuneButton.clipsToBounds = true
        contuneButton.snp.makeConstraints { make in
            
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-15)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        view.addSubview(charactersLabel)
        charactersLabel.text = """
X 8 tadan 20 tagacha belgilar (shart)
X Kamida 1 ta lotin harf (shart)
X Kamida 1 ta son (shart)
X Kir belgilar taqiqlanadi (shart)
X Kamida 1 ta katta harf
X Kamida 1 ta maxsus belgi
"""
        charactersLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        charactersLabel.font = .systemFont(ofSize: 13)
        charactersLabel.numberOfLines = 0
        charactersLabel.textAlignment = .left
        charactersLabel.clipsToBounds = true
        charactersLabel.isEnabled = false
        charactersLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.left.equalTo(passwordLabel.snp.left)
            make.width.equalTo(view.snp.width).multipliedBy(0.70)
        }
        reenterPasswordTextField.addSubview(eyePassworButton)
        eyePassworButton.setImage(UIImage(named: "view"), for: .normal)
        eyePassworButton.addTarget(self, action: #selector(openKey), for: .touchUpInside)
        eyePassworButton.contentMode = .scaleAspectFit
        eyePassworButton.clipsToBounds = true
        eyePassworButton.snp.makeConstraints { make in
            make.centerY.equalTo(reenterPasswordTextField.snp.centerY)
            make.right.equalTo(reenterPasswordTextField.snp.right).inset(15)
            make.width.height.equalTo(25)
            
        }
        passwordTextField.addSubview(eyeButton)
        eyeButton.setImage(UIImage(named: "view"), for: .normal)
        eyeButton.contentMode = .scaleAspectFit
        eyeButton.clipsToBounds = true
        eyePassworButton.addTarget(self, action: #selector(openKey), for: .touchUpInside)
        eyeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.right.equalTo(passwordTextField.snp.right).inset(15)
            make.width.height.equalTo(25)
            
        }
        
        
    }
    
    @objc func RegisterSmsVC() {
        dismiss(animated: true, completion: nil)
    }
    @objc func gotoPinkod() {
        let vc = PinkodVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @objc func openKey() {
        if isTapped{
            passwordTextField.isSecureTextEntry = true
            isTapped = false
        }else {
            passwordTextField.isSecureTextEntry = false
            isTapped = true
        }
        
        if isTapped{
            reenterPasswordTextField.isSecureTextEntry = true
            isTapped = false
        }else {
            reenterPasswordTextField.isSecureTextEntry = false
            isTapped = true
        }
        
    }
    
}
