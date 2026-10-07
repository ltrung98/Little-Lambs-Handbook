//
//  Little_Lambs_HandbookApp.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 1/10/26.
//

import SwiftUI

@main
struct Little_Lambs_HandbookApp: App {
    @State private var store = ParentPassportStore()

    var body: some Scene {
        WindowGroup { ContentView(store: store) }
    }
}
