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
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textAlignment = .center
        
        datePicker.locale = Locale(identifier: "ru_Ru")
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true)
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        let dateFormator = DateFormatter()
        
        dateFormator.dateStyle = .full
        
        let dateValue = dateFormator.string(from: sender.date)
        
        label.text = dateValue
    }
}
