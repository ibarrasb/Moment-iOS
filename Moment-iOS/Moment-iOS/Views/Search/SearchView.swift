//
//  SearchView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//

import SwiftUI
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
           
            TextField("Search", text: $text)
                .foregroundColor(.black)
                
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
        .background(Color(UIColor.systemGray5))
        .cornerRadius(8)
    }
}

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        // Custom back button
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left") // You can use any back arrow image here
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading, -35)
                        Spacer()
                    }
                    .frame(height: 44)
                    
                    SearchBar(text: $searchText)
                        .padding(.horizontal, 5)
                        .padding(.bottom, 625)
                        
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
