//
//  File.swift
//  Apelsin
//
//  Created by 1 on 10/12/21.
//

import UIKit

class HomeTabBarContoller: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
        
        
    }
    func initViews() {
        let main = ApelsinMenuVC()
        main.tabBarItem = UITabBarItem(title: "Asosiy", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
       let transfer = TransferVC()
        transfer.tabBarItem = UITabBarItem(title: "O'tkazma", image: UIImage(named: "startup"), selectedImage: UIImage(named: "startup"))
        let payment = PaymentVC()
        payment.tabBarItem = UITabBarItem(title: "To'lov", image: UIImage(named: "wallet"), selectedImage: UIImage(named: "wallet"))
        let chat   = ChatVC()
        chat.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "messenger"), selectedImage: UIImage(named: "messenger"))
        let menu = MenuVC()
        menu.tabBarItem = UITabBarItem(title: "Menyu", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu"))
        
        
        tabBar.tintColor = #colorLiteral(red: 0.9764705882, green: 0.4274509804, blue: 0, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.831372549, blue: 0.8352941176, alpha: 1)
        tabBar.isTranslucent = false
        viewControllers = [main ,transfer, payment ,chat ,menu]
    }
    
    
    
}

