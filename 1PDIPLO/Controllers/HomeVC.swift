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
    
    var db = Firestore.firestore()
    let storage = Storage.storage()
    
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
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FotoCelda
        
        celda.mostrarImagen(referencia: images[indexPath.item])
        descargarImagen(numIndice: indexPath.item)
        
        return celda
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("toque \(indexPath.item)")
        let celda = collectionView.cellForItem(at: indexPath) as! FotoCelda
        celda.liked()
    }
    
    
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/3.0,
                      height: collectionView.bounds.width/3.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
