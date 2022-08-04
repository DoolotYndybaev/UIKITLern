//
//  UISegmentedController.swift
//  UIKITLern
//
//  Created by Doolot on 4/8/22.
//

import UIKit

class UISegmentedController: UIViewController {
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1

        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControll.insertSegment(withTitle: "third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segmentedControll.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is select"
            label.textColor = .red
        case 1:
            label.text = "The second segment is select"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is select"
            label.textColor = .yellow

        default:
            print("Sothing is wrong")
        }
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backGroundColor = self.view.backgroundColor
        
        self.view.backgroundColor = backGroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
}
