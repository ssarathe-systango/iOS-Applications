//
//  ViewController.swift
//  Dog Bread Search
//
//  Created by macmini01 on 29/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dogs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        apiCallToGetImages()
    }
    
    @IBAction func onClick(_ sender: Any) {
        apiCallToGetImages()
    }
}

extension ViewController {
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: DogCell.identifier, bundle: nil), forCellWithReuseIdentifier: DogCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
    }
}

extension ViewController {
    func apiCallToGetImages() {
        DataService.shared.fetchDogs(searchText: textField.text?.lowercased() ?? ""){ (result) in
            switch result {
                case .success(let dogImages):
                for _ in dogImages.message {
//                        print("\(dog)")
                    }
                
                let count = dogImages.message.count > 10 ? 10 : dogImages.message.count
                
                self.dogs.removeAll()
                
                self.dogs.append(contentsOf: dogImages.message[0..<count])
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                case .failure(let error):
                    print(error)
                }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCell.identifier, for: indexPath) as! DogCell
        cell.configure(imageURL: dogs[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: (collectionWidth/2) - 5, height: (collectionWidth/2) - 5)
    }
}

extension ViewController: DogCellDelegate {
    func onClickImage(image: UIImageView) {
        let newImageView = UIImageView(image: image.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        
        navigationController?.navigationBar.alpha = 0
        tabBarController?.tabBar.alpha = 0

        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(dismissTap)
        
        view.addSubview(newImageView)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }

    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
        navigationController?.navigationBar.alpha = 1
        tabBarController?.tabBar.alpha = 1
    }
}
