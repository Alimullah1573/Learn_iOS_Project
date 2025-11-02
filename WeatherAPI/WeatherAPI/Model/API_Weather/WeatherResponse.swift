//
//  WeatherResponse.swift
//  TestAllProject
//
//  Created by MD Alimullah on 31/10/25.
//


import SwiftUI
 
// Codable  aitar maddome API datake Ncode and Decode ak shate peyjai
struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: String
}
