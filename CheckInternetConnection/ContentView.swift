//
//  ContentView.swift
//  CheckInternetConnection
//
//  Created by Fatih Durmaz on 17.12.2023.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State private var connectivityMonitor = ConnectivityMonitor()
    
    init() {
        let modifiedAppearance = UINavigationBarAppearance()
        modifiedAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = modifiedAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = modifiedAppearance
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if connectivityMonitor.isConnected {
                    VStack {
                        Text("İnternet Bağlantısı Var.")
                            .font(.title)
                        .foregroundStyle(.green)
                        LottieView(animation: .named("success"))
                            .looping()

                    }
                    
                } else {
                    VStack {
                        Text("İnternet Bağlantısı Yok.")
                            .font(.title)
                        .foregroundStyle(.red)
                        LottieView(animation: .named("connection"))
                            .looping()
                    }
                    

                }
                
            }
            .padding()
            .navigationTitle("Connection Check")
        }
    }
}

#Preview {
    ContentView()
}
