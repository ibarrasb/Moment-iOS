//
//  UserProfilesViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//
import SwiftUI

struct UserProfileUser {
    let name: String
    let bio: String
    let friendCount: Int
    let isPrivate: Bool
    var isFriend: Bool  // New property to indicate if the user is a friend
}

struct UserContent {
    // Define the content properties you want to display (e.g., posts, photos, etc.)
}

struct UserProfilesViewController: View {
    var user: UserProfileUser  // The user whose profile is being viewed
    var content: UserContent   // Content associated with the user

    @State private var selectedTab: Tab = .list

    enum Tab {
        case list
        case calendar
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
                
                VStack {
                    UserProfileContent(user: user)
                    
                    if user.isPrivate && !user.isFriend {
                        Text("You must be friends with this user to view their content.")
                            .foregroundColor(.white)
                            .padding()
                    } else {
                        HStack(spacing: 20) {
                            CustomTabButton(title: "List", isSelected: selectedTab == .list) {
                                selectedTab = .list
                            }

                            CustomTabButton(title: "Calendar", isSelected: selectedTab == .calendar) {
                                selectedTab = .calendar
                            }
                        }
                        .padding(.top, 25)
                        .padding(.bottom, 10)

                        if selectedTab == .list {
                            Text("List View Content")
                        } else {
                            Text("Calendar View Content")
                        }
                    }

                    Spacer()
                }
            }
        }
    }
}

struct UserProfileContent: View {
    var user: UserProfileUser
    
    @State private var isFriendRequestPending = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Moment")
                    .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                Spacer()
            }

            Button(action: {
                // Handle profile picture update
            }) {
                Image("profile_picture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 5)
            }

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
            
            if user.isFriend {
                
                VStack{
                    HStack{
                        Button(action: {
                            // Handle manage friendship action
                        }) {
                            Text("Manage Friendship")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(5)
                        }
                        Button(action: {
                            // Handle manage friendship action
                        }) {
                            Text("Message")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 40)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(5)
                        }
                    }
                    Button(action: {
                        // Handle manage friendship action
                    }) {
                        Text("Time Capsule")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 105)
                            .background(Color.yellow)
                            .cornerRadius(5)
                    }
                }
            } else {
                Button(action: {
                    if isFriendRequestPending {
                        // Cancel the friend request
                        // Update your data or perform any necessary actions here
                    } else {
                        // Send friend request
                        // Update your data or perform any necessary actions here
                    }
                    isFriendRequestPending.toggle()
                }) {
                    Text(isFriendRequestPending ? "Pending" : "Add Friend")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(isFriendRequestPending ? Color.gray.opacity(0.5) : Color.blue)
                        .cornerRadius(5)
                }

            }
        }
        .padding(.horizontal)
        .padding(.top, 20)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct UserProfilesViewController_Previews: PreviewProvider {
    static var previews: some View {
        let user = UserProfileUser(name: "Susana Sainz", bio: "bio", friendCount: 250, isPrivate: false, isFriend: true)
        let content = UserContent()
        return UserProfilesViewController(user: user, content: content)
    }
}
