//
//  ContentView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var notificationCount = 0
    
    var body: some View {
        VStack {
            Button(action: {
                // Increase the notification count by 1
                notificationCount += 1
            }) {
                ZStack {
                    Image(systemName: "bell")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    
                    if notificationCount > 0 {
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 20, height: 20)
                            .offset(x: 15, y: -15)
                        
                        Text("\(notificationCount)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .offset(x: 15, y: -15)
                    }
                }
            }
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
