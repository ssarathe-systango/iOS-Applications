//
//  ViewMoviesHome.swift
//  collectionViewToAnotherCollectionViewNavigation
//
//  Created by macmini01 on 24/07/22.
//

import UIKit

class ViewMoviesHome: UIViewController {

    @IBOutlet weak var collectionView2: UICollectionView!
    
    var moviesList2: Movies = Movies(movieName: [""], movieImages: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewMoviesHome: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList2.movieName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! UICollectionViewCell2
        cell.imageView2.image = UIImage(named: moviesList2.movieImages[indexPath.row])
        cell.myLabel.text = moviesList2.movieName[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}
