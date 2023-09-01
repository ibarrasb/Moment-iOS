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
                    .padding(.top, -345)

                    FollowingContent()
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
