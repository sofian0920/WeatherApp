//
//  ViewModel.swift
//  WetherAston
//
//  Created by Софья Норина on 30.09.2023.
//

import Foundation


class WeatherViewModel {
    private var weatherData: WeatherData?
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    
    enum RequestType: String {
        case GET
        case POST
    }
    
    
    func parse(data: Data) -> [WeatherData]? {
        do {
                    let weather = try JSONDecoder().decode([WeatherData].self, from: data)
                    return weather
                } catch {
                    print("error")
                    return nil
                }
       
    }
    
    func fetchWeather(endpoin: String, requestType: RequestType, completion: @escaping (([WeatherData]?) -> Void)) {
        guard let url = URL(string: baseURL + endpoin) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard error == nil else { return }
            
            if let data  {
                completion(nil)
            }
            
            if let users = self.parse(data: data!) {
                    completion(users)
            } else {
                completion(nil)
            }
        }
        task.resume()
        
        
        
    }
    
    func getTemperature() -> String{
        guard let temperature = weatherData?.temperature else {
            return " "
        }
        return "\(temperature)"
    }
}
