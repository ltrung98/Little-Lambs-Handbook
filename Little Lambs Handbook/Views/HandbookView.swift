//
//  HandbookView.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import SwiftUI

struct HandbookView: View {
    @Bindable var store: ParentPassportStore

    private var filtered: [HandbookChapter] {
        let q = store.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return HandbookData.chapters }
        return HandbookData.chapters.filter { c in
            c.title.localizedCaseInsensitiveContains(q) || c.subtitle.localizedCaseInsensitiveContains(q) ||
            c.items.contains { $0.title.localizedCaseInsensitiveContains(q) || $0.body.localizedCaseInsensitiveContains(q) }
        }
    }

    var body: some View {
        NavigationStack {
            List(filtered) { chapter in
                NavigationLink { ChapterDetailView(store: store, chapter: chapter) } label: {
                    HStack(spacing: 13) {
                        VStack(spacing: 2) {
                            Text(chapter.number).font(.headline)
                            Image(systemName: chapter.icon).font(.caption)
                        }
                        .foregroundStyle(chapter.accentColor)
                        .frame(width: 52, height: 52)
                        .background(chapter.accentColor.opacity(0.10))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        VStack(alignment: .leading, spacing: 4) {
                            Text(chapter.title).font(.headline)
                            Text(chapter.subtitle).font(.caption).foregroundStyle(.secondary)
                        }
                        Spacer()
                        if store.isBookmarked(chapter.id) { Image(systemName: "bookmark.fill").foregroundStyle(LLPTheme.orange) }
                    }
                    .padding(.vertical, 6)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("LLP Handbook")
            .searchable(text: $store.searchText, prompt: "Tìm trong Parent Passport")
        }
    }
}

struct ChapterDetailView: View {
    @Bindable var store: ParentPassportStore
    let chapter: HandbookChapter

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                // MARK: - Header

                VStack(alignment: .leading, spacing: 8) {

                    Text("\(chapter.number). \(chapter.title)")
                        .font(.title2.bold())

                    Text(chapter.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal)


                // MARK: - HÌNH ẢNH TỪ PDF

                ForEach(chapter.pdfPages, id: \.self) { page in

                    PDFPageImageView(
                        pageNumber: page
                    )
                    .padding(.horizontal)
                }


                // MARK: - Nội dung Chapter

                ForEach(chapter.items) { item in

                    VStack(alignment: .leading, spacing: 10) {

                        Text(item.title)
                            .font(.headline)

                        Text(item.body)
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding()
                    .background(
                        Color(.secondarySystemBackground)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
                    )
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle(chapter.number)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookmarksView: View {
    @Bindable var store: ParentPassportStore
    private var saved: [HandbookChapter] { HandbookData.chapters.filter { store.bookmarkedChapterIDs.contains($0.id) } }

    var body: some View {
        NavigationStack {
            if saved.isEmpty {
                ContentUnavailableView("Chưa có nội dung đã lưu", systemImage: "bookmark", description: Text("Mở một chương và bấm bookmark để lưu."))
            } else {
                List(saved) { chapter in
                    NavigationLink { ChapterDetailView(store: store, chapter: chapter) } label: {
                        HStack {
                            Image(systemName: chapter.icon).foregroundStyle(chapter.accentColor)
                            VStack(alignment: .leading) {
                                Text("\(chapter.number). \(chapter.title)").font(.headline)
                                Text(chapter.subtitle).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Saved")
    }
}

