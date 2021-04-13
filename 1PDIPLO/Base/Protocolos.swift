//
//  Actions.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

protocol InicioSesionDelegate: class{
    func registrar()
    func olvidoContrasena()
    func acceso()
}

protocol RegistroDelegate: class{
    func quitar()
    func registrar()
}

protocol OlvidoContrasenaDelegate: class{
    func enviarCorreo()
    func quitar()
}

protocol HomeVCDelegate: class {
    func descargarImagen(numIndice: Int)
    func Mostrar()
    func darLike()
}

protocol PerfilDelegate: class{
    func guardarInfo()
    func editarInformacion()
    func tomarFotoPerfil()
    func quitar()
    func cerrarSesion()
}
protocol SeleccionarFotoDelegate: class {
    func seleccionarFuente()
    func subirFoto(image: UIImage?)
    func quitar()
}
protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}
