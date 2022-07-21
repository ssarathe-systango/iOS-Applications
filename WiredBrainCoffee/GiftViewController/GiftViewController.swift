//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

class GiftViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [String] = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.title = "Gift Cards!"
    }
    
    @IBAction func moveNext(_ sender: Any) {
        navigation()
    }
    
    private func initialSetup() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
    }
}

extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! CollectionCell
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2 - 10, height: collectionWidth/2 - 10)
        
        
//        let height: CGFloat = 100
//        let width: CGFloat = collectionView.bounds.width / 2
//        let collectionViewWidth = collectionView.bounds.width
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//        let spaceBetweenCells = flowLayout.minimumInteritemSpacing
//        let adjustedWidth = collectionViewWidth - spaceBetweenCells
//        let width: CGFloat = collectionView.bounds.width / 2
//        let height: CGFloat = 100
//        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: indexPath) as! HeaderCollectionReusableView
        view.setup(count: images.count)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 2, bottom: 0, right: 2)
    }
    
    func navigation() {
        let move = storyboard?.instantiateViewController(withIdentifier: "GiftViewControllerNext") as! GiftViewControllerNext
        move.obj = self
        navigationController?.pushViewController(move, animated: true)
    }
    
}
