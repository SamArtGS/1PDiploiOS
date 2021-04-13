//
//  PerfilVC.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class PerfilVC: UIViewController {

    weak var coordinador:CoordinatorPrincipal?
    lazy var pantallaPerfil = PantallaPerfil()

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
    
    func configure(){
        pantallaPerfil.delegate = self
        pantallaPerfil.center = view.center
        view.addSubview(pantallaPerfil)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pantallaPerfil.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pantallaPerfil.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pantallaPerfil.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pantallaPerfil.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
