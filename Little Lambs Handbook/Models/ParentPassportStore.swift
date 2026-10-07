//
//  Store.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import Foundation
import Observation

@Observable
final class ParentPassportStore {
    var child = ChildProfile()
    var bookmarkedChapterIDs: Set<String> = []
    var searchText = ""

    private let childKey = "LLPParentPassport.child"
    private let bookmarksKey = "LLPParentPassport.bookmarks"

    init() { load() }

    func toggleBookmark(_ id: String) {
        if bookmarkedChapterIDs.contains(id) { bookmarkedChapterIDs.remove(id) }
        else { bookmarkedChapterIDs.insert(id) }
        UserDefaults.standard.set(Array(bookmarkedChapterIDs), forKey: bookmarksKey)
    }

    func isBookmarked(_ id: String) -> Bool { bookmarkedChapterIDs.contains(id) }

    func saveChild() {
        if let data = try? JSONEncoder().encode(child) {
            UserDefaults.standard.set(data, forKey: childKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: childKey),
           let value = try? JSONDecoder().decode(ChildProfile.self, from: data) { child = value }
        if let ids = UserDefaults.standard.array(forKey: bookmarksKey) as? [String] {
            bookmarkedChapterIDs = Set(ids)
        }
    }
}

