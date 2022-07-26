//
//  ViewController.swift
//  Custom Cell With UICollection View Horizontal
//
//  Created by macmini01 on 25/07/22.
//

import UIKit

class ViewController: UIViewController {

    var cricketersList = ["abd", "dhoni", "duplesis", "virat", "watson"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cricketersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.myImage.image = UIImage(named: cricketersList[indexPath.row])
        cell.myImage.layer.cornerRadius = cell.frame.height/2.5
        cell.myImage.layer.borderWidth = 3
        cell.myImage.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}

