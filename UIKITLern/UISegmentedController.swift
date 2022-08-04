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
    override func viewDidLoad() {
        super.viewDidLoad()

        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControll.insertSegment(withTitle: "third", at: 2, animated: true)
        
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
}
