//
//  UserDetailRowView.swift
//  UserDetailModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//


import SwiftUI
import CoreModule

enum InfoType {
    case phone
    case email
    case normal
}

struct UserDetailRowView: View {
    let icon: String
    let label: String
    let value: String
    let type: InfoType
    
    init(icon: String, label: String, value: String, type: InfoType = .normal) {
        self.icon = icon
        self.label = label
        self.value = value
        self.type = type
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .frame(width: 24)
            VStack(alignment: .leading) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .onTapGesture {
                handleTap()
            }
            Spacer()
        }
    }
    
    private func handleTap() {
        switch type {
        case .phone:
            if let url = URL(string: "tel://\(value.filter { $0.isNumber })"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                debugPrint("Phone number not valid or not suportable by device")
            }
        case .email:
            if let url = URL(string: "mailto:\(value)"),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                debugPrint( "Email not valid or not suportable by device")
            }
        case .normal:
            break
        }
    }
}
