//
//  UserDetailScreen.swift
//  UserDetailModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import CoreModule
import Kingfisher
import SwiftUI

public struct UserDetailScreen: View {
    public let user: User
    
    public init(user: User) {
        self.user = user
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                KFImage(URL(string: user.photo))
                    .resizable()
                    .placeholder {
                        ProgressView()
                    }
                    .cancelOnDisappear(true)
                    .fade(duration: 0.2)
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 8)
                    .padding(.top, 32)
                
                VStack(spacing: 4) {
                    Text(user.name)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    Text(user.company)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider().padding(.horizontal)
                
                VStack(spacing: 12) {
                    UserDetailRowView(icon: "person.crop.circle.fill", label: "Username", value: user.username)
                    UserDetailRowView(icon: "envelope.fill", label: "Email", value: user.email, type: .email)
                    UserDetailRowView(icon: "phone.fill", label: "Phone", value: user.phone, type: .phone)
                    UserDetailRowView(icon: "location.fill", label: "Address", value: user.address)
                    UserDetailRowView(icon: "map.fill", label: "State", value: user.state)
                    UserDetailRowView(icon: "globe", label: "Country", value: user.country)
                    UserDetailRowView(icon: "number", label: "ZIP", value: user.zip)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.bottom)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    UserDetailScreen(user: User.preview)
}
