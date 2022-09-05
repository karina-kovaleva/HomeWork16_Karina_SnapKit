//
//  ViewForButtons.swift
//  HomeWork16_Karina
//
//  Created by Karina Kovaleva on 5.09.22.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    func save()
    func clear()
    func cancel()
}

class ViewForButtons: UIView {
    
    weak var buttonDelegate: ButtonDelegate?
    
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let clearButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(saveButton)
        addSubview(clearButton)
        addSubview(cancelButton)
        
        saveButton.setTitle("Save", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        clearButton.setTitle("Clear", for: .normal)
 
        saveButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        clearButton.setTitleColor(.systemBlue, for: .normal)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        cancelButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self.snp.left).offset(40)
        }
        
        clearButton.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self.snp.right).offset(-40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveButtonTapped() {
        buttonDelegate?.save()
    }
    
    @objc func clearButtonTapped() {
        buttonDelegate?.clear()
    }
    
    @objc func cancelButtonTapped() {
        buttonDelegate?.cancel()
    }
}
