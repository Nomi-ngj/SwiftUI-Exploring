//
//  RGB.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct RGB{
    var red =  0.5
    var green = 0.5
    var blue = 0.5
    
    func getColor()-> Color{
        return Color(red: red, green: green, blue: blue)
    }
    
    func toString() -> String{
        "R: \(Int(red * 255.0))" + " G: \(Int(green * 255.0))" + " B: \(Int(blue * 255.0))"
    }
}
