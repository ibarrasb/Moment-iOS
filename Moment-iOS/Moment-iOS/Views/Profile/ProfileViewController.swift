//
//  ProfileViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//
import SwiftUI

//User profile information
let user = User(name: "Eddie Ibarra", username: "ebarrra", bio: "Dallas // ", friendCount: 200, isPrivate: false)

// Data for the user profile feed
var posts: [ProfileUserPost] = [
    ProfileUserPost(
    username: "Eddie Ibarra",
    profilePicture: "eddiepic",
    photos: ["eddiepic"],
    caption: "NYC📍",
    timePosted: Date(),
    isLiked: false,
    isCoreMoment: false,
    likes: [
        postLikedBy(username: "JaneDoe", profilePicture: "eddiepic", isFriend: true),
        postLikedBy(username: "Alice", profilePicture: "eddiepic", isFriend: true)
    ]
    ,
    comments: [
        ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful!"),
        ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption!")
    ]
),
    ProfileUserPost(
    username: "Eddie Ibarra",
    profilePicture: "eddiepic",
    photos: ["photo"],
    caption: "A great moment to remember!",
    timePosted: Date(),
    isLiked: false,
    isCoreMoment: false,
    likes: [
        postLikedBy(username: "JaneDoe", profilePicture: "eddiepic", isFriend: true),
        postLikedBy(username: "Alice", profilePicture: "eddiepic", isFriend: true)
    ],
    comments: [
        ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful photo!"),
        ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption!")
    ]
)]

struct User {
    let name: String
    let username: String
    let bio: String
    let friendCount: Int
    let isPrivate: Bool
}

struct ProfileViewController: View {
    var body: some View {
        NavigationView {
            
            //used to keep top header in a fixed place
            GeometryReader { geometry in
                ZStack {
                    Color.black.opacity(0.9)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Text("Moment")
                                .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            Spacer()
                            
                            NavigationLink(destination: SettingsViewController().navigationBarBackButtonHidden(true)) {
                                Image(systemName: "gear")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 20)
                            }
                        }
                        .padding(.bottom, -1)
                        
                        //Fetch user profile info
                        ProfileContent(user: user)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}


struct ProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewController()
    }
}
