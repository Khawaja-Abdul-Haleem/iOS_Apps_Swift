//
//  ItemsMode.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 06/07/2023.
//

import Foundation

struct ItemsModel {
    let image: String
    let name: String
    let price: String
    let smallPrice: String
    let largePrice: String
}

let itemsModel = [
    ItemsModel(image: "burger", name: "Burgers", price: "350", smallPrice: "250", largePrice: "450"),
    ItemsModel(image: "pizza", name: "Pizza", price: "2000", smallPrice: "1250", largePrice: "3555"),
    ItemsModel(image: "cake", name: "Cakes", price: "1200", smallPrice: "500", largePrice: "2000"),
    ItemsModel(image: "nuggets", name: "Nuggets", price: "600", smallPrice: "400", largePrice: "950"),
    ItemsModel(image: "coldDrink", name: "Cold Drinks", price: "170", smallPrice: "100", largePrice: "280"),
    ItemsModel(image: "fries", name: "French Fries", price: "400", smallPrice: "300", largePrice: "600")]

extension Optional where Wrapped == ItemsModel {
    var defaultValue: ItemsModel {
        self ?? ItemsModel(image: "", name: "", price: "", smallPrice: "", largePrice: "")
    }
}
