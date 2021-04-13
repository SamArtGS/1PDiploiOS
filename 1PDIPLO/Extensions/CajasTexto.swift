//
//  TextFields.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

extension UITextField{
    static func cajaTextoT1(titulo: String, tipoTeclado: UIKeyboardType) -> UITextField {
        let textField: UITextField = UITextField()
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = titulo
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = tipoTeclado
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        return textField
    }
    static func cajaTextoT2(titulo: String, tipoTeclado: UIKeyboardType) -> UITextField {
        let textField: UITextField = UITextField()
        textField.textColor = .black
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = titulo
        textField.font = .systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .none
        textField.autocorrectionType = .default
        textField.keyboardType = tipoTeclado
        textField.returnKeyType = .continue
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        return textField
    }
    
}
extension UIView: UITextFieldDelegate{
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

