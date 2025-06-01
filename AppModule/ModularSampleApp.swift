//
//  ModularSampleApp.swift
//  ModularSample
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import SwiftUI
import UserListModule

@main
struct ModularSampleApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = UserListViewModel()
            UserListScreen(viewModel: viewModel)
        }
    }
}
