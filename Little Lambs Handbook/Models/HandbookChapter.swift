//
//  HandbookChapter.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import Foundation
import SwiftUI

enum LLPColor: String, Hashable {
    case blue
    case orange
    case green
    case cyan
    case pink
}

struct HandbookChapter: Identifiable, Hashable {

    let id: String
    let number: String
    let title: String
    let subtitle: String
    let icon: String
    let accent: LLPColor

    // Pages from original Parent Passport PDF
    let pdfPages: [Int]

    let items: [HandbookItem]
}
struct HandbookItem: Identifiable, Hashable {

    let id: String
    let title: String
    let body: String
}

extension HandbookChapter {

    var accentColor: Color {

        switch accent {

        case .blue:

            return LLPTheme.blue

        case .orange:

            return LLPTheme.orange

        case .green:

            return LLPTheme.green

        case .cyan:

            return .cyan

        case .pink:

            return .pink

        }

    }

}
