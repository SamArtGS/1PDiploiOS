//
//  PantallaInicio.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-10.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class PantallaInicio: UIView {
    
    weak var delegate: InicioSesionDelegate?
    
    private var imagenObjeto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let campoNombreUsuario: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Correo Electrónico", tipoTeclado: .emailAddress)
    }()
    
    private let campoContrasena: UITextField = {
        let contrasena = UITextField.cajaTextoT1(titulo: "Contraseña", tipoTeclado: .default)
        contrasena.isSecureTextEntry = true
        return contrasena
    }()
    
    private let botonAcceso:UIButton = {
        let button = UIButton.botonT1(titulo: "Acceso", colorFondo: .systemGreen, colorLetra: .white)
        button.addTarget(self, action: #selector(Acceso), for: .touchUpInside)
        return button
    }()
    
    private let botonRegistro:UIButton = {
        let button = UIButton.botonT1(titulo: "Registro", colorFondo: .systemBlue, colorLetra: .white)
        button.addTarget(self, action: #selector(Registro), for: .touchUpInside)
        return button
    }()
    
    private let botonOlvidoContrasena:UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(OlvidoContrasena), for: .touchUpInside)
        button.setTitle("¿Olvidaste contraseña?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
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
    
    private var imagenFondo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vector-blue")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error al implementar el init")
    }
    
    func getCorreo() -> String? {
        return campoNombreUsuario.text
    }
    
    func getContrasena() -> String? {
        return campoContrasena.text
    }
        
    private func configure(){
        addSubview(pilaVertical)
        addSubview(imagenFondo)
        
        backgroundColor = .white
        
        pilaVertical.addArrangedSubview(imagenObjeto)
        pilaVertical.addArrangedSubview(campoNombreUsuario)
        pilaVertical.addArrangedSubview(campoContrasena)
        pilaVertical.addArrangedSubview(pilaHorizontalBotones)
        pilaHorizontalBotones.addArrangedSubview(botonRegistro)
        pilaHorizontalBotones.addArrangedSubview(botonAcceso)
        pilaVertical.addArrangedSubview(botonOlvidoContrasena)
        
        
        NSLayoutConstraint.activate([
            pilaVertical.centerXAnchor.constraint(equalTo: centerXAnchor),
            pilaVertical.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            pilaVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pilaVertical.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pilaVertical.heightAnchor.constraint(equalToConstant: (superview?.frame.height ?? 300)),
            
            campoNombreUsuario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoNombreUsuario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            campoContrasena.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoContrasena.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            botonAcceso.widthAnchor.constraint(equalToConstant: 120),
            botonRegistro.widthAnchor.constraint(equalToConstant: 120),
            
            botonOlvidoContrasena.widthAnchor.constraint(equalToConstant: 200),
            
            imagenFondo.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagenFondo.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagenFondo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 80),
            imagenFondo.heightAnchor.constraint(equalTo: widthAnchor)
        ])
        
    }
}
extension PantallaInicio{
    @objc func Registro(){
        delegate?.registrar()
    }
    
    @objc func OlvidoContrasena(){
        delegate?.olvidoContrasena()
    }
    
    @objc func Acceso(){
        delegate?.acceso()
    }
}

