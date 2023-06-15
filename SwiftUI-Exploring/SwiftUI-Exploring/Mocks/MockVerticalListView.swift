//
//  MockListView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct MockVerticalListView: View {
    var body: some View {
        VStack(spacing: 12){
            ForEach(1...30,id: \.self) {index in
                
                HStack(spacing: 15){
                    ZStack{
                        Circle()
                            .fill(Color.gray.opacity (0.5))
                            .frame(width: 60, height: 60)
                        Text("\(index)")
                            .foregroundColor(.secondary)
                            .font(.body)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                            .padding(.trailing, 80)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                            .padding(.trailing, 160)
                    })
                }
            }
        }.padding()
    }
}

#if DEBUG
#Preview{
    MockVerticalListView()
}
#endif
