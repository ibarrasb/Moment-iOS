//
//  MainTabViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/30/23
import SwiftUI

struct MainTabViewController: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedViewController()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }.tag(0)
            EngagementViewController()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "person.3.fill")
                }.tag(1)
            FeedViewController()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "capsule.inset.filled")
                }.tag(2)
            ProfileViewController()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "person.fill")
                }.tag(3)
        }
    }
}

struct MainTabViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainTabViewController()
    }
}
