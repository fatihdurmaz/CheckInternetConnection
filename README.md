# Connectivity Monitor

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

A simple Swift class for monitoring network connectivity using the Network & Observation framework.

## Usage

### Installation

Add the `ConnectivityMonitor.swift` file to your project.

### ConnectivityMonitor Class

```swift
import Foundation
import Network
import Observation

@Observable
class ConnectivityMonitor {
    private let connectivityMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    
    init() {
        connectivityMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        connectivityMonitor.start(queue: workerQueue)
    }
}
```

### Example

```swift
import SwiftUI

struct ContentView: View {
    @State private var connectivityMonitor = ConnectivityMonitor()

    var body: some View {
        NavigationStack {
            VStack {
                if connectivityMonitor.isConnected {
               
                        Text("İnternet Bağlantısı Var.")
                            .font(.title)
                        .foregroundStyle(.green)
                    
                    
                } else {
                  
                        Text("İnternet Bağlantısı Yok.")
                            .font(.title)
                        .foregroundStyle(.red)
                    
                }     
            }
            .padding()
            .navigationTitle("Connection Check")
        }
    }
}
```
