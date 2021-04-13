//
//  File.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

//MARK: TO DO:
// NO GENERAR TANTOS LISTENER, SOLO 1 QUE ESTÉ REALIZANDO EL PULL

protocol ServiciosFirebaseDelegate {
    
    var usuarios: [Usuario] { get set }
    var imagenes: [Fotografia] { get set }

    func obtenerInfo()
}

class InvocadorFB: ServiciosFirebaseDelegate{
    
    static var coleccionFireB1  = "usuarios"
    static var coleccionFireB2  = "imagenes"
    static var atribIdUser      = "id"
    static var atribNombre      = "nombre"
    static var atribApellido    = "apellido"
    static var atribUserName    = "username"
    static var atribNumTel      = "numTel"
    static var atribCorreo      = "email"
    static var atribImagenUs    = "imagenUsuario"
    
    static var atribNomImg      = "nombre"
    static var atribFechaImg    = "fecha"
    static var atribNumLikImg   = "numLikes"
    static var atribUrlImg      = "url"
    static var usuarioID        = "usuarioID"
    
    
    var usuarios: [Usuario] = []
    var imagenes: [Fotografia] = []
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let authentication = Auth.auth()
    
    func obtenerInfo(){
        db.collection("usuarios").order(by: "name").addSnapshotListener{ (snapshot, error) in
            if let error = error {
                print("Error al obtener la lista de usuarios \(error.localizedDescription)")
            } else {
                self.usuarios.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data = document.data()
                    let nombre        = data["nombre"] as? String ?? ""
                    let apellido      = data["apellido"] as? String ?? ""
                    let nomUsuario    = data["nomUsuario"] as? String ?? ""
                    let email         = data["email"] as? String ?? ""
                    let telefono      = data["telefono"] as? String ?? ""
                    let imagenUsuario = data["imagenUsuario"] as? String ?? ""
                    
                self.usuarios.append(Usuario(id: id, nombre: nombre, apellido: apellido, telefono: telefono, nombreUsuario: nomUsuario, correoElectronico: email, imagenUsuario: imagenUsuario))
                }
                //self.collectionView.reloadData()
            }
        }
        db.collection("imagenes").order(by: "name").addSnapshotListener{ (snapshot, error) in
            if let error = error {
                print("Error al obtener la lista de imágenes \(error.localizedDescription)")
            } else {
                self.usuarios.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data = document.data()
                    let nombre      = data["nombre"] as? String ?? ""
                    let fecha       = data["fecha"] as? String ?? ""
                    let numLikes    = data["numLikes"] as? Int ?? 0
                    let url         = data["url"] as? String ?? ""
                    let usuarioID   = data["usuarioID"] as? String ?? ""
                    
                    self.imagenes.append(Fotografia(id: id,nombre: nombre, fechaImagen: fecha, url: url, likes: numLikes, usuarioId: usuarioID))
                }
                //self.collectionView.reloadData()
            }
        }
    }
    
    
}
