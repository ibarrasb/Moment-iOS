//
//  FeedViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//

import SwiftUI

struct FollowingContent: View {
    var body: some View {
        Text("Following Content Placeholder")
            .font(.headline)
            .foregroundColor(.white)
    }
}

struct FeedViewController: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.darkGray).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) { // Add spacing of 0
                    HStack {
                        NavigationLink(destination: SearchView()) { // Navigate to SearchView
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 20)
                        
                        Text("Moment") // Add the app name here
                            .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        NavigationLink(destination: NotificationsView()) { // Navigate to NotificationsView
                            Image(systemName: "bell")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.top, -370) // Add top padding for the HStack
                    
                    FollowingContent() // Display the content of the users the person follows
                }
            }
        }
    }
}

struct FeedViewController_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewController()
    }
}

