//
//  FollowingContent.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/6/23.
//
import SwiftUI

struct UserPost: Identifiable {
    let id = UUID()
    var username: String
    var profilePicture: String
    var photos: [String]
    var caption: String
    var timePosted: Date
    var isLiked: Bool
    var likes: Int
    var comments: [ProfileComment]
}



struct PostView: View {
    @Binding var post: UserPost // Use @Binding to make specific properties mutable
    @State private var selectedPhotoIndex: Int = 0
    @State private var isLiked: Bool = false // New state to track like status

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
            HStack(spacing: 75){
                // Heart button for liking
                Button(action: {
                    isLiked.toggle() // Toggle the like status
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .frame(width: 50, height: 50) // Adjust the button size
                        .foregroundColor(isLiked ? Color.blue : Color.white) // Change color when liked
                }
                // Button to view comments
                NavigationLink(destination: CommentsView(comments: post.comments).navigationBarBackButtonHidden(true))
           {
                Image(systemName: "bubble.right")
                    .imageScale(.large)
                    .frame(width: 50, height: 50) // Adjust the button size
                    .foregroundColor(Color.white)
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




struct FeedView: View {
    @Binding var posts: [UserPost] // Use @Binding to make the entire array mutable

    var body: some View {
        ScrollView {
            ForEach(posts.indices, id: \.self) { index in
                PostView(post: $posts[index]) // Pass a binding to the post
                    .padding(.bottom, 20)
            }
        }
    }
}

struct FollowingContent: View {
    @State var posts: [UserPost] // Define @State variable for posts

    var body: some View {
        FeedView(posts: $posts) // Pass a binding to the posts
    }
}

struct FollowingContent_Previews: PreviewProvider {
    static var previews: some View {
        // Example posts
        let posts = [
            UserPost(
                username: "Eddie Ibarra",
                profilePicture: "photo",
                photos: ["photo", "photo2"],
                caption: "A great moment to remember!",
                timePosted: Date(),
                isLiked: false,
                likes: 15,
                comments: [
                    ProfileComment(profilePicture: "eddiepic",username: "JaneDoe", text: "Beautiful photo!"),
                    ProfileComment(profilePicture: "eddiepic",username: "Alice", text: "Nice caption!")
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
            )
            // Add more posts here...
        ]

        return FollowingContent(posts: posts) // Initialize ContentView with posts
    }
}
