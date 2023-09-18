//
//  ProfileListContent.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/13/23.
//
import SwiftUI

struct ProfileUserPost: Identifiable {
    let id = UUID()
    var username: String
    var profilePicture: String
    var photos: [String]
    var caption: String
    var timePosted: Date
    var isLiked: Bool // possibly remove this (not needed)
    var isCoreMoment: Bool
    var likes: [postLikedBy]
    var comments: [ProfileComment]
}



struct ProfilePostView: View {
    @Binding var post: ProfileUserPost // Use @Binding to make specific properties mutable
    @State private var selectedPhotoIndex: Int = 0
    @State private var isCoreMoment: Bool = false
    
   
    var body: some View {
        VStack(spacing: 8) {
            
            HStack(alignment: .center) {
                Image(post.profilePicture)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(post.username)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer() // Pushes the content to the left
            }

            Text(post.caption)
                .font(.body)
                .foregroundColor(.white)
            // Display time posted
            Text(timeAgoSinceDate(post.timePosted))
                .font(.caption)
                .foregroundColor(.gray)
            
            
            // Display photos with a horizontal scroll view and paging
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(post.photos.indices, id: \.self) { index in
                        Image(post.photos[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .clipped() // Clip the image to fit the frame
                    }
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .offset(x: CGFloat(selectedPhotoIndex) * -UIScreen.main.bounds.width, y: 0)
            }
            HStack(spacing: 50){
                
                
                
                
                
                
                // Heart button for liking

                    NavigationLink(destination: LikedByView(likedBy: post.likes).navigationBarBackButtonHidden(true))
               {
                   Image(systemName: "heart.fill")
                       .scaleEffect(2.0) // Increase the scale factor (adjust the value as needed)
                           .frame(width: 50, height: 50) // Adjust the button size
                           .foregroundColor(Color.blue) // Set the heart color to blue
                 
                }
                
                
                
                
                // Button to view comments
                    NavigationLink(destination: CommentsView(comments: post.comments).navigationBarBackButtonHidden(true))
               {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                        .frame(width: 50, height: 50) // Adjust the button size
                        .foregroundColor(Color.white)
                }
                
                //Toggle button to favorite a moment
                Button(action: {
                    isCoreMoment.toggle() // Toggle the core moment status
                }) {
                    Image(systemName: isCoreMoment ? "star.fill" : "star")
                        .imageScale(.large)
                        .frame(width: 50, height: 50) // Adjust the button size
                        .foregroundColor(isCoreMoment ? Color.blue : Color.white) // Change color when liked
                }
                // Button to view more options
                Button(action: {
                    // Handle viewing more options here
                }) {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .frame(width: 50, height: 50) // Adjust the button size
                        .foregroundColor(Color.white)
                }
            }
          
        }
        .padding(.bottom, -30)
        .padding()
        Divider()
            .background(Color.gray) // Change the color
            .frame(height: 2)       // Change the height (thickness) of the line

    }
    
}

struct ProfileFeedView: View {
    @Binding var posts: [ProfileUserPost]

    var body: some View {
        ScrollView {
            ForEach(posts.indices, id: \.self) { index in
                ProfilePostView(post: $posts[index]) // Pass likes as a regular Int
                    .padding(.bottom, 20)
            }
        }
    }
}


struct ProfileListContent: View {
    @State var posts: [ProfileUserPost]

    var body: some View {
        ProfileFeedView(posts: $posts)
    }
}

struct ProfileListContent_Previews: PreviewProvider {
    static var previews: some View {
        // Example posts
        let posts = [
            ProfileUserPost(
                username: "Eddie Ibarra",
                profilePicture: "photo",
                photos: ["photo", "photo2"],
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
            ),
            ProfileUserPost(
                username: "JohnDoe",
                profilePicture: "photo",
                photos: ["photo"],
                caption: "A great moment to remember!",
                timePosted: Date(),
                isLiked: false,
                isCoreMoment: false,
                likes: [ postLikedBy(username: "JaneDoe", profilePicture: "eddiepic", isFriend: true),
                         postLikedBy(username: "Alice", profilePicture: "eddiepic", isFriend: true)
                ],
                comments: [
                    ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful photo!"),
                    ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption!")
                ]
            )
            // Add more posts here...
        ]

        return ProfileListContent(posts: posts) // Initialize ContentView with posts
    }
}
