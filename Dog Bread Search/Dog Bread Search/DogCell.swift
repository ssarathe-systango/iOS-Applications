//
//  DogCell.swift
//  Dog Bread Search
//
//  Created by macmini01 on 29/07/22.
//

import UIKit

protocol DogCellDelegate: AnyObject {
    func onClickImage(image: UIImageView)
}

class DogCell: UICollectionViewCell {

    static let identifier = "DogCell"
          
    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: DogCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onclickImage(_ sender: Any) {
        delegate?.onClickImage(image: imageView)
    }
    
    func configure(imageURL: String) {
        imageView.contentMode = .scaleAspectFill
        guard let url = URL(string: imageURL) else {
            return
        }
        downloadImage(from: url)
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.imageView.image = UIImage(data: data)
            }
            
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
