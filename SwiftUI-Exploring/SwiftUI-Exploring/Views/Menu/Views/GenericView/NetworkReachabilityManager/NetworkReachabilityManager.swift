//
//  NetworkReachabilityManager.swift
//  SwiftUI-Exploring
//
//  Created by Nouman Gul Junejo on 15/06/2023.
//
import SwiftUI
import Network

class NetworkReachabilityManager: ObservableObject {
    @Published var isInternetAvailable = true
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isInternetAvailable = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}

struct NetworkView: View {
    @StateObject private var reachabilityManager = NetworkReachabilityManager()
    @State private var isShowingNoInternetPopup = false
    
    var body: some View {
        VStack {
            if reachabilityManager.isInternetAvailable {
                Text("Internet is available")
            } else {
                Text("No internet connection")
            }
        }
        .onReceive(reachabilityManager.$isInternetAvailable) { isInternetAvailable in
            isShowingNoInternetPopup = !isInternetAvailable
        }
//        .popup(isPresented: $isShowingNoInternetPopup) {
//            NoInternetPopup()
//        }
        .alert(isPresented: $isShowingNoInternetPopup) {
                    Alert(
                        title: Text("No Internet Connection"),
                        message: Text("Please check your internet connection."),
                        dismissButton: .default(Text("OK"))
                    )
                }
        
        .sheet(isPresented: $isShowingNoInternetPopup) {
                    NotificationView(isPresented: $isShowingNoInternetPopup)
//            NoInternetPopup()
                }
    }
}


struct NotificationView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Message")
                .font(.headline)
                .padding()
            Text("You have received a new message!")
                .font(.subheadline)
                .padding()
            Button("Dismiss") {
                isPresented = false
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NoInternetPopup: View {
    var body: some View {
        VStack {
            Text("No Internet Connection")
                .font(.headline)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NetworkView()
}





