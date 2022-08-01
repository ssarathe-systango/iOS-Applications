//
//  ViewController.swift
//  DogAPICalling
//
//  Created by macmini01 on 28/07/22.
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
    @IBAction func onClickSearch(_ sender: Any) {
        apiCallToGetImages()
    }
}

//MARK: COLLECTION VIEW SETUP
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
        DataService.shared.fetchDogs(searchText: textField.text ?? ""){ (result) in
            
            switch result {
                case .success(let dogImages):
                for dog in dogImages.message {
                        print("\(dog)")
                    }
                    
                    self.dogs.removeAll()
                    
                    let count = dogImages.message.count > 10 ? 10 : dogImages.message.count
                    
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: (collectionWidth/2) - 20, height: (collectionWidth/2) - 20)
    }

}

