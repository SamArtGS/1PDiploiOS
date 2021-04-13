//
//  MostrarInformacion.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import CoreServices
import FirebaseUI

extension HomeVC: HomeVCDelegate{
    
    func descargarImagen(numIndice: Int) {
        images[numIndice].downloadURL { (url, error) in
            if let error = error{
                print(error.localizedDescription)
            } else {
                print("URL:  \(String(describing: url!))")
            }
        }
    }
    
    func getData(){
        db.collection(InvocadorFB.coleccionFireB1).order(by: InvocadorFB.atribNombre).addSnapshotListener{ (snapshot, error) in
            
            print("Se está activando este cochino listener")
            if let error = error {
                print("Error al obtener la lista de usuarios \(error.localizedDescription)")
            } else {
                self.usuarios.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data = document.data()
                    let nombre        = data[InvocadorFB.atribNombre] as? String ?? ""
                    let apellido      = data[InvocadorFB.atribApellido] as? String ?? ""
                    let nomUsuario    = data[InvocadorFB.atribUserName] as? String ?? ""
                    let email         = data[InvocadorFB.atribCorreo] as? String ?? ""
                    let telefono      = data[InvocadorFB.atribNumTel] as? String ?? ""
                    let imagenUsuario = data[InvocadorFB.atribImagenUs] as? String ?? ""
                    
                self.usuarios.append(Usuario(id: id, nombre: nombre, apellido: apellido, telefono: telefono, nombreUsuario: nomUsuario, correoElectronico: email, imagenUsuario: imagenUsuario))
                }
                self.collectionView.reloadData()
            }
        }
        db.collection(InvocadorFB.coleccionFireB2).order(by: InvocadorFB.atribNomImg).addSnapshotListener{ (snapshot, error) in
            
            print("Se está activando este otro cochino listener")
            if let error = error {
                print("Error al obtener la lista de imágenes \(error.localizedDescription)")
            } else {
                self.imagenes.removeAll()
                self.images.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data        = document.data()
                    let nombre      = data[InvocadorFB.atribNomImg] as? String ?? ""
                    let fecha       = data[InvocadorFB.atribFechaImg] as? String ?? ""
                    let numLikes    = data[InvocadorFB.atribNumLikImg] as? Int ?? 0
                    let url         = data[InvocadorFB.atribUrlImg] as? String ?? ""
                    let usuarioID   = data[InvocadorFB.usuarioID] as? String ?? ""
                    self.imagenes.append(Fotografia(id: id,nombre: nombre, fechaImagen: fecha, url: url, likes: numLikes, usuarioId: usuarioID))
                    self.images.append(self.storage.reference().child(url))
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    func Mostrar() {
        print("Gola")
    }
    
    func darLike() {
        print("Hola")
    }
}

extension PerfilVC: PerfilDelegate{
    func guardarInfo() {
        print("Si se está realizando el delegate")
        pantallaPerfil.editar()
    }
    
    func editarInformacion() {
        print("Hola")
    }
    
    func tomarFotoPerfil() {
        print("Hola")
    }
    
    func quitar() {
        print("Hola")
    }
    
    func cerrarSesion() {
        print("Hola")
    }
    
    
    func getData(){
        db.collection(InvocadorFB.coleccionFireB1).order(by: InvocadorFB.atribNombre).addSnapshotListener{ (snapshot, error) in
            
            print("Se está activando este cochino listener")
            if let error = error {
                print("Error al obtener la lista de usuarios \(error.localizedDescription)")
            } else {
                self.usuarios.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data = document.data()
                    let nombre        = data[InvocadorFB.atribNombre] as? String ?? ""
                    let apellido      = data[InvocadorFB.atribApellido] as? String ?? ""
                    let nomUsuario    = data[InvocadorFB.atribUserName] as? String ?? ""
                    let email         = data[InvocadorFB.atribCorreo] as? String ?? ""
                    let telefono      = data[InvocadorFB.atribNumTel] as? String ?? ""
                    let imagenUsuario = data[InvocadorFB.atribImagenUs] as? String ?? ""
                    
                self.usuarios.append(Usuario(id: id, nombre: nombre, apellido: apellido, telefono: telefono, nombreUsuario: nomUsuario, correoElectronico: email, imagenUsuario: imagenUsuario))
                }
            }
        }
        
        db.collection(InvocadorFB.coleccionFireB1).whereField(InvocadorFB.atribIdUser, isEqualTo: auth.currentUser?.uid ?? "0").limit(to: 1).getDocuments{ (snapshot, error) in
            if let error = error {
                print("Error al obtener los datos del usuario \(error.localizedDescription)")
            } else {
                for document in snapshot!.documents{
                    //print("\(document.documentID) => \(document.data())")
                    //let id = document.documentID as String
                    let data = document.data()
                    let nombre        = data[InvocadorFB.atribNombre] as? String ?? ""
                    let apellido      = data[InvocadorFB.atribApellido] as? String ?? ""
                    let nomUsuario    = data[InvocadorFB.atribUserName] as? String ?? ""
                    let email         = data[InvocadorFB.atribCorreo] as? String ?? ""
                    let telefono      = data[InvocadorFB.atribNumTel] as? String ?? ""
                    let imagenUsuario = data[InvocadorFB.atribImagenUs] as? String ?? ""
                    
                    self.pantallaPerfil.plasmarInformacion(usuario: Usuario(id: "", nombre: nombre, apellido: apellido, telefono: telefono, nombreUsuario: nomUsuario, correoElectronico: email, imagenUsuario: imagenUsuario))
                }
            }
        }

        db.collection(InvocadorFB.coleccionFireB2).order(by: InvocadorFB.atribNomImg).addSnapshotListener{ (snapshot, error) in
            
            print("Se está activando este otro cochino listener")
            if let error = error {
                print("Error al obtener la lista de imágenes \(error.localizedDescription)")
            } else {
                self.imagenes.removeAll()

                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data        = document.data()
                    let nombre      = data[InvocadorFB.atribNomImg] as? String ?? ""
                    let fecha       = data[InvocadorFB.atribFechaImg] as? String ?? ""
                    let numLikes    = data[InvocadorFB.atribNumLikImg] as? Int ?? 0
                    let url         = data[InvocadorFB.atribUrlImg] as? String ?? ""
                    let usuarioID   = data[InvocadorFB.usuarioID] as? String ?? ""
                    self.imagenes.append(Fotografia(id: id,nombre: nombre, fechaImagen: fecha, url: url, likes: numLikes, usuarioId: usuarioID))
                }
            }
        }
}
}
