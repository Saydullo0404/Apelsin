//
//  ApelsinMenuViewCell.swift
//  Apelsin
//
//  Created by 1 on 15/12/21.
//

import UIKit

class ApelsinMenuViewCell: UICollectionViewCell {
    let humoImage       = UIImageView()
    let humoNameLabel   = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 18
        initViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func initViews() {
        self.addSubview(humoImage)
        humoImage.image = UIImage(named: "HumoLogo")
        humoImage.clipsToBounds = true
        humoImage.contentMode = .scaleAspectFit
        humoImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.centerY).multipliedBy(0.2)
            make.height.width.equalTo(45)
            make.centerX.equalToSuperview()
        }
        self.addSubview(humoNameLabel)
        humoNameLabel.text = "HUMOPay"
        humoNameLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        humoNameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        humoNameLabel.numberOfLines = 1
        humoNameLabel.lineBreakMode = .byWordWrapping
        humoNameLabel.snp.makeConstraints { make in
            make.top.equalTo(humoImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
            
        }
        
        
        
    }
}

