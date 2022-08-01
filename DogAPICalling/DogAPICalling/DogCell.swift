//
//  dogCell.swift
//  DogAPICalling
//
//  Created by macmini01 on 28/07/22.
//

import UIKit

class DogCell: UICollectionViewCell {
    
    static let identifier = "DogCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
