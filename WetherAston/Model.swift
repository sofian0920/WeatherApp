//
//  Model.swift
//  WetherAston
//
//  Created by Софья Норина on 30.09.2023.
//

import Foundation


struct WeatherData: Decodable {
    let temperature: Double
    var cityName: String
    let timezone: Int
    let condionId: Int
    let description : String
}
