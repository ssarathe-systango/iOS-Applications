//
//  ViewController.swift
//  Access Data Using Web API Covid - 19
//
//  Created by macmini01 on 04/08/22.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var showCountryName: UILabel!
    @IBOutlet weak var btnCountry: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStatus(labeltext: "")
        showCountryName.text = nil
        btnCountry.addTarget(self, action: #selector(tapForCountry), for: .touchUpInside)
    }
}

extension ViewController {
    //MARK: API CALLING FOR DISPLAY COVID CASES
    func displayStatus(labeltext: String) {
        
        let path = labeltext.isEmpty ? "https://api.covid19api.com/live/country" : "https://api.covid19api.com/live/country/\(labeltext)"
        
        print(path)
        
        guard let url = URL(string: path) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            
            //MARK: RESPONSE
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code \(httpResponse.statusCode)")
            }
            
            //MARK: DATA
            guard let validData = data, error == nil else {
                print("error!")
                return
            }
            
            var currentStatus: [CountryCases]?
            
            //MARK: DECODING DATA
            do {
                currentStatus = try JSONDecoder().decode([CountryCases].self, from: validData)
            } catch {
                print("\(error)")
            }
            
            //MARK: SET LABEL TEXT
            DispatchQueue.main.async {
                self.totalConfirmedLabel.text = "\(currentStatus?.first?.Confirmed ?? 0)"
                self.totalDeathsLabel.text = "\(currentStatus?.first?.Deaths ?? 0)"
                self.newConfirmedLabel.text = "\(currentStatus?.first?.Active ?? 0)"
            }
        }).resume()
    }
}

//MARK: NAVIGATION CONTROLLER
extension ViewController {
    @objc func tapForCountry() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        guard let controller = story.instantiateViewController(withIdentifier: "CountryController") as? CountryController else {
            return
        }
        controller.delegate = self
        self.present(controller, animated: true)
    }
}

extension ViewController: CountryControllerDelegate {
    func sendData(country: Country) {
        displayStatus(labeltext: country.countryCode ?? "")
        showCountryName.text = country.name
    }
}



