//
//  DoctorView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 28/06/2023.
//

import SwiftUI

struct DoctorView:View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack{
                    Image("icon_face")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .clipped()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Dr. Majed Suleiman")
                            .font(
                                Font.custom("SF Pro Text", size: 17)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                        
                        Text("Cardiology")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(Color(red: 0.04, green: 0.52, blue: 1))
                        
                        Text("Dubai Hospital - Deira (Gov)")
                            .font(Font.custom("SF Pro Text", size: 13))
                            .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                            .frame(maxWidth: .infinity, minHeight: 18, maxHeight: 18, alignment: .topLeading)
                        
                    }
                }
            }
            .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color.white.opacity(0.4))
        }
        .cornerRadius(8.0)
        .padding()
    }
}

#Preview {
    DoctorView()
}

