//
//  TextFieldViewController.swift
//  UIKITLern
//
//  Created by Doolot on 4/8/22.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    var uiElements = ["UILabel",
                      "UIButton",
                      "UIDatePicker",
                      "UISwitch"
    ]
    
    var selectedElement: String?
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textAlignment = .center
        
        datePicker.locale = Locale(identifier: "ru_Ru")
        
        choiceUIElement()
        createToolBar()
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(dissmisKeyBoard))
        doneButton.tintColor = .white
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
        
        // Castomization

        toolBar.backgroundColor = .white
        toolBar.barTintColor = .brown
    }
    @objc func dissmisKeyBoard() {
        view.endEditing(true)
    }
    func hideAllElements(){
        label.isHidden = true
        doneButton.isHidden = true
        datePicker.isHidden = true
        switchLabel.isHidden = true
        switchOutlet.isHidden = true
    }
    
    func choiceUIElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        // Castomization
        elementPicker.backgroundColor = .brown
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
    @IBAction func switchAction(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        doneButton.isHidden = !doneButton.isHidden
        
        if sender.isOn {
            switchLabel.text = "Отобразить все элементы"
        } else {
            switchLabel.text = "Скрыть все элементы"
        }
    }
}
extension TextFieldViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            label.isHidden = false
        case 1:
            hideAllElements()
            doneButton.isHidden = false
        case 2:
            hideAllElements()
            datePicker.isHidden = false
        case 3:
            hideAllElements()
            switchOutlet.isHidden = false
        default:
            hideAllElements()
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
}
