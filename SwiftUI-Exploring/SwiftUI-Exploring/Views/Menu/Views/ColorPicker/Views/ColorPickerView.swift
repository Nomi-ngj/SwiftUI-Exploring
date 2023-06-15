//
//  ColorPickerView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct ColorPickerView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var guess: RGB = RGB()
    var onRGBChange: ((RGB) -> Void)? // Callback function

    var body: some View {
        VStack{
            ColorView(rgb: guess, size: 200)
                .padding(20)
            VStack{
                SliderView(value: $guess.red, trackColor: .red)
                SliderView(value: $guess.green, trackColor: .green)
                SliderView(value: $guess.blue, trackColor: .blue)
            }.padding(10)
            Button(action: {
                onRGBChange?(guess)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Pick Color") // Button label
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            })
        }.padding()
    }
}

#if DEBUG
#Preview {
    ColorPickerView { rbg in
        debugPrint(rbg.toString())
    }
}
#endif
