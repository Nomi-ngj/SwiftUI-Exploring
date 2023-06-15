//
//  MockHorizontalListView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI

struct MockHorizontalListView: View {
    var body: some View {
        HStack(spacing: 12){
            ForEach(1...30,id: \.self) {index in
                HStack(spacing: 0){
                    ZStack{
                        Circle()
                            .fill(Color.gray.opacity (0.5))
                            .frame(width: 60, height: 60)
                        Text("\(index)")
                            .foregroundColor(.secondary)
                            .font(.body)
                    }
                }
            }
        }.padding()
    }
}

#if DEBUG
#Preview{
    MockHorizontalListView()
}
#endif
