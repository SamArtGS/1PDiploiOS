//
//  Fotografia.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-10.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import Foundation

struct Fotografia: Equatable, Hashable, Codable{
    let id: String
    let nombre: String
    let fechaImagen: String
    let url: String
    var likes: Int
    let usuarioId: String
}
