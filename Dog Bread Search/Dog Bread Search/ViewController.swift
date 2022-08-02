//
//  ViewController.swift
//  Dog Bread Search
//
//  Created by macmini01 on 29/07/22.
//

import UIKit

class ViewController: UIViewController {

    var breadList = [String]()
    
    var filteredBread = [String]()
    
    var dogs = [String]()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupCollectionView()
        apiCallToGetImages(searchText: "")
        getAllBreadList()
    }
    
    //MARK: Actions
    @IBAction func onClick(_ sender: Any) {
        tableView.isHidden = true
        apiCallToGetImages(searchText: textField.text ?? "")
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        tableView.isHidden = !(textField.text?.count ?? 0 > 1)
        filteredBread = breadList.filter { $0.localizedCaseInsensitiveContains(textField.text ?? "")  }
        print(filteredBread)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func textFieldDidBegin(_ sender: Any) {
        tableView.isHidden = !(textField.text?.count ?? 0 > 1)
    }
}

extension ViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
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
    func apiCallToGetImages(searchText: String) {
        DataService.shared.fetchDogs(searchText: searchText) { result in
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
                print(error.localizedDescription)
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

//        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        newImageView.addGestureRecognizer(dismissTap)
        
        view.addSubview(newImageView)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }

//    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
//        sender.view?.removeFromSuperview()
//        navigationController?.navigationBar.alpha = 1
//        tabBarController?.tabBar.alpha = 1
//    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBread.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.TextLabel.text = filteredBread[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        apiCallToGetImages(searchText: filteredBread[indexPath.row])
        textField.text = filteredBread[indexPath.row]
        tableView.isHidden = true
    }
}

//MARK: get all bread list.

extension ViewController {
    func getAllBreadList() {
        DataService.shared.getBreadList { result in
            switch result {
            case .success(let data):
                data.message?.keys.forEach({ bread in
                    self.breadList.append(bread)
                })
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
