//
//  Course.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import Foundation

import SwiftUI

struct Course: Identifiable {
   var id = UUID()
   var title: String
   var subtitle: String
   var caption: String
   var color: Color
   var image: Image
}

var courses = [
   Course(title: "Checking account", subtitle: "All your chekings accounts balance is here", caption: "3,900$USD", color: Color(hex: "7850F0"), image: Image("Topic 1")),
   Course(title: "Credit Cards", subtitle: "You have two credict cards with pending balance", caption: "-200 $USD", color: Color(hex: "6792FF"), image: Image("Topic 2")),
   Course(title: "Tranferences", subtitle: "You have two more upcoming transaction into your savings accounts", caption: "10,000.45 $USD", color: Color(hex: "005FE7"), image: Image("Topic 1"))
]
