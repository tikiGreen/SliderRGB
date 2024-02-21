//
//  MainViewController.swift
//  SliderRGB
//
//  Created by User on 21.02.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let SettingVC = segue.destination as? SettingViewController
        SettingVC?.delegate = self
        SettingVC?.currentColor = view.backgroundColor ?? UIColor.white
    }

}

// MARK: - MainViewController
extension MainViewController: SettingViewControllerDelegate {
    func sendColor(color: UIColor) {
        view.backgroundColor = color
    }
}

// MARK: - SettingViewControllerDelgate
protocol SettingViewControllerDelegate: AnyObject {
    func sendColor(color: UIColor)
}
