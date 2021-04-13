//
//  FotoCelda.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-10.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import CoreServices

class FotoCelda: UICollectionViewCell {
    
    private var imagenObjeto: UIImageView = {
       let vistaImagen = UIImageView()
       vistaImagen.image = UIImage(named: "17787783")
        vistaImagen.isUserInteractionEnabled = true
       vistaImagen.contentMode = .scaleToFill
       vistaImagen.translatesAutoresizingMaskIntoConstraints = false
       return vistaImagen
    }()
    
    private var imagenCorazon: UIImageView = {
        let vistaImagen = UIImageView()
        vistaImagen.image = UIImage(named: "love-nome")
        vistaImagen.isUserInteractionEnabled = true
        vistaImagen.contentMode = .scaleAspectFit
        vistaImagen.translatesAutoresizingMaskIntoConstraints = false
        return vistaImagen
    }()
    
    private let usuario: UILabel = {
        let etiqueta = UILabel()
        etiqueta.text = "Usuario"
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .white
        etiqueta.font = .systemFont(ofSize: 14, weight: .bold)
        etiqueta.contentMode = .scaleAspectFit
        etiqueta.adjustsFontForContentSizeCategory = true
        return etiqueta
    }()
    
    private let numLikes: UILabel = {
        let etiqueta = UILabel()
        etiqueta.text = "10"
        etiqueta.isUserInteractionEnabled = true
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .black
        etiqueta.contentMode = .scaleAspectFit
        etiqueta.font = .systemFont(ofSize: 14, weight: .bold)
        etiqueta.adjustsFontForContentSizeCategory = true
        return etiqueta
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurarConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func liked(){
        imagenCorazon.image = UIImage(named: "love-me")
        numLikes.text = "11"
    }
    
    func disliked(){
        imagenCorazon.image = UIImage(named: "love-nome")
        numLikes.text = "11"
    }
    
    func mostrarImagen(referencia: StorageReference){
        imagenObjeto.sd_setImage(with: referencia, placeholderImage: UIImage(named: "Logo"))
    }
    
    private func configurarConstraints(){
        self.isUserInteractionEnabled = true
        addSubview(imagenObjeto)
        addSubview(usuario)
        addSubview(imagenCorazon)
        imagenCorazon.addSubview(numLikes)
        
        NSLayoutConstraint.activate([
            imagenObjeto.topAnchor.constraint(equalTo: topAnchor),
            imagenObjeto.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagenObjeto.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagenObjeto.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            usuario.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            usuario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            usuario.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imagenCorazon.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            imagenCorazon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            imagenCorazon.heightAnchor.constraint(equalToConstant: 40),
            imagenCorazon.widthAnchor.constraint(equalToConstant: 40),
            numLikes.centerXAnchor.constraint(equalTo: imagenCorazon.centerXAnchor),
            numLikes.centerYAnchor.constraint(equalTo: imagenCorazon.centerYAnchor, constant: -2)
        ])
        
    }
    
}

