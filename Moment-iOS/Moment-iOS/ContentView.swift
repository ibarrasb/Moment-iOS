//
//  ContentView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/24/23.
//
import SwiftUI

struct ContentView: View {
   
 
    init() {
          // Set your desired background color here
          UITabBar.appearance().barTintColor = UIColor.black.withAlphaComponent(0.9)
      }
     

    var body: some View {
        TabView {
            
        NavigationStack {
                    FeedViewController()
                }
        .tabItem {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Home")
        }
            NavigationStack {
                EngagementViewController()
                    }
            .tabItem {
                Image(systemName: "house.fill")
                    .font(.title)
                Text("Home")
            }
            NavigationStack {
                CreateViewController()
                    }
            .tabItem {
                Image(systemName: "house.fill")
                    .font(.title)
                Text("Home")
            }
            NavigationStack {
                MessagesViewController()
                    }
            .tabItem {
                Image(systemName: "house.fill")
                    .font(.title)
                Text("Home")
            }
            NavigationStack {
                ProfileViewController()
                    }
            .tabItem {
                Image(systemName: "person.fill")
                    .font(.title)
                Text("Home")
            }
        
            
        
            
        }
        .onAppear(){
            UITabBar.appearance().barTintColor = UIColor(.black)
            UITabBar.appearance().unselectedItemTintColor = .white
        }
        .navigationBarHidden(true) // Hide the navigation bar
        .accentColor(.white) // Set the selected tab color
 
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
