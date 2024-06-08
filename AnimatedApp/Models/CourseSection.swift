//
//  CourseSection.swift
//  AnimatedApp
//
//  Created by Enrique Sarmiento on 6/8/24.
//

import Foundation
import SwiftUI

struct CourseSection: Identifiable {
    var id = UUID()
    var title: String
    var caption: String
    var color: Color
    var image: Image
}

var courseSections = [
    CourseSection(title: "VISA", caption: "you are owned 20 $USD", color: Color(hex: "9CC5FF"), image: Image("Topic 2")),
    CourseSection(title: "AMERICAN EXPRESS", caption: "you are owned 440 $USD", color: Color(hex: "6E6AE8"), image: Image("Topic 1")),
    CourseSection(title: "MASTER CARD", caption: "you spent 20 $USD", color: Color(hex: "005FE7"), image: Image("Topic 2")),
    CourseSection(title: "CASH", caption: "nothings to show", color: Color(hex: "BBA6FF"), image: Image("Topic 1"))
]
