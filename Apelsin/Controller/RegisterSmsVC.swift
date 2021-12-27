//
//  RegisterSmsVC.swift
//  Apelsin
//
//  Created by 1 on 07/12/21.
//

import UIKit

class RegisterSmsVC: UIViewController {
    
    let backLeftButton            = UIButton()
    let assertionLabel        = UILabel()
    let unsolicitedsmsLabel   = UILabel()
    let kodLabel              = UILabel()
    let smsTextField          = UITextField()
    let resendButton          = UIButton()
    let contuneButton         = UIButton()
    let timeLabel             = UILabel()
    var count = 120
    
    @objc func update() {
        if(count > 0) {
            count -= 1
            timeLabel.text = timeFormatted(count)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9236214757, green: 0.9337256551, blue: 0.9419805408, alpha: 1)
        initViews()
    }
    func initViews() {
        view.addSubview(backLeftButton)
        backLeftButton.setImage(UIImage(named: "left-arrow"), for: .normal)
        backLeftButton.addTarget(self, action: #selector(ViewController), for: .touchUpInside)

        backLeftButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.left.equalToSuperview().inset(15)
            make.height.width.equalTo(35)
        }
        view.addSubview(assertionLabel)
        assertionLabel.text = "Tasdiqlash"
        assertionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        assertionLabel.numberOfLines = 1
        assertionLabel.font = .boldSystemFont(ofSize: 35)
        assertionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.25)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(65)
            make.width.equalTo(300)
        }
        view.addSubview(unsolicitedsmsLabel)
        unsolicitedsmsLabel.text = "Sizning **** ** ***5220 raqamingizga yuborilgan kodni kiriting"
        unsolicitedsmsLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        unsolicitedsmsLabel.numberOfLines = 2
        unsolicitedsmsLabel.textAlignment = .left
        unsolicitedsmsLabel.clipsToBounds = true
        unsolicitedsmsLabel.snp.makeConstraints { make in
            make.top.equalTo(assertionLabel.snp.bottom).offset(20)
            make.left.equalTo(assertionLabel.snp.left)
            make.width.equalTo(350)
            make.height.equalTo(65)
            
        }
        view.addSubview(kodLabel)
        kodLabel.text = "Kod kiriting"
        kodLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        kodLabel.numberOfLines = 1
        kodLabel.clipsToBounds = true
        kodLabel.font = .boldSystemFont(ofSize: 15)
        kodLabel.snp.makeConstraints { make in
            make.top.equalTo(unsolicitedsmsLabel.snp.bottom).offset(15)
            make.left.equalTo(unsolicitedsmsLabel.snp.left)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        view.addSubview(smsTextField)
        smsTextField.isSecureTextEntry = true
        smsTextField.layer.cornerRadius = 18
        smsTextField.layer.borderWidth = 1.5
        smsTextField.layer.borderColor = #colorLiteral(red: 0.9265894294, green: 0.5465037823, blue: 0.05168218166, alpha: 1)
        smsTextField.backgroundColor = .white
        smsTextField.snp.makeConstraints { make in
            make.top.equalTo(kodLabel.snp.bottom).offset(10)
            make.height.equalTo(60)
            make.left.right.equalToSuperview().inset(20)
        }
        view.addSubview(resendButton)
        resendButton.setTitle("Qayta yuboring", for: .normal)
        resendButton.setTitleColor(#colorLiteral(red: 0.9265894294, green: 0.5465037823, blue: 0.05168218166, alpha: 1), for: .normal)
        resendButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(smsTextField.snp.bottom).offset(25)
            make.left.equalTo(smsTextField.snp.left)
           
        }
        view.addSubview(timeLabel)
        timeLabel.text = "02:00"
        timeLabel.font = .systemFont(ofSize: 15)
        timeLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(smsTextField.snp.bottom).offset(10)
            make.left.equalTo(smsTextField.snp.left)
        }
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        view.addSubview(contuneButton)
        contuneButton.setTitle("Davom ettirish", for: .normal)
        contuneButton.setTitleColor(#colorLiteral(red: 0.9321255684, green: 0.7949922085, blue: 0.5578553081, alpha: 1), for: .normal)
        contuneButton.addTarget(self, action: #selector(newPage), for: .touchUpInside)
        contuneButton.backgroundColor = #colorLiteral(red: 0.9543620944, green: 0.9001482129, blue: 0.8403456807, alpha: 1)
        contuneButton.layer.cornerRadius = 18
        contuneButton.clipsToBounds = true
        contuneButton.snp.makeConstraints { make in

            make.bottom.equalTo(view.snp.bottom).offset(-60)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            


        }
        
    }
    @objc func ViewController() {
        dismiss(animated: true, completion: nil)
    
    
}
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    @objc func newPage() {
        let vc = NewPasswordVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}
