//
//  ViewController.swift
//  DogAPICalling
//
//  Created by macmini01 on 28/07/22.
//

import UIKit

class ViewController: UIViewController {

    var breadList = [String]()
    
    var filteredBreadList = [String]()
    
    var dogs = [String]()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        setupCollectionView()
        apiCallToGetImages(searchText: "")
        setupTableView()
        getAllBreadList()
    }
    
//    @IBAction func onClickSearch(_ sender: Any) {
//        
//    }
    
    //MARK: TEXT FIELD EDITING CHANGED
    @IBAction func textEditingChanged(_ sender: Any) {
        tableView.isHidden = !(textField.text?.count ?? 0 > 1)

        filteredBreadList = breadList.filter { $0.localizedCaseInsensitiveContains(textField.text ?? "") }

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    //MARK: TEXT FIELD EDITING BEGIN
    @IBAction func textFieldEditingBegin(_ sender: Any) {
        tableView.isHidden = !(textField.text?.count ?? 0 > 1)
    }
}

//MARK: TABLE VIEW SETUP
extension ViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
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

//MARK: API CALL TO GET IMAGES
extension ViewController {
    func apiCallToGetImages(searchText: String) {
        DataService.shared.fetchDogs(searchText: searchText){ (result) in
            
            switch result {
                case .success(let dogImages):
                    for _ in dogImages.message {
//                        print("\(dog)")
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

//MARK: GET ALL BREAD LIST
extension ViewController {
    func getAllBreadList() {
        DataService.shared.fetchDogsBreadList { result in
            switch result {
            case .success(let dogbreads):
                dogbreads.message?.keys.forEach({ bread in
                    self.breadList.append(bread)
                })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: COLLECTION VIEW
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

//MARK: TABLE VIEW FOR SEARCH SUGGESTIONS.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBreadList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.breadsLabel.text = filteredBreadList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 50
    }
    
    //MARK: API CALL ON ROW SELECTING
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        apiCallToGetImages(searchText: filteredBreadList[indexPath.row])
        textField.text = filteredBreadList[indexPath.row]
        tableView.isHidden = true
    }
}

