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
        textField.isUserInteractionEnabled = true
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

extension RegistroVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.commentTextField.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}


extension RegistroVC{
    func adjustInputText() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 && (!pantallaRegistro.campoNombres.isEditing && !pantallaRegistro.campoApellidos.isEditing && !pantallaRegistro.campoNumTelefono.isEditing){
                //self.contentInset = UIEdgeInsets(top: keyboardSize.height - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
                self.view.frame.origin.y -= keyboardSize.height - view.safeAreaInsets.bottom
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            
        }
    }
    
    func showAlert(title: String, message: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
