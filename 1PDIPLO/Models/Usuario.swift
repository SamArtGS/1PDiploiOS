//
//  Usuario.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-10.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import Foundation

struct Usuario: Equatable, Hashable, Codable {
    let id:String
    let nombre:String
    let apellido:String
    let telefono: String
    let nombreUsuario: String
    let correoElectronico: String
    let imagenUsuario: String
}
