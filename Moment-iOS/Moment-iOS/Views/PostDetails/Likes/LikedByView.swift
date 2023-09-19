//
//  LikedByView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/16/23.
//
import SwiftUI

struct postLikedBy: Identifiable {
    let id = UUID()
    var username: String
    var profilePicture: String
    var isFriend: Bool
}

struct LikedByView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var likedBy: [postLikedBy]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                HStack {
                    // Custom back button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .padding(.leading, 16)
                    }
                    
                    Spacer()
                    
                    Text("\(likedBy.count) Likes")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, -35)
                    Spacer()
                }
                .frame(height: 44)
                
                List {
                    ForEach(likedBy) { user in
                        UserRowView(user: user)
                    }
                    .listRowBackground(Color.black.opacity(0.9))
                }
                .listStyle(PlainListStyle())
                .frame(height: geometry.size.height - 44) // Adjust the height of the list
            }
            .background(Color.black)
        }
    }
}

struct UserRowView: View {
    var user: postLikedBy
    @State private var isFriendRequestPending = false
    
    var body: some View {
        HStack {
            Image(user.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 5)
            Text(user.username)
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                if user.isFriend {
                    // Handle manage friendship action
                } else {
                    if isFriendRequestPending {
                        // Cancel the friend request
                        // Update your data or perform any necessary actions here
                    } else {
                        // Send friend request
                        // Update your data or perform any necessary actions here
                    }
                    isFriendRequestPending.toggle()
                }
            }) {
                if user.isFriend {
                    Text("Friend")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(5)
                } else {
                    Text(isFriendRequestPending ? "Pending" : "Add Friend")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(isFriendRequestPending ? Color.gray.opacity(0.5) : Color.blue)
                        .cornerRadius(5)
                }
            }
        }
        .listRowBackground(Color.black.opacity(0.9))
    }
}

let sampleLikes = [
    postLikedBy(username: "Eddie Ibarra", profilePicture: "eddiepic", isFriend: true),
    postLikedBy(username: "John Doe", profilePicture: "eddiepic", isFriend: false)
]

struct LikedByView_Previews: PreviewProvider {
    static var previews: some View {
        LikedByView(likedBy: sampleLikes)
    }
}
