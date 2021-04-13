//
//  OlvidoContrasenaVC.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class OlvidoContrasenaVC: UIViewController {
    
    weak var coordinador:CoordinatorPrincipal?

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
         let pantallaOlvido = PantallaOlvidoContrasena()
         pantallaOlvido.delegate = self
         pantallaOlvido.center = view.center
         view.addSubview(pantallaOlvido)
         view.backgroundColor = .white
         NSLayoutConstraint.activate([
             pantallaOlvido.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             pantallaOlvido.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             pantallaOlvido.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             pantallaOlvido.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         
     }
 }
