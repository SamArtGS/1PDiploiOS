//
//  PantallaPerfil.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class PantallaPerfil: UIView {

    weak var delegate: PerfilDelegate?

    private var imagenObjeto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "17787783")
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.colorPrincipal.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 90
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let campoNombreUsuario: UITextField = {
        let textfield = UITextField.cajaTextoT2(titulo: "SamArtGS", tipoTeclado: .default)
        textfield.font = .systemFont(ofSize: 35, weight: .bold)
        return textfield
    }()
    
    private let campoNombres: UITextField = {
        let textfield = UITextField.cajaTextoT2(titulo: "Samuel Arturo",tipoTeclado: .default)
        return textfield
    }()
    
    private let campoApellidos: UITextField = {
        return UITextField.cajaTextoT2(titulo: "Garrido Sánchez", tipoTeclado: .default)
    }()
    
    private let campoCorreo: UITextField = {
        return UITextField.cajaTextoT2(titulo: "samuelarturo@icloud.com", tipoTeclado: .emailAddress)
    }()
    
    private let campoNumTelefono: UITextField = {
        return UITextField.cajaTextoT2(titulo: "(914) 120 3710", tipoTeclado: .numberPad)
    }()
    
    private let campoContrasena: UITextField = {
        let contrasena = UITextField.cajaTextoT2(titulo: "Contraseña", tipoTeclado: .default)
        contrasena.isSecureTextEntry = true
        return contrasena
    }()
    
    private let campoConfirmarContrasena: UITextField = {
        let contrasena = UITextField.cajaTextoT2(titulo: "Contraseña", tipoTeclado: .default)
        contrasena.isSecureTextEntry = true
        return contrasena
    }()
    
    private let botonCancelar:UIButton = {
        let button = UIButton.botonT1(titulo: "Atrás", colorFondo: .systemRed, colorLetra: .white)
        button.addTarget(self, action: #selector(quitar), for: .touchUpInside)
        return button
    }()
    
    private let guardar:UIButton = {
        let button = UIButton.botonT1(titulo: "Atrás", colorFondo: .systemRed, colorLetra: .white)
        button.addTarget(self, action: #selector(guardarInformacion), for: .touchUpInside)
        return button
    }()
    
    private let cerrarSesion:UIButton = {
        let button = UIButton.botonT1(titulo: "Cerrar Sesión", colorFondo: .systemRed, colorLetra: .white)
        button.addTarget(self, action: #selector(guardarInformacion), for: .touchUpInside)
        return button
    }()
    
    
    private let botonRegistrar:UIButton = {
        let button = UIButton.botonT1(titulo: "Guardar", colorFondo: .systemGreen, colorLetra: .white)
        button.addTarget(self, action: #selector(guardarInformacion), for: .touchUpInside)
        return button
    }()

    private let pilaVertical: UIStackView = {
        let elementosApilados:UIStackView = UIStackView()
        elementosApilados.axis = .vertical
        elementosApilados.distribution = .fill
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
    private let scroll:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear;
        scrollView.isScrollEnabled = true;
        scrollView.showsVerticalScrollIndicator = true;
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        campoNombres.delegate = self
        campoApellidos.delegate = self
        campoNumTelefono.delegate = self
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
        addSubview(scroll)
        scroll.addSubview(pilaVertical)
        
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        pilaVertical.addArrangedSubview(imagenObjeto)
        pilaVertical.addArrangedSubview(campoNombreUsuario)
        pilaVertical.addArrangedSubview(campoNombres)
        pilaVertical.addArrangedSubview(campoApellidos)
        pilaVertical.addArrangedSubview(campoNumTelefono)
        pilaVertical.addArrangedSubview(campoCorreo)
        
        pilaVertical.addArrangedSubview(pilaHorizontalBotones)
        pilaHorizontalBotones.addArrangedSubview(botonCancelar)
        pilaHorizontalBotones.addArrangedSubview(botonRegistrar)
        
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pilaVertical.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 40),
            pilaVertical.leadingAnchor.constraint(equalTo:
                scroll.leadingAnchor),
            pilaVertical.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            pilaVertical.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: -100),
            pilaVertical.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            

            campoNombres.leadingAnchor.constraint(equalTo: pilaVertical.leadingAnchor, constant: 30),
            campoNombres.trailingAnchor.constraint(equalTo: pilaVertical.trailingAnchor, constant: -30),
            campoApellidos.leadingAnchor.constraint(equalTo: pilaVertical.leadingAnchor, constant: 30),
            campoApellidos.trailingAnchor.constraint(equalTo: pilaVertical.trailingAnchor, constant: -30),
            campoNombreUsuario.leadingAnchor.constraint(equalTo: pilaVertical.leadingAnchor, constant: 30),
            campoNombreUsuario.trailingAnchor.constraint(equalTo: pilaVertical.trailingAnchor, constant: -30),
            campoNumTelefono.leadingAnchor.constraint(equalTo: pilaVertical.leadingAnchor, constant: 30),
            campoNumTelefono.trailingAnchor.constraint(equalTo: pilaVertical.trailingAnchor, constant: -30),
            campoCorreo.leadingAnchor.constraint(equalTo: pilaVertical.leadingAnchor, constant: 30),
            campoCorreo.trailingAnchor.constraint(equalTo: pilaVertical.trailingAnchor, constant: -30),
        
            pilaHorizontalBotones.topAnchor.constraint(equalTo: campoCorreo.topAnchor, constant: 150),
            
             imagenObjeto.widthAnchor.constraint(equalToConstant: 180),
             imagenObjeto.heightAnchor.constraint(equalToConstant: 180),
             
            botonCancelar.widthAnchor.constraint(equalToConstant: 120),
            botonRegistrar.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func permitirEdicion(){
        campoNombres.isUserInteractionEnabled = true
        campoApellidos.isUserInteractionEnabled = true
        campoNumTelefono.isUserInteractionEnabled = true
    }
    
}

extension PantallaPerfil{
    @objc func guardarInformacion(){
        delegate?.guardarInfo()
    }
    @objc func editar(){
        delegate?.editarInformacion()
    }
    @objc func tomarFotoPerfil(){
        delegate?.tomarFotoPerfil()
    }
    @objc func cerrarSesionAction(){
        delegate?.cerrarSesion()
    }
    @objc func quitar(){
        delegate?.quitar()
    }
}
