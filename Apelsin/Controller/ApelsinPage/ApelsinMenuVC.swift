//
//  ApelsinMenuVC.swift
//  Apelsin
//
//  Created by 1 on 09/12/21.
//

import UIKit


class ApelsinMenuVC: UIViewController, UISearchBarDelegate {
    
    
    let searchBar                 = UISearchBar()
    let menuButton                = UIButton()
    let allBalansLabel            = UILabel()
    let balanseNumberLabel        = UILabel()
    let strelkaImageView          = UIImageView()
    let eyeImageView              = UIImageView()
    let allView                   = UIView()
    let numberOfView              = UIView()
    let calendarButton            = UIButton()
    let bellButton                = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9321532249, green: 0.385355413, blue: 0.02455096692, alpha: 1)
        initViews()
        
    }
    func initViews() {
        view.addSubview(searchBar)
        searchBar.isTranslucent = true
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Qidirish", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        searchBar.searchTextField.textColor = .white
        searchBar.barTintColor = #colorLiteral(red: 0.947088182, green: 0.5999136567, blue: 0.231975019, alpha: 1)
        searchBar.isHidden = false
        searchBar.searchTextField.borderStyle = .none
        searchBar.delegate = self
        searchBar.layer.cornerRadius = 20
        searchBar.clipsToBounds = true
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).multipliedBy(0.1)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.right.equalToSuperview().inset(78)
        }
        view.addSubview(menuButton)
        menuButton.setImage(UIImage(named: "MenuButton"), for: .normal)
        menuButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar.snp.centerY)
            make.left.equalToSuperview().inset(15)
            make.width.height.equalTo(45)
            
        }
        view.addSubview(allBalansLabel)
        allBalansLabel.text = "Jami balans"
        allBalansLabel.textColor = .white
        allBalansLabel.font = .systemFont(ofSize: 18)
        allBalansLabel.numberOfLines = 1
        allBalansLabel.clipsToBounds = true
        allBalansLabel.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(35)
            make.left.equalTo(menuButton.snp.left)
            make.height.equalTo(20)
        }
        view.addSubview(strelkaImageView)
        strelkaImageView.image = UIImage(named: "Strelka")
        strelkaImageView.contentMode = .scaleAspectFit
        strelkaImageView.clipsToBounds = true
        strelkaImageView.snp.makeConstraints { make in
            make.top.equalTo(allBalansLabel.snp.bottom).offset(20)
            make.left.equalTo(allBalansLabel.snp.left)
            make.height.width.equalTo(35)
        }
        view.addSubview(balanseNumberLabel)
        balanseNumberLabel.text = "0 UZS"
        balanseNumberLabel.textColor = .white
        balanseNumberLabel.font = .boldSystemFont(ofSize: 30)
        balanseNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(strelkaImageView.snp.centerY)
            make.left.equalTo(strelkaImageView.snp.right).inset(-10)
            
            
        }
        view.addSubview(eyeImageView)
        eyeImageView.image = UIImage(named: "eyeicon8")
        eyeImageView.contentMode = .scaleAspectFit
        eyeImageView.clipsToBounds = true
        eyeImageView.snp.makeConstraints { make in
            make.centerY.equalTo(balanseNumberLabel.snp.centerY)
            make.right.equalToSuperview().inset(25)
            make.height.width.equalTo(35)
        }
        view.addSubview(allView)
        allView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        allView.layer.cornerRadius = 25
        allView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        allView.snp.makeConstraints { make in
            make.top.equalTo(balanseNumberLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.bottom.equalToSuperview()
            
        }
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(menuButton.snp.centerY)
            make.left.equalTo(searchBar.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        stackView.addArrangedSubview(calendarButton)
        calendarButton.setImage(UIImage(named: "icons8-calendar-24"), for: .normal)
        calendarButton.clipsToBounds = true
        calendarButton.contentMode = .scaleAspectFit
        calendarButton.snp.makeConstraints { make in
            
            
        }
        stackView.addArrangedSubview(bellButton)
        bellButton.setImage(UIImage(named: "icons8notification"), for: .normal)
        bellButton.clipsToBounds = true
        bellButton.contentMode = .scaleAspectFit
        
        
        
        
    }
    
}
