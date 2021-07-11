//
//  Actions.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

protocol InicioSesionDelegate: AnyObject{
    func registrar()
    func olvidoContrasena()
    func acceso()
}

protocol RegistroDelegate: AnyObject{
    func quitar()
    func registrar()
}

protocol OlvidoContrasenaDelegate: AnyObject{
    func enviarCorreo()
    func quitar()
}

protocol HomeVCDelegate: AnyObject {
    func descargarImagen(numIndice: Int)
    func Mostrar()
    func darLike()
}

protocol PerfilDelegate: AnyObject{
    func guardarInfo()
    func editarInformacion()
    func tomarFotoPerfil()
    func quitar()
    func cerrarSesion()
}
protocol SeleccionarFotoDelegate: AnyObject {
    func seleccionarFuente()
    func subirFoto(image: UIImage?)
    func quitar()
}
protocol ImagePickerDelegate: AnyObject {
    func didSelect(image: UIImage?)
}
