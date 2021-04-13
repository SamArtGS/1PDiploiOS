//
//  RegistroVC.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

class RegistroVC: UIViewController {
    
    weak var coordinador:CoordinatorPrincipal?
    lazy var pantallaRegistro = PantallaRegistro()

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
        pantallaRegistro.delegate = self
        pantallaRegistro.center = view.center
        view.addSubview(pantallaRegistro)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pantallaRegistro.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pantallaRegistro.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pantallaRegistro.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pantallaRegistro.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
