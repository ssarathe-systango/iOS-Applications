//
//  ViewController.swift
//  RESThub
//
//  Created by macmini01 on 27/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        DataService.shared.fetchGists()
        DataService.shared.fetchGists { (result) in
            switch result {
            case .success(let gists):
                // loop for fetching all id's in API Json file.
                for gist in gists {
                    print("\(gist)\n")
                }
            case .failure(let error):
                    print(error)
            }
        }
    }


}

