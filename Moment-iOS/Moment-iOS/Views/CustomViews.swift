//
//  CustomViews.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/29/23.
//

import SwiftUI

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

struct CustomViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}
