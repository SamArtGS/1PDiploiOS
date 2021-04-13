//
//  Coordinator.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-11.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    //Como no hay TabView, no necesito tantos coordinadores
    var CoordinadoresHijos: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func iniciarFlujo()
}

class CoordinatorPrincipal: Coordinator{
    
    var CoordinadoresHijos:[Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func iniciarFlujo() {
        navigationController.pushViewController(InicioSesionVC(), animated: true)
    }
    
    func irAHome() {
        let scrollLayoutVertical = UICollectionViewFlowLayout()
        scrollLayoutVertical.scrollDirection = .vertical
        let vc = HomeVC(collectionViewLayout: scrollLayoutVertical)
        vc.coordinador = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func irAInicio(){
        let vc = InicioSesionVC()
        vc.coordinador = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func atras(){
        navigationController.popViewController(animated: true)
    }
    
    func irASalir(){
        navigationController.popToRootViewController(animated: true)
    }
    
    func irAImagenSeleccionada(){
        let vc = ImagenSeleccionadaVC()
        vc.coordinador = self
        navigationController.pushViewController(vc, animated: true)
    }
}
