//
//  ViewController.swift
//  UIKITLern
//
//  Created by Doolot on 4/8/22.
//

import UIKit

class ButtonLabelViewController: UIViewController {
    
    @IBOutlet var actionButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        
        button.setTitle("clear", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
        
        button.isHidden = true
        
        for button in actionButtons {
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .green
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        label.isHidden = false
        button.isHidden = false
        
        if sender.titleLabel?.text == "Action1" {
            label.text = "Hello world"
            label.textColor = .red
        } else if sender.titleLabel?.text == "Action2" {
            label.text = "Hi there"
            label.textColor = .blue
        } else if sender.titleLabel?.text == "clear" {
            label.isHidden = true
            button.isHidden = true
        }
    }
    
}

