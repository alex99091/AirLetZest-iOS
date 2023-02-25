//
//  SearchFlightViewController+TextFieldDelegate.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import UIKit

extension SearchFlightViewController: UITextFieldDelegate {
    // 텍스트필드 스타일
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if departTextField.text != nil {
            departTextField.font = UIFont(name: customFont, size: fontRegularSize)
        }
        if arrivalTextField.text != nil {
            arrivalTextField.font = UIFont(name: customFont, size: fontRegularSize)
        }
        return true
    }
}
