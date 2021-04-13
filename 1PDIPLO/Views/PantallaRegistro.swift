//
//  PantallaRegistro.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class PantallaRegistro: UIView{
    
    weak var delegate: RegistroDelegate?

    private var imagenObjeto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let campoNombres: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Nombre (s)",tipoTeclado: .default)
    }()
    
    private let campoApellidos: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Apellido (s)", tipoTeclado: .default)
    }()
    
    private let campoCorreo: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Correo Electrónico", tipoTeclado: .emailAddress)
    }()
    
    private let campoNombreUsuario: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Nombre Usuario", tipoTeclado: .numberPad)
    }()
    
    private let campoNumTelefono: UITextField = {
        return UITextField.cajaTextoT1(titulo: "Teléfono", tipoTeclado: .numberPad)
    }()
    
    private let campoContrasena: UITextField = {
        let contrasena = UITextField.cajaTextoT1(titulo: "Contraseña", tipoTeclado: .default)
        contrasena.isSecureTextEntry = true
        return contrasena
    }()
    
    private let campoConfirmarContrasena: UITextField = {
        let contrasena = UITextField.cajaTextoT1(titulo: "Contraseña", tipoTeclado: .default)
        contrasena.isSecureTextEntry = true
        return contrasena
    }()
    
    private let botonCancelar:UIButton = {
        let button = UIButton.botonT1(titulo: "Cancelar", colorFondo: .systemRed, colorLetra: .white)
        button.addTarget(self, action: #selector(quitarSelector), for: .touchUpInside)
        return button
    }()
    
    private let botonRegistrar:UIButton = {
        let button = UIButton.botonT1(titulo: "Registrar", colorFondo: .systemGreen, colorLetra: .white)
        button.addTarget(self, action: #selector(registrarSelector), for: .touchUpInside)
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
        campoNombres.delegate = self
        campoApellidos.delegate = self
        campoNumTelefono.delegate = self
        campoContrasena.delegate = self
        campoConfirmarContrasena.delegate = self
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error al implementar el init")
    }
    
    func getNombre() -> String? {
        return campoNombres.text
    }
    func getApellido() -> String? {
        return campoApellidos.text
    }
    func getCorreo() -> String? {
        return campoCorreo.text
    }
    func getUsername() -> String? {
        return campoNombreUsuario.text
    }
    func getNumTel() -> String? {
        return campoNumTelefono.text
    }
    func getContrasena() -> String? {
        return campoContrasena.text
    }
    func getOtraContrasena() -> String? {
        return campoConfirmarContrasena.text
    }
    
        
    private func configure(){
        addSubview(pilaVertical)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        pilaVertical.addArrangedSubview(imagenObjeto)
        pilaVertical.addArrangedSubview(campoNombres)
        pilaVertical.addArrangedSubview(campoApellidos)
        pilaVertical.addArrangedSubview(campoNumTelefono)
        pilaVertical.addArrangedSubview(campoNombreUsuario)
        pilaVertical.addArrangedSubview(campoCorreo)
        pilaVertical.addArrangedSubview(campoContrasena)
        pilaVertical.addArrangedSubview(campoConfirmarContrasena)
        
        pilaVertical.addArrangedSubview(pilaHorizontalBotones)
        pilaHorizontalBotones.addArrangedSubview(botonCancelar)
        pilaHorizontalBotones.addArrangedSubview(botonRegistrar)
        
        
        NSLayoutConstraint.activate([
            pilaVertical.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            pilaVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            pilaVertical.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pilaVertical.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            campoNombres.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoNombres.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            campoApellidos.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoApellidos.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            campoNombreUsuario.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoNombreUsuario.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            campoNumTelefono.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoNumTelefono.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            campoCorreo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            campoCorreo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            campoContrasena.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             campoContrasena.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
             campoConfirmarContrasena.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             campoConfirmarContrasena.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            
            botonCancelar.widthAnchor.constraint(equalToConstant: 120),
            botonRegistrar.widthAnchor.constraint(equalToConstant: 120),
        ])
        
    }

}

extension PantallaRegistro{
    @objc func registrarSelector(){
        delegate?.registrar()
    }
    
    @objc func quitarSelector(){
        delegate?.quitar()
    }
}
