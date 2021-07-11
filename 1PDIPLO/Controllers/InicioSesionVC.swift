//
//  ViewController.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-03-23.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase

class InicioSesionVC: UIViewController{
    
    weak var coordinador:CoordinatorPrincipal?
    var pantallaInicio = PantallaInicio()
    let autenticarSingleton = Auth.auth()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5,
                     delay: 0.3,
                     options: [],
                     animations: { [weak self] in
                      self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func configure(){
        pantallaInicio.delegate = self
        pantallaInicio.center = view.center
        view.addSubview(pantallaInicio)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pantallaInicio.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pantallaInicio.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pantallaInicio.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pantallaInicio.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

