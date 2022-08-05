//
//  ViewController.swift
//  Access Data Using Web API Covid - 19
//
//  Created by macmini01 on 04/08/22.
//

import UIKit
import DropDown

class ViewController: UIViewController {

    let dropDown = DropDown()
    
    //MARK: Array of country list
    var countryList = ["IND", "SA", "UK", "AUS"]
    
    //MARK: Array of country name.
    var countryName = ["India", "South Africa", "United Kingdom", "Australia"]
    
    //MARK: OUTLETS
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var showCountryName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        displayStatus(labeltext: "")
        showCountryName.text = nil
    }
    
    //MARK: Action
    @IBAction func selectCountries(_ sender: Any) {
        tableView.isHidden = false
    }
    
    //MARK: API CALLING
    func displayStatus(labeltext: String) {
        
        let path = labeltext.isEmpty ? "https://api.covid19api.com/live/country" : "https://api.covid19api.com/live/country/\(labeltext)"
        
        
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
            
            guard let finalStatus = currentStatus else {
                return
            }
            
            //MARK: SET LABEL TEXT
            DispatchQueue.main.async {
                self.totalConfirmedLabel.text = "\(finalStatus.first?.Confirmed ?? 0)"
                self.totalDeathsLabel.text = "\(finalStatus.first?.Deaths ?? 0)"
                self.newConfirmedLabel.text = "\(finalStatus.first?.Active ?? 0)"
            }
        }).resume()
    }
}

//MARK: Table View Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.countryLabel?.text = countryList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayStatus(labeltext: countryList[indexPath.row])
        showCountryName.text = "\(countryName[indexPath.row]) Covid Cases"
        tableView.isHidden = true
    }
}



