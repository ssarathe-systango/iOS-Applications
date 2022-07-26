//
//  ViewController.swift
//  collectionViewToAnotherCollectionViewNavigation
//
//  Created by macmini01 on 24/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var moviesList1 = [MoviesData]()
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.imageView1.image = UIImage(named: moviesList1[indexPath.row].moviesActors[0])
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func fillData() {
        let movieNameFirst = Movies(movieName: ["movieA"],
                                movieImages: ["img1"])
        let movieFirst = MoviesData(moviesActors: ["Jackey Chain"], movieNames: movieNameFirst)
        moviesList1.append(movieFirst)
        
        let movieNameFirst2 = Movies(movieName: ["movieB"],
                                movieImages: ["img2"])
        let movieFirst2 = MoviesData(moviesActors: ["Christ Stewart"], movieNames: movieNameFirst2)
        moviesList1.append(movieFirst2)
        
        let movieNameFirst3 = Movies(movieName: ["movieC"],
                                movieImages: ["img3"])
        let movieFirst3 = MoviesData(moviesActors: ["Christ Stewart"], movieNames: movieNameFirst3)
        moviesList1.append(movieFirst3)
        
        let movieNameFirst4 = Movies(movieName: ["movieD"],
                                movieImages: ["img4"])
        let movieFirst4 = MoviesData(moviesActors: ["Christ Stewart"], movieNames: movieNameFirst4)
        moviesList1.append(movieFirst4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width-10)/2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewMoviesHome") as! ViewMoviesHome
        vc.moviesList2 = moviesList1[indexPath.row].movieNames
        vc.title = "Movie Names of \(moviesList1[indexPath.row].moviesActors)"
        navigationController?.pushViewController(vc, animated: true)
        
    }
}


