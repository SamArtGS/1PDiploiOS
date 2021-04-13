//
//  PantallaOlvidoContrasena.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class PantallaOlvidoContrasena: UIView {
    
    weak var delegate: OlvidoContrasenaDelegate?

    private var imagenObjeto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let campoCorreo: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Correo Electrónico", tipoTeclado: .emailAddress)
    }()
    
    private let botonCancelar:UIButton = {
        let button = UIButton.botonT1(titulo: "Cancelar", colorFondo: .systemRed, colorLetra: .white)
        button.addTarget(self, action: #selector(quitarSelector), for: .touchUpInside)
        return button
    }()
    
    private let botonEnviar:UIButton = {
        let button = UIButton.botonT1(titulo: "Enviar email", colorFondo: .systemGreen, colorLetra: .white)
        button.addTarget(self, action: #selector(enviarCorreo), for: .touchUpInside)
        return button
    }()

    private let pilaVertical: UIStackView = {
        let elementosApilados:UIStackView = UIStackView()
        elementosApilados.axis = .vertical
        elementosApilados.distribution = .fillProportionally
        elementosApilados.alignment = .center
        elementosApilados.spacing = 20
        elementosApilados.translatesAutoresizingMaskIntoConstraints = false
        return elementosApilados
    }()
    
    private let pilaHorizontalBotones: UIStackView = {
        let elementosApilados:UIStackView = UIStackView()
        elementosApilados.axis = .horizontal
        elementosApilados.distribution = .fillProportionally
        elementosApilados.alignment = .center
        elementosApilados.spacing = 40
        elementosApilados.translatesAutoresizingMaskIntoConstraints = false
        return elementosApilados
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        campoCorreo.delegate = self
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error al implementar el init")
    }
        
    private func configure(){
        addSubview(pilaVertical)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        pilaVertical.addArrangedSubview(imagenObjeto)
        pilaVertical.addArrangedSubview(campoCorreo)
        
        pilaVertical.addArrangedSubview(pilaHorizontalBotones)
        pilaHorizontalBotones.addArrangedSubview(botonCancelar)
        pilaHorizontalBotones.addArrangedSubview(botonEnviar)
        
        
        NSLayoutConstraint.activate([
            pilaVertical.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            pilaVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pilaVertical.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pilaVertical.heightAnchor.constraint(equalToConstant: 280),
            
            campoCorreo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoCorreo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            botonCancelar.widthAnchor.constraint(equalToConstant: 120),
            botonEnviar.widthAnchor.constraint(equalToConstant: 120),
        ])
        
    }

}

extension PantallaOlvidoContrasena{
    @objc func enviarCorreo(){
        delegate?.enviarCorreo()
    }
    
    @objc func quitarSelector(){
        delegate?.quitar()
    }
}
