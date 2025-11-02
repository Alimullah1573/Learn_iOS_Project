//
//  HomeVC.swift
//  WeatherAPI
//
//  Created by MD Alimullah on 31/10/25.
//

// HomeVC.swift
import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    let apiKey = "255e4b834c77ffc8d8dfada8424267ee"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        if let city = cityTextField.text, !city.isEmpty {
            fetchWeather(for: city)
        }
    }
    
    func fetchWeather(for city: String) {
      
        // the gap Encode
        let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil{
                print("Error")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.cityLabel.text = ("Location :     \(result.name)")
                        self.tempLabel.text = "temperature :      \(result.main.temp)°C"
                        
                        if let condition = result.weather.first?.main {
                            self.conditionLabel.text = "Condition :     \(condition)"
                        } else {
                            self.conditionLabel.text = "Condition : Not Available"
                        }
                        
                    }
                } catch {
                    print("Decoding Error:", error)
                }
            }
        }.resume()
    }
}
