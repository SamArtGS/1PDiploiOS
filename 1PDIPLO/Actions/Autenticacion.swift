//
//  Auth.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase


extension InicioSesionVC: InicioSesionDelegate{
    func registrar() {
        let registroVC = RegistroVC()
        registroVC.modalPresentationStyle = .automatic
        present(registroVC, animated: true)
    }
    
    func olvidoContrasena() {
        let olvidoVC = OlvidoContrasenaVC()
        olvidoVC.modalPresentationStyle = .automatic
        present(olvidoVC, animated: true)
    }
    
    func acceso() {
        
        guard
                let email = pantallaInicio.getCorreo(),
                let passwd = pantallaInicio.getContrasena(),
                !email.isEmpty, !passwd.isEmpty
        else {
                mostrarAlerta(title: "Rellena los campos",
                              message: "Debes colocar correo/contraseña")
                return
        }
        
        autenticarSingleton.signIn(withEmail: email, password: passwd) { (result, error) in
            if let error = error {
                self.mostrarAlerta(title: "Error", message: "Error al autenticar el usuario, correo/contraseña incorrectos \(error.localizedDescription)")
            }else{
                print("nombre usuario correcto login correcto")
                let scrollLayoutVertical = UICollectionViewFlowLayout()
                scrollLayoutVertical.scrollDirection = .vertical
                let vc = HomeVC(collectionViewLayout: scrollLayoutVertical)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        let scrollLayoutVertical = UICollectionViewFlowLayout()
                        scrollLayoutVertical.scrollDirection = .vertical
        let vc = HomeVC(collectionViewLayout: scrollLayoutVertical)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension RegistroVC: RegistroDelegate{
    func registrar() {
        guard
                let nombre = pantallaRegistro.getNombre(),
                let apellido = pantallaRegistro.getApellido(),
                let numTel = pantallaRegistro.getNumTel(),
                let email = pantallaRegistro.getCorreo(),
                let passwd = pantallaRegistro.getContrasena(),
                let passwdConf = pantallaRegistro.getOtraContrasena(),
                !nombre.isEmpty, !apellido.isEmpty, !numTel.isEmpty,
                !email.isEmpty, !passwd.isEmpty, !passwd.isEmpty
        else {
                mostrarAlerta(title: "Faltan datos",
                              message: "Debes rellenar todos los campos")
                return
        }
        
        
        if passwd != passwdConf {
            mostrarAlerta(title: "No coincide",
                          message: "Debes hacer que coincidan las contraseñas :(")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: passwd) { (result, error) in
           if let error = error {
              self.mostrarAlerta(title: "Error", message: "Error al crear al usuario 😪 \(error.localizedDescription)")
                print(error)
           } else {
                self.mostrarAlerta(title: "Todo bien ✅", message: "Registro creado con éxito 😀")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func quitar() {
        dismiss(animated: true, completion: nil)
    }
}

extension OlvidoContrasenaVC: OlvidoContrasenaDelegate{
   func quitar() {
        dismiss(animated: true, completion: nil)
   }
   
   func enviarCorreo() {
       dismiss(animated: true, completion: nil)
   }
}


