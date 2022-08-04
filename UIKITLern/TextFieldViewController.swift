//
//  TextFieldViewController.swift
//  UIKITLern
//
//  Created by Doolot on 4/8/22.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        label.textAlignment = .center
    }

    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
            
        if let _ = Double(textField.text!) {
            print("Name format is wrong")
        } else {
        label.text = textField.text
        }
    }
}
