//
//  Botones.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

extension UIButton {

    static func botonT1(titulo: String, colorFondo: UIColor, colorLetra: UIColor) -> UIButton {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = colorFondo
        button.setTitle(titulo, for: .normal)
        button.setTitleColor(colorLetra, for: .normal)
        button.layer.cornerRadius = 7
        button.layer.borderColor = .none
        button.layer.borderWidth = 0
        button.layer.shadowColor = UIColor.gray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        return button
    }
}
