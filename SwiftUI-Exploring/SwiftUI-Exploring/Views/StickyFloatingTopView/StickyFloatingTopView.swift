//
//  StickyFloatingTopView.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//

import SwiftUI


///StickyFloatingTopView: A view that displays content with a floating button that allows scrolling to the top.
///content: The main content of the view.
///scrollViewOffset: Tracks the vertical offset of the scroll view.
///startOffset: Stores the initial offset of the content.
///ScrollViewReader: Wraps the scroll view to enable scrolling to specific elements.
///ScrollView: The main scroll view displaying the content.
///content.id("ScrollToTop"): Identifies the content to scroll to the top.
///GeometryReader: Measures the frame of the content and calculates the offset.
///Button: The button to scroll to the top.
///proxyReader.scrollTo("ScrollToTop", anchor: .top): Scrolls the content to the top.
///opacity(-scrollViewOffset > 250 ? 1 : 0): Sets the opacity based on the scrollViewOffset.
///animation(.easeInOut, value: scrollViewOffset > 250): Animates the opacity change with ease in and out effect.
///padding(.trailing): Adds trailing padding to the entire view.

struct StickyFloatingTopView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    @State var scrollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    
    var body: some View {
        ScrollViewReader { proxyReader in
            ScrollView(.vertical, showsIndicators: false, content: {
                content
                    .id("ScrollToTop") // Identifies the content to scroll to top
                    .overlay(
                        GeometryReader { proxy -> Color in
                            DispatchQueue.main.async {
                                if startOffset == 0 {
                                    self.startOffset = proxy.frame(in: .global).minY
                                }
                                let offset = proxy.frame(in: .global).minY
                                self.scrollViewOffset = offset - startOffset
                            }
                            return Color.clear
                        }
                        .frame(width: 0, height: 0)
                        , alignment: .top
                    )
            })
            .overlay(alignment: .bottomTrailing, content: {
                Button(action: {
                    withAnimation(.spring()) {
                        proxyReader.scrollTo("ScrollToTop", anchor: .top) // Scrolls to the top of the content
                    }
                }) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .padding(.trailing, 30)
                .padding(.bottom, getSafeArea().bottom == 0 ? 12 : 0)
                .opacity(-scrollViewOffset > 250 ? 1 : 0) // Changes the opacity based on scrollViewOffset
                .animation(.easeInOut, value: scrollViewOffset > 250) // Animates the opacity change
            })
        }
    }
}


#if DEBUG
#Preview{
    StickyFloatingTopView{
        MockVerticalListView()
    }
}
#endif

