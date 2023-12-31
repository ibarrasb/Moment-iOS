//
//  FeedViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//

import SwiftUI

//data for posts on the user feed 
var feedPosts: [UserPost] = [UserPost(
    username: "Eddie Ibarra",
    profilePicture: "photo",
    photos: ["photo", "photo2"],
    caption: "A great moment to remember",
    timePosted: Date(),
    isLiked: false,
    likes: 15,
    comments: [
        ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful photo!"),
        ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption dude!")
    ]
),
UserPost(
    username: "JohnDoe",
    profilePicture: "photo",
    photos: ["photo"],
    caption: "A great moment to remember!",
    timePosted: Date(),
    isLiked: false,
    likes: 15,
    comments: [
        ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful photo!"),
        ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption!")
    ]
)] // Replace this with your actual posts data


struct FeedViewController: View {
    // Define your posts data here
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    HStack {
                        Text("Moment")
                            .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                            .foregroundColor(.white)
                            .padding(.leading, 20)

                        Spacer()

                        NavigationLink(destination: SearchView().navigationBarBackButtonHidden(true)) {
                            ZStack {
                                Image(systemName: "magnifyingglass")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 0)

                    FollowingContent(posts: feedPosts)
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
