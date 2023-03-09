//
//  HomeTabBar.swift
//  OPTOMNI
//
//  Created by Kareem Elfadaly on 10/08/2022.
//

import UIKit

class HomeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        self.tabBar.tintColor = UIColor.PrimaryColor
        self.tabBar.backgroundColor = .white

    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > (idx + 1)  else { return }
    }

    func setViewControllers() {
        var controllers = [UIViewController]()
        controllers = [
            Storyboard.Home.initialViewController(),
            Storyboard.Marketplace.initialViewController(),
            Storyboard.Orders.initialViewController(),
            Storyboard.Chats.initialViewController()
        ]

        self.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        setItems()
    }

    func setItems(){
        setTabBarItems(item: 0, image: UIImage(named: "home")!, imageSelected: UIImage(named: "home-2")!, title: "Home")
        setTabBarItems(item: 1, image: UIImage(named: "marketplace")!, imageSelected: UIImage(named: "marketplace-2")!, title: "Marketplace")
        setTabBarItems(item: 2, image: UIImage(named: "shopping-bag")!, imageSelected: UIImage(named: "shopping-bag-2")!, title: "Orders")
        setTabBarItems(item: 3, image: UIImage(named: "bubble-chat")!, imageSelected: UIImage(named: "bubble-chat-2")!, title: "Chats")

    }

    private func setTabBarItems(item: Int, image: UIImage, imageSelected: UIImage, title: String) {
        self.tabBar.items![item].title = title
        self.tabBar.items![item].image = image
        self.tabBar.items![item].selectedImage = imageSelected
    }

}
