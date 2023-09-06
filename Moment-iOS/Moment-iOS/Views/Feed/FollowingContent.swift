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
    var timePosted: String
    var isLiked: Bool
    var likes: Int
    var comments: [Comment]
}

struct Comment: Identifiable {
    let id = UUID()
    var username: String
    var text: String
}

struct PostView: View {
    @Binding var post: UserPost // Use @Binding to make specific properties mutable
    @State private var selectedPhotoIndex: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: post.profilePicture) // You can use an image here
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(post.username)
                    .font(.headline)
            }
            
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
            
            // Arrow buttons for photo navigation (conditionally shown)
            if post.photos.count > 1 {
                HStack {
                    Button(action: {
                        if selectedPhotoIndex > 0 {
                            selectedPhotoIndex -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if selectedPhotoIndex < post.photos.count - 1 {
                            selectedPhotoIndex += 1
                        }
                    }) {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal)
            }
            
            Text(post.caption)
                .font(.body)
            
            HStack {
                Button(action: {
                    // Handle like button tap
                }) {
                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(post.isLiked ? .red : .black)
                }
                
                Text("\(post.likes) Likes")
                    .font(.footnote)
            }
            
            // Display comments
            VStack(alignment: .leading, spacing: 4) {
                ForEach(post.comments) { comment in
                    Text("\(comment.username): \(comment.text)")
                        .font(.caption)
                }
            }
            
            Text("Time Posted: \(post.timePosted)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
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
        var posts = [
            UserPost(
                username: "JohnDoe",
                profilePicture: "photo",
                photos: ["photo", "photo2"],
                caption: "A great moment to remember!",
                timePosted: "2 hours ago",
                isLiked: false,
                likes: 15,
                comments: [
                    Comment(username: "JaneDoe", text: "Beautiful photo!"),
                    Comment(username: "Alice", text: "Nice caption!")
                ]
            ),
            UserPost(
                username: "JohnDoe",
                profilePicture: "photo",
                photos: ["photo"],
                caption: "A great moment to remember!",
                timePosted: "2 hours ago",
                isLiked: false,
                likes: 15,
                comments: [
                    Comment(username: "JaneDoe", text: "Beautiful photo!"),
                    Comment(username: "Alice", text: "Nice caption!")
                ]
            )
            // Add more posts here...
        ]

        return FollowingContent(posts: posts) // Initialize ContentView with posts
    }
}
