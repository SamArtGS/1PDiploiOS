//
//  PantallaBannerSeleccionador.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase

class PantallaBannerSeleccionador: UIView {
    
    let storage = Storage.storage()

    weak var delegate: SeleccionarFotoDelegate?

        private var imagenObjeto: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Logo")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.isUserInteractionEnabled = true
            return imageView
        }()
        
        private let campoDescripcion: UITextField = {
            return UITextField.cajaTextoT1(titulo: "Agrega un status de la foto!", tipoTeclado: .twitter)
        }()
        
    
        private let botonCancelar:UIButton = {
            let button = UIButton.botonT1(titulo: "Cancelar", colorFondo: .systemRed, colorLetra: .white)
            button.addTarget(self, action: #selector(atras), for: .touchUpInside)
            return button
        }()
        
        private let botonEnviar:UIButton = {
            let button = UIButton.botonT1(titulo: "Enviar foto", colorFondo: .systemGreen, colorLetra: .white)
            button.addTarget(self, action: #selector(subirFotoSeleccionada), for: .touchUpInside)
            button.isUserInteractionEnabled = false
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
            campoDescripcion.delegate = self
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Error al implementar el init")
        }
    
        func cambiarImagen(imagen: UIImage){
            imagenObjeto.image = imagen
        }
    
        func habilitarCarga(){
            botonEnviar.isUserInteractionEnabled = true
        }
    
        func getImagen() -> UIImage?{
            return imagenObjeto.image
        }
            
        private func configure(){
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(seleccionar(tapGestureRecognizer:)))
            imagenObjeto.addGestureRecognizer(gestoTap)
            
            addSubview(pilaVertical)
            backgroundColor = .white
            translatesAutoresizingMaskIntoConstraints = false
            pilaVertical.addArrangedSubview(imagenObjeto)
            pilaVertical.addArrangedSubview(campoDescripcion)
            
            pilaVertical.addArrangedSubview(pilaHorizontalBotones)
            pilaHorizontalBotones.addArrangedSubview(botonEnviar)
            pilaHorizontalBotones.addArrangedSubview(botonCancelar)
            
            
            
            NSLayoutConstraint.activate([
                pilaVertical.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                pilaVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                pilaVertical.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                pilaVertical.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -70),
                imagenObjeto.heightAnchor.constraint(equalToConstant: 200),
                imagenObjeto.widthAnchor.constraint(equalToConstant: 200),
                campoDescripcion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                campoDescripcion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                botonCancelar.widthAnchor.constraint(equalToConstant: 120),
                botonEnviar.widthAnchor.constraint(equalToConstant: 120),
            ])
            
        }

    }

extension PantallaBannerSeleccionador{
    @objc private func seleccionar(tapGestureRecognizer: UITapGestureRecognizer){
        delegate?.seleccionarFuente()
    }
    
    @objc private func subirFotoSeleccionada(){
        delegate?.subirFoto(image: imagenObjeto.image)
    }
    
    @objc private func atras(){
        delegate?.quitar()
    }

}


extension PantallaBannerSeleccionador: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imagenObjeto.image = image
    }
}
