//
//  BannerSubirImagenVC.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-12.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class BannerSubirImagenVC: UIViewController {
    
    weak var coordinador:CoordinatorPrincipal?
    lazy var pantallaFoto = PantallaBannerSeleccionador()
    
    var db = Firestore.firestore()
    let storage = Storage.storage()
    let autentication = Auth.auth()
    
    var imagenes:[Fotografia] = []
    var usuarios:[Usuario] = []

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
         pantallaFoto.delegate = self
         pantallaFoto.center = view.center
         view.addSubview(pantallaFoto)
         view.backgroundColor = .white
         NSLayoutConstraint.activate([
             pantallaFoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             pantallaFoto.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             pantallaFoto.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             pantallaFoto.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
    }

}
