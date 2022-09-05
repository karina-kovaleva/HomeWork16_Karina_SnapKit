//
//  ViewController.swift
//  HomeWork16_Karina
//
//  Created by Karina Kovaleva on 5.09.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UpdateTextDelegate, ButtonDelegate {
    let viewForButtons = ViewForButtons()
    let viewForTextFields = ViewForTextFields()
    let textView = UITextView()
  
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewForButtons)
        self.view.addSubview(viewForTextFields)
        self.view.addSubview(textView)
          
        viewForTextFields.updateTextDelegate = self
        viewForButtons.buttonDelegate = self
        
        viewForTextFields.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(textView.snp.top).offset(-10)
            make.left.equalTo(self.view.snp.left).offset(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.height.equalTo(150)
        }
        
        viewForButtons.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.view.snp.left).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-10)
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.height.equalTo(50)
        }

        textView.backgroundColor = #colorLiteral(red: 0.8255599141, green: 0.8255599141, blue: 0.8255599141, alpha: 1)
        textView.text = "Notes:"
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "Times New Roman", size: 20)
        
        textView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.left.equalTo(self.view.snp.left).offset(10)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-10)
            make.bottom.equalTo(viewForButtons.snp.top).offset(-10)
        }
    }
    
    func textFieldText(_ textField: UITextField) {
        if self.text != nil {
            self.text! += textField.text!
        } else {
            self.text = textField.text
        }
    }
    
    func save() {
        textView.text = self.text
    }
    
    func clear() {
        textView.text = nil
        text = nil
    }
    
    func cancel() {
        print("Cancel")
    }
}

