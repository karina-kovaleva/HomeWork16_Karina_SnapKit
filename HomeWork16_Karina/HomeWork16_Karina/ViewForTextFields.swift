//
//  ViewForTextFields.swift
//  HomeWork16_Karina
//
//  Created by Karina Kovaleva on 5.09.22.
//

import UIKit

protocol UpdateTextDelegate: AnyObject {
    func textFieldText (_ textField: UITextField)
}

class ViewForTextFields: UIView, UITextFieldDelegate {
    
    weak var updateTextDelegate: UpdateTextDelegate?
    
    let stackForFirstName = UIStackView()
    let stackForMiddleName = UIStackView()
    let stackForLastName = UIStackView()
    let combineNameStack = UIStackView()
    let stackWithImage = UIStackView()
    
    let avatar = UIImageView()
    
    let firstNameLabel = UILabel()
    let middleNameLabel = UILabel()
    let lastNameLabel = UILabel()
    
    let firstNameTextField = UITextField()
    let middleNameTextField = UITextField()
    let lastNameTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackWithImage)
        stackWithImage.addArrangedSubview(avatar)
        stackWithImage.addArrangedSubview(combineNameStack)
        combineNameStack.addArrangedSubview(stackForFirstName)
        combineNameStack.addArrangedSubview(stackForMiddleName)
        combineNameStack.addArrangedSubview(stackForLastName)

        stackForFirstName.addArrangedSubview(firstNameLabel)
        stackForFirstName.addArrangedSubview(firstNameTextField)
        stackForMiddleName.addArrangedSubview(middleNameLabel)
        stackForMiddleName.addArrangedSubview(middleNameTextField)
        stackForLastName.addArrangedSubview(lastNameLabel)
        stackForLastName.addArrangedSubview(lastNameTextField)
        
        stackForFirstName.axis = .horizontal
        stackForMiddleName.axis = .horizontal
        stackForLastName.axis = .horizontal
        combineNameStack.axis = .vertical
        stackWithImage.axis = .horizontal
        
        stackForFirstName.distribution = .fill
        stackForMiddleName.distribution = .fill
        stackForLastName.distribution = .fill
        combineNameStack.distribution = .fillEqually
        stackWithImage.distribution = .fill
        
        stackForFirstName.alignment = .fill
        stackForMiddleName.alignment = .fill
        stackForLastName.alignment = .fill
        combineNameStack.alignment = .fill
        stackWithImage.alignment = .fill
        
        stackForFirstName.spacing = 5
        stackForMiddleName.spacing = 5
        stackForLastName.spacing = 5
        combineNameStack.spacing = 1
        stackWithImage.spacing = 5
        
        avatar.image = UIImage(named: "pug")
      
        firstNameLabel.text = "First"
        middleNameLabel.text = "Middle"
        lastNameLabel.text = "Last"
        
        firstNameTextField.placeholder = "Enter First Name"
        middleNameTextField.placeholder = "Enter Middle Name"
        lastNameTextField.placeholder = "Enter Last Name"
        
        firstNameTextField.borderStyle = .roundedRect
        middleNameTextField.borderStyle = .roundedRect
        lastNameTextField.borderStyle = .roundedRect
        
        stackWithImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.left.equalTo(self.snp.left)
        }
  
        firstNameLabel.snp.makeConstraints { make in
            make.width.equalTo(55)
        }
        
        middleNameLabel.snp.makeConstraints { make in
            make.width.equalTo(55)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.width.equalTo(55)
        }

        avatar.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        firstNameTextField.delegate = self
        middleNameTextField.delegate = self
        lastNameTextField.delegate = self
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTextDelegate?.textFieldText(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
