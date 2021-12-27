//
//  PinkodVC.swift
//  Apelsin
//
//  Created by 1 on 09/12/21.
//

import UIKit
import LocalAuthentication

class PinkodVC: UIViewController {
    let backButton        = UIButton()
    let pinCodLabel       = UILabel()
    let pinCodCreate      = UILabel()
    var tfListener = 0
    var codeTextFields: [UITextField] = []
    let textField = UITextField()
    let confirmationCodeStackView = UIStackView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
        
    }
    func initViews() {
        view.addSubview(backButton)
        backButton.setImage(UIImage(named: "left-arrow"), for: .normal)
        backButton.addTarget(self, action: #selector(gotoNewPasswordVC), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.left.equalToSuperview().inset(15)
            make.height.width.equalTo(35)
        }
        view.addSubview(pinCodLabel)
        pinCodLabel.text = "PIN-kod"
        pinCodLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pinCodLabel.font = .boldSystemFont(ofSize: 30)
        pinCodLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.25)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(150)
            make.height.equalTo(55)
            
        }
        view.addSubview(pinCodCreate)
        pinCodCreate.text = "PIN-kod yarating"
        pinCodCreate.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pinCodCreate.font = .systemFont(ofSize: 20)
        pinCodCreate.snp.makeConstraints { make in
            make.top.equalTo(pinCodLabel.snp.bottom).offset(20)
            make.left.equalTo(pinCodLabel.snp.left)
            make.width.equalTo(150)
            make.height.equalTo(25)
        }
        confirmationCodeStackView.axis = .horizontal
        confirmationCodeStackView.spacing = 15
        confirmationCodeStackView.distribution = .fillEqually
        
        for index in 0..<4 {
            let textField = UITextField()
            textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            textField.layer.cornerRadius = 20
            textField.textAlignment = .center
            textField.font = .systemFont(ofSize: 24)
            textField.keyboardType = .numberPad
            textField.delegate = self
            
            textField.tag = index
            textField.tintColor = .clear
            codeTextFields.append(textField)
            confirmationCodeStackView.addArrangedSubview(textField)
        }
        view.addSubview(confirmationCodeStackView)
        confirmationCodeStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
    }
    
    
    @objc func gotoNewPasswordVC() {
        dismiss(animated: true, completion: nil)
    }
    
}
extension PinkodVC: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                print("Backspace was pressed")
            }
        }
        
        tfListener = textField.tag
        
        guard let text = textField.text else {
            return false
        }
        
        if !text.isEmpty {
            if tfListener != 3 {
                if !string.isEmpty {
                    codeTextFields[tfListener + 1].text = string
                }
            } else {
                //                gotoApelsinVc()
                faceIdeButton()
            }
        }
        
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = newString.applyPatternOnNumbers("", "x", "x", 1)
        
        if !(codeTextFields[tfListener].text!.isEmpty) {
            if tfListener != 3 {
                codeTextFields[tfListener + 1].becomeFirstResponder()
            }
        }
        
        if string == ""{
            if tfListener != 0 {
                codeTextFields[tfListener - 1].becomeFirstResponder()
            }
        }
        
        return false
    }
    
    @objc func faceIdeButton() {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authorize with id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {[weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let alert = UIAlertController(title: "Failed to Authenticate", message: "Please try again.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true, completion: nil)
                        
                        return
                    }
                    
                    let vc = HomeTabBarContoller()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            }
        }else {
            let alert = UIAlertController(title: "Unavailabe", message: "You cant use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
}




