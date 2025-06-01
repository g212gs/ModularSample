//
//  UserListRowView.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import CoreModule
import Kingfisher
import SwiftUI

struct UserListRowView: View {
    let user: User
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            KFImage(URL(string: user.photo))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .cancelOnDisappear(true)
                .fade(duration: 0.2)
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user.name)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(user.company)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 4) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.blue)
                    Text(user.email)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.green)
                    Text(user.phone)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 0.5)
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    UserListRowView(user: User.preview)
}
