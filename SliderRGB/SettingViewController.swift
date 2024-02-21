//
//  ViewController.swift
//  SliderRGB
//
//  Created by User on 04.02.2024.
//

import UIKit

final class SettingViewController: UIViewController {

    @IBOutlet var colorRGBView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var delegate: SettingViewControllerDelegate?
    var currentColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorRGBView.layer.cornerRadius = CGFloat(15)

        let ciCurrentColor = CIColor(color: currentColor)
        redSlider.value = Float(ciCurrentColor.red)
        greenSlider.value = Float(ciCurrentColor.green)
        blueSlider.value = Float(ciCurrentColor.blue)
 
        editColor()
    }

    @IBAction func editValueSlider() {
        if redValueLabel.text != String(format: "%.2f", redSlider.value) {
            redValueLabel.text = String(format: "%.2f", redSlider.value)
        } else if greenValueLabel.text != String(format: "%.2f", greenSlider.value) {
            greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        } else {
            blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        }
        
        editColor()
    }
    
    @IBAction func doneButtonAction() {
        delegate?.sendColor(color: colorRGBView.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    private func editColor() {
        colorRGBView.backgroundColor = UIColor.init(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1)
        )
 
    }

}
