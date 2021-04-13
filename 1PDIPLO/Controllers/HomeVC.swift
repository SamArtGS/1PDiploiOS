//
//  HomeCVC.swift
//  1PDIPLO
//
//  Created by Samuel Arturo Garrido Sánchez on 2021-04-10.
//  Copyright © 2021 SamArtGS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeVC: UICollectionViewController {
    
    weak var coordinador:CoordinatorPrincipal?
    
    private let reuseIdentifier = "Cell"
    var images: [StorageReference] = []
    var cellScale : CGFloat = 0.7

    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    let auth = Auth.auth()
    
    var imagenes:[Fotografia] = []
    var usuarios:[Usuario] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView?.isPagingEnabled = true
        configure()
        getData()
    }
    
    func configure(){
        self.title = "1PDIPLO"
        configureNavigationBar(largeTitleColor: .white, backgoundColor: .colorPrincipal, tintColor: .colorTerciario, title: "Primer Proyecto", preferredLargeTitle: true)
        let BarButtonItemDerecho = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(agregarFoto))
        let BarButtonItemIzquierdo = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(irPerfil))
        navigationItem.leftBarButtonItem = BarButtonItemIzquierdo
        navigationItem.rightBarButtonItem = BarButtonItemDerecho
        collectionView.backgroundColor = .white
        navigationItem.hidesBackButton = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView!.register(FotoCelda.self, forCellWithReuseIdentifier: reuseIdentifier)
        ensuciar()
        //No debería hacer esto pero bueno
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagenes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FotoCelda
        
        celda.mostrarImagen(referencia: images[indexPath.item])
        celda.setEstado(string: imagenes[indexPath.item].nombre)
        celda.setLikes(string: "\(imagenes[indexPath.item].likes)")
        descargarImagen(numIndice: indexPath.item)
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("toque \(indexPath.item)")
        let celda = collectionView.cellForItem(at: indexPath) as! FotoCelda
        celda.liked()
    }
    
    private let adorno: UIView = {
        let vista = UIView()
        vista.layer.borderWidth = 0
        vista.layer.masksToBounds = false
        vista.layer.cornerRadius = 60
        vista.backgroundColor = .colorSecundario
        vista.clipsToBounds = true
        vista.contentMode = .scaleAspectFit
        vista.translatesAutoresizingMaskIntoConstraints = false
        return vista
    }()
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale )
        let cellHeight = floor(screenSize.height * cellScale)
        
        return CGSize(width: cellWidth, height: cellHeight )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale )
        let cellHeight = floor(screenSize.height * cellScale)
        let instX = ( view.bounds.width - cellWidth ) / 2.0
        let instY = ( view.bounds.height - cellHeight ) / 2.0
        
        return UIEdgeInsets(top: instX , left: instX , bottom: instY, right: instX )
    }
    
    
}

extension HomeVC{
    @objc func irPerfil() {
        let registroVC = PerfilVC()
        registroVC.modalPresentationStyle = .automatic
        present(registroVC, animated: true)
    }
    
    @objc func agregarFoto() {
        let registroVC = BannerSubirImagenVC()
        registroVC.modalPresentationStyle = .automatic
        present(registroVC, animated: true)
    }
}
extension HomeVC{
    func ensuciar(){
        view.addSubview(adorno)
        adorno.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        adorno.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        adorno.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30).isActive = true
        adorno.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
}
