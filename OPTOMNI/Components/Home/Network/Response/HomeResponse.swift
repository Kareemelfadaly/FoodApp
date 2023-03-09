//
//  HomeResponse.swift
//  OPTOMNI
//
//  Created by Kareem Elfadaly on 10/08/2022.
//

import Foundation

struct HomeResponse: Codable {
    var favouriteFruits:[Fruit]
    var promotedProducts:[Fruit]

    enum CodingKeys: String, CodingKey {
        case favouriteFruits = "favourite_fruits"
        case promotedProducts = "promoted_products"
    }
}

struct Fruit: Codable {
    var name:String?
    var image:String?
    var price:Double?
    var weight:Double?
}
