//
//  GiftViewController.swift
//  WiredBrainCoffee
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

class GiftViewController: UIViewController {
    
    //MARK: Collection View Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Images Array
    var images = [["img1", "img2", "img3", "img4", "img5", "img10"],
                 ["img6", "img7", "img8", "img9", "img10", "img1"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.title = "Gift Cards!"
    }
    
    //MARK: Action (Move to next screen using push navigation)
    @IBAction func moveNext(_ sender: Any) {
        navigation()
    }
    
    //MARK: Function for UICollectionFlow layout
    private func initialSetup() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
    }
}

//MARK: Extension of GiftViewController
extension GiftViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return images.count //It will return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images[section].count // It will return 6 (count of images in per section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! CollectionCell
        cell.image.image = UIImage(named: images[indexPath.section][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2 - 10, height: collectionViewWidth/2 - 10)
    }
    
    // section header function
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! HeaderCollectionReusableView
            view.setup(count: images[indexPath.section].count)
            return view
            
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionFooter", for: indexPath)
            view.backgroundColor = UIColor.black
            return view
        }
    }
    
    // set width and height of section header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    // set width and height of section footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // set insets of section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 2, bottom: 0, right: 2)
    }
    
    // navigation
    func navigation() {
        let move = storyboard?.instantiateViewController(withIdentifier: "GiftViewControllerNext") as! GiftViewControllerNext
        move.obj = self
        navigationController?.pushViewController(move, animated: true)
    }
    
}




























//        let height: CGFloat = 100
//        let width: CGFloat = collectionView.bounds.width / 2
//        let collectionViewWidth = collectionView.bounds.width
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//        let spaceBetweenCells = flowLayout.minimumInteritemSpacing
//        let adjustedWidth = collectionViewWidth - spaceBetweenCells
//        let width: CGFloat = collectionView.bounds.width / 2
//        let height: CGFloat = 100
//        return CGSize(width: width, height: height)
