//
//  MainTabViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/30/23
import SwiftUI

struct MainTabViewController: View {
    @State private var selectedIndex = 4
 
    init() {
          // Set your desired background color here
          UITabBar.appearance().barTintColor = UIColor.black.withAlphaComponent(0.9)
      }
     
    var body: some View {
        
        NavigationStack {
            TabView(selection: $selectedIndex) {
                
                Group {
                    FeedViewController()
                        .tabItem {
                            Image(systemName: "newspaper.fill")
                                .font(.title)
                            Text("Feed")
                        }
                        .tag(0)
                    
                    EngagementViewController()
                        .tabItem {
                            Image(systemName: "person.3.fill")
                                .font(.title)
                            Text("Friends")
                        }
                        .tag(1)
                    
                    CreateViewController()
                        .tabItem {
                            Image(systemName: "house.fill")
                                .font(.title)
                            Text("Home")
                        }
                        .tag(2)
                    
                    MessagesViewController()
                        .tabItem {
                            Image(systemName: "message.fill")
                                .font(.title)
                            Text("Messages")
                        }
                        .tag(3)
                    
                    ProfileViewController()
                        .tabItem {
                            Image(systemName: "person.fill")
                                .font(.title)
                            Text("Profile")
                        }
                        .tag(4)
                }
                
            }
            .navigationBarHidden(true) // Hide the navigation bar
            .accentColor(.white) // Set the selected tab color
           
        }
        
    }
    
}

struct MainTabViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainTabViewController()
    }
}
