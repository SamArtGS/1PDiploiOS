//
//  Storage.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import CoreServices
import FirebaseUI

extension BannerSubirImagenVC : SeleccionarFotoDelegate{
    
    func getData(){
        db.collection(InvocadorFB.coleccionFireB1).order(by: InvocadorFB.atribNombre).addSnapshotListener{ (snapshot, error) in
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
        db.collection(InvocadorFB.coleccionFireB2).order(by: InvocadorFB.atribNomImg).addSnapshotListener{ (snapshot, error) in
            if let error = error {
                print("Error al obtener la lista de imágenes \(error.localizedDescription)")
            } else {
                self.usuarios.removeAll()
                for document in snapshot!.documents{
                    print("\(document.documentID) => \(document.data())")
                    let id = document.documentID as String
                    let data = document.data()
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
    func seleccionarFuente(){
        let alertVC = UIAlertController(title: title, message: "Selecciona la fuente", preferredStyle: .alert)
        let bibliotecaAccion = UIAlertAction(title: "Carrete de Fotos", style: .default, handler: usarCarrete(alertARgument:))
        let camaraAccion = UIAlertAction(title: "Cámara", style: .default, handler: usarCamara(alertARgument:))
        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alertVC.addAction(bibliotecaAccion)
        alertVC.addAction(camaraAccion)
        alertVC.addAction(cancelar)
        present(alertVC, animated: true, completion: nil)
    }
    
    func usarCarrete(alertARgument: UIAlertAction!){
        let userImagePicker = UIImagePickerController()
        userImagePicker.delegate = self
        userImagePicker.allowsEditing = true
        userImagePicker.sourceType = .photoLibrary
        userImagePicker.mediaTypes = ["public.image"]
        present(userImagePicker, animated: true, completion: nil)
    }
        
    func usarCamara(alertARgument: UIAlertAction!){
        let userImagePicker = UIImagePickerController()
        userImagePicker.delegate = self
        #if targetEnvironment(simulator)
            mostrarAlerta(title: "NO HAY CAMARA", message: "Estás usando un simulador, se morirá si abres la cámara")
            return
        #else
            userImagePicker.sourceType = .camera
            userImagePicker.mediaTypes = ["public.image"]
            present(userImagePicker, animated: true, completion: nil)
        #endif
    }
    
    func subirFoto(image: UIImage?) {
        guard let optimizedImageData = image!.jpegData(compressionQuality: 0.6) else {
            return
        }
        
        let nombreImagen:String = randomAlphaNumericString(length: 20)
        
        let storageRef = storage.reference()
        let imageRef = storageRef.child(InvocadorFB.coleccionFireB2).child("Muro").child(nombreImagen)
        
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "image/jpeg"
        imageRef.putData(optimizedImageData, metadata: uploadMetaData) { (metadata, error) in
            if let error = error{
                self.mostrarAlerta(title: "Error al subir la imagen", message: "Hubo un error al subir la imagen 😞: \(error.localizedDescription)")
                print(error.localizedDescription)
            } else {
                
                self.db.collection(InvocadorFB.coleccionFireB2).addDocument(data: [
                    InvocadorFB.atribNombre:  self.pantallaFoto.getEstado() ?? "",
                    InvocadorFB.atribFechaImg: "\(String(describing: metadata?.timeCreated!))",
                    InvocadorFB.atribUrlImg: "\(InvocadorFB.coleccionFireB2)/Muro/\(nombreImagen)",
                    InvocadorFB.atribNumLikImg: "0",
                    InvocadorFB.usuarioID: self.autentication.currentUser?.uid ?? "0"
                ]){ error in
                    if let error = error{
                        print("Error \(error.localizedDescription)")
                    }else{
                        print("Data de la imagen subida")
                    }
                }
                self.mostrarAlerta(title: "Listo! ✅", message: "La imagen se ha subido con éxito")
                self.coordinador?.atras()
            }
        }
       
    }
    
    func quitar() {
        dismiss(animated: true, completion: nil)
    }
}

extension BannerSubirImagenVC:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.editedImage] else{
            return
        }
        pantallaFoto.cambiarImagen(imagen: pickedImage as! UIImage)
        pantallaFoto.habilitarCarga()
        dismiss(animated: true, completion: nil)
    }
}
