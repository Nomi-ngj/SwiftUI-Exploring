//
//  MenuView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

enum MenuViewType:CaseIterable{
    case stickyFloatingView, colorPicker, toolbarTitleMenu, animation, genericViews
    
    func name()-> String{
        switch self {
        case .stickyFloatingView:
            return "Sticky Floating View"
        case .colorPicker:
            return "Color Picker"
        case .toolbarTitleMenu:
            return "Toolbar Title Menu"
        case .animation:
            return "Animations"
        case .genericViews:
            return "Generic Views Animations"
        }
    }
}
struct MenuView: View{
    @State var color = RGB()
    var body: some View {
           NavigationView {
               List(MenuViewType.allCases, id: \.self) { type in
                   
                   switch type{
                   case .stickyFloatingView:
                       NavigationLink(destination: StickyFloatingTopView{ MockVerticalListView() }) {
                           Text(type.name())
                       }
                   case .colorPicker:
                       
                       NavigationLink(destination: ColorPickerView(guess: color){ rgb in
                           debugPrint(rgb)
                           color = rgb
                           
                       }) {
                           HStack{
                               Text(type.name())
                               Spacer()
                               Circle()
                                   .background(color.getColor())
                                   .foregroundColor(color.getColor())
                                   .cornerRadius(8)
                                   .frame(height: 30)
                           }
                           
                           
                       }
                       
                   case .toolbarTitleMenu:
                       NavigationLink(destination: ToolBarTitleMenu()) {
                           Text(type.name())
                       }
                       
                   case .animation:
                       
                       NavigationLink(destination: AnimationsListView()) {
                           Text(type.name())
                       }
                   case .genericViews:
                       NavigationLink(destination: ListAnimationScaleEffect()) {
                           Text(type.name())
                       }
                   }
               }
               .navigationTitle("Menu")
               
           }
       }
}

#Preview{
    MenuView()
}
