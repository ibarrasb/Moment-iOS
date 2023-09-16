//
//  ProfileViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//
import SwiftUI

struct User {
    let name: String
    let bio: String
    let friendCount: Int
    let isPrivate: Bool
}
// Define your posts data here
var posts: [ProfileUserPost] = [
    ProfileUserPost(
    username: "Eddie Ibarra",
    profilePicture: "eddiepic",
    photos: ["eddiepic"],
    caption: "NYC📍",
    timePosted: Date(),
    isLiked: false,
    isCoreMoment: false,
    likes: 101,
    comments: [
        ProfileComment(username: "JaneDoe", text: "Beautiful!"),
        ProfileComment(username: "Alice", text: "Nice caption!")
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
    likes: 15,
    comments: [
        ProfileComment(username: "JaneDoe", text: "Beautiful photo!"),
        ProfileComment(username: "Alice", text: "Nice caption!")
    ]
)]

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
                        
                        // Move the user and ProfileContent here
                        let user = User(name: "Eddie Ibarra", bio: "Dallas // ", friendCount: 200, isPrivate: false)
                        ProfileContent(user: user)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }
}

struct ProfileContent: View {
    var user: User
    
    @State private var selectedTab: Tab = .list
    
    enum Tab {
        case list
        case calendar
        case mentions
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Button(action: {
                    // Handle profile picture update
                }) {
                    
                    Image("eddiepic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .shadow(radius: 5)
                }
                .padding(.bottom, 10)
                
                if user.isPrivate {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                } else {
                    Image(systemName: "lock.open")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                }
                
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(user.bio)
                    .font(.headline)
                    .foregroundColor(Color(.white))
                    .padding(.bottom, 2)
                
                Button(action: {
                    // Handle the action when the friends count is clicked
                }) {
                    Text("\(user.friendCount) friends")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 10)
                
                
                Button(action: {
                    // Handle edit profile action
                }) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                
                HStack(spacing: 20) {
                    CustomTabButton(title: "List", isSelected: selectedTab == .list) {
                        selectedTab = .list
                    }
                    
                    CustomTabButton(title: "Calendar", isSelected: selectedTab == .calendar) {
                        selectedTab = .calendar
                    }
                    CustomTabButton(title: "Mentions", isSelected: selectedTab == .mentions) {
                        selectedTab = .mentions
                    }
                }
                .padding(.bottom, 10)
                .padding(.top, 15)
                
                if selectedTab == .list {
                    ProfileListContent(posts: posts)}
                 else if selectedTab == .calendar{
                    Text("Calendar View Content")
                }
                else {
                    Text("Mentions")
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct CustomTabButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .white : .gray)
            
            if isSelected {
                Capsule()
                    .foregroundColor(Color(.systemBlue))
                    .frame(height: 3)
            } else {
                Capsule()
                    .foregroundColor(Color(.clear))
                    .frame(height: 3)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                action()
            }
        }
    }
}

struct ProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewController()
    }
}
