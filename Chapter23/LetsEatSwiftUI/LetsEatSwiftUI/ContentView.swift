//
//  ContentView.swift
//  LetsEatSwiftUI
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import SwiftUI

struct ContentView: View {
    var restaurantItems: [RestaurantItem] = testData
    var body: some View {
        NavigationView {
            List(restaurantItems) { restaurantItem in
                RestaurantCell(restaurantItem: restaurantItem)
            }.navigationTitle("Boston, MA")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restaurantItems: testData)
    }
}

struct RestaurantCell: View {
    var restaurantItem: RestaurantItem
    var body: some View {
        NavigationLink(destination: RestaurantDetail(selectedRestaurant: restaurantItem)){
            Spacer()
            VStack {
                Text(restaurantItem.title)
                    .font(.headline)
                    .fixedSize()
                Text(restaurantItem.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize()
                AsyncImage(url: URL(string: restaurantItem.imageURLString))
                    .mask(RoundedRectangle(cornerRadius: 9))
            }
            Spacer()
        }
    }
}
