//
//  TabBarViewController.swift
//  Superheroes
//
//  Created by leogoba on 17.11.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var superheroes: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSetting()
        //fetch()
        prepareTVCs()
        //print(superheroes.count)
    }
    
    
    
    private func tabBarSetting() {
        let tabBarAppearance = UITabBarAppearance()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func prepareTVCs() {
        guard let viewControllers = viewControllers else { return }
        viewControllers.forEach { viewController in
            if let firstTVC = viewController as? FirstTableViewController {
                firstTVC.superheroes = superheroes
            } else if let secondTVC = viewController as? SecondTableViewController {
                secondTVC.superheroes = superheroes
            } else if let thirdCVC = viewController as? ThirdCollectionViewController {
                thirdCVC.superheroes = superheroes
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
