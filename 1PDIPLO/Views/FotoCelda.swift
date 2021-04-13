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
       vistaImagen.layer.borderWidth = 0
       vistaImagen.layer.masksToBounds = false
       vistaImagen.layer.cornerRadius = 30
       vistaImagen.clipsToBounds = true
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
        etiqueta.font = .systemFont(ofSize: 24, weight: .bold)
        etiqueta.contentMode = .scaleAspectFit
        etiqueta.adjustsFontForContentSizeCategory = true
        return etiqueta
    }()
    private let estado: UILabel = {
        let etiqueta = UILabel()
        etiqueta.lineBreakMode = .byWordWrapping
        etiqueta.numberOfLines = 3
        etiqueta.text = "Estado"
        etiqueta.translatesAutoresizingMaskIntoConstraints = false
        etiqueta.textColor = .white
        etiqueta.font = .systemFont(ofSize: 20, weight: .medium)
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
        etiqueta.font = .systemFont(ofSize: 18, weight: .bold)
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
    func setEstado(string: String) {
        estado.text = string
    }
    func setLikes(string: String) {
        numLikes.text = string
    }
    private func configurarConstraints(){
        self.isUserInteractionEnabled = true
        addSubview(imagenObjeto)
        addSubview(usuario)
        addSubview(imagenCorazon)
        addSubview(estado)
        imagenCorazon.addSubview(numLikes)
        
        
        backgroundColor = UIColor.black
        layer.borderWidth = 1
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10.0
        layer.cornerRadius = 30
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 200.0, height: 500.0)
        layer.shadowRadius = 2.0
        
        NSLayoutConstraint.activate([
            imagenObjeto.topAnchor.constraint(equalTo: topAnchor),
            imagenObjeto.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagenObjeto.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagenObjeto.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            usuario.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            usuario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            usuario.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            estado.centerXAnchor.constraint(equalTo: centerXAnchor),
            estado.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            estado.leadingAnchor.constraint(equalTo: leadingAnchor,   constant: 20),
            estado.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imagenCorazon.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            imagenCorazon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            imagenCorazon.heightAnchor.constraint(equalToConstant: 70),
            imagenCorazon.widthAnchor.constraint(equalToConstant: 70),
            numLikes.centerXAnchor.constraint(equalTo: imagenCorazon.centerXAnchor),
            numLikes.centerYAnchor.constraint(equalTo: imagenCorazon.centerYAnchor, constant: -2)
        ])
        
    }
    
}

