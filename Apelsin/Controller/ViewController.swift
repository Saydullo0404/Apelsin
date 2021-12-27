//
//  ViewController.swift
//  Apelsin
//
//  Created by 1 on 06/12/21.
//

import UIKit
import SnapKit
import FlagPhoneNumber

class ViewController: UIViewController, UITextFieldDelegate {
    
    let connectionButton   = UIButton()
    let welcomeLabel       = UILabel()
    let phoneNumberLabel   = UILabel()
    let phoneTextField     = FPNTextField()
    let contuneButton      = UIButton()
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)

 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9236214757, green: 0.9337256551, blue: 0.9419805408, alpha: 1)
        initViews()
        contuneButton.addTarget(self, action: #selector(registerSmsVC), for: .touchUpInside)
        
    }
    func initViews() {
        view.addSubview(connectionButton)
        connectionButton.setTitle("Bank bilan aloqa", for: .normal)
        connectionButton.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
        connectionButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        connectionButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
            make.width.equalTo(150)
        }
        view.addSubview(welcomeLabel)
        welcomeLabel.text = "Hush kelibsiz"
        welcomeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        welcomeLabel.font = .boldSystemFont(ofSize: 35)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.35)
            make.left.equalToSuperview().inset(20)
            
            
        }
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.text = "Telefon raqamini kiriting"
        phoneNumberLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        phoneNumberLabel.numberOfLines = 0
        phoneNumberLabel.clipsToBounds = true
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.left.equalTo(welcomeLabel.snp.left)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        view.addSubview(phoneTextField)
        phoneTextField.textAlignment = .left
        phoneTextField.layer.borderWidth = 1
        phoneTextField.delegate = self
        
        phoneTextField.layer.borderColor = #colorLiteral(red: 0.9321255684, green: 0.7949922085, blue: 0.5578553081, alpha: 1)
        phoneTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        phoneTextField.layer.cornerRadius = 18
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(5)
            make.height.equalTo(55)
            make.left.right.equalToSuperview().inset(20)
 
        }
        view.addSubview(contuneButton)
        contuneButton.setTitle("Davom ettirish", for: .normal)
        contuneButton.setTitleColor(#colorLiteral(red: 0.9321255684, green: 0.7949922085, blue: 0.5578553081, alpha: 1), for: .normal)
        
        contuneButton.backgroundColor = #colorLiteral(red: 0.9543620944, green: 0.9001482129, blue: 0.8403456807, alpha: 1)
        contuneButton.layer.cornerRadius = 18
        contuneButton.clipsToBounds = true
        contuneButton.snp.makeConstraints { make in

            make.bottom.equalTo(view.snp.bottom).offset(-60)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            


        }
        
        
        
    }
    @objc func registerSmsVC() {
        let vc = RegisterSmsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}



extension ViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
    }
    
    
 
    
    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)
        
        present(navigationViewController, animated: true, completion: nil)
     }

}
