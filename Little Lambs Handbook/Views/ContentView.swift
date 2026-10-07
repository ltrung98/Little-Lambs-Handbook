//
//  ContentView.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 1/10/26.
//
import SwiftUI

struct ContentView: View {
    @Bindable var store: ParentPassportStore

    var body: some View {
        TabView {
            HomeView(store: store).tabItem { Label("Home", systemImage: "house.fill") }
            MyChildView(store: store).tabItem { Label("My Child", systemImage: "figure.and.child.holdinghands") }
            HandbookView(store: store).tabItem { Label("Handbook", systemImage: "book.closed.fill") }
            BookmarksView(store: store).tabItem { Label("Saved", systemImage: "bookmark.fill") }
            ContactView().tabItem { Label("Contact", systemImage: "phone.fill") }
        }
        .tint(LLPTheme.blue)
    }
}

struct HomeView: View {
    @Bindable var store: ParentPassportStore

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("MẦM NON CHÚ CỪU NHỎ").font(.caption.bold())
                        Text("Parent Passport").font(.largeTitle.bold())
                        Text("Your guide to the Little Lambs journey")
                            .font(.subheadline).opacity(0.9)
                        HStack {
                            Rectangle().frame(height: 4).foregroundStyle(LLPTheme.orange)
                            Rectangle().frame(height: 4).foregroundStyle(.white.opacity(0.75))
                        }.clipShape(Capsule())
                    }
                    .foregroundStyle(.white)
                    .padding(22)
                    .background(LinearGradient(colors: [LLPTheme.blue, LLPTheme.darkBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 24))

                    Text("Quick Access").font(.title3.bold())
                    HStack(spacing: 12) {
                        QuickCard(title: "My Child", icon: "figure.and.child.holdinghands", color: LLPTheme.blue)
                        QuickCard(title: "Handbook", icon: "book.closed.fill", color: LLPTheme.orange)
                    }

                    NavigationLink { HandbookView(store: store) } label: {
                        InfoRow(icon: "book.pages.fill", title: "Parent Handbook", detail: "7 chapters for parents")
                    }.buttonStyle(.plain)
                    NavigationLink { BookmarksView(store: store) } label: {
                        InfoRow(icon: "bookmark.fill", title: "Saved", detail: "\(store.bookmarkedChapterIDs.count) saved chapters")
                    }.buttonStyle(.plain)

                    VStack(alignment: .leading, spacing: 7) {
                        Text("Little Lambs Preschool").font(.headline)
                        Text("Tin tưởng • Trao đổi • Phối hợp • Kiên nhẫn • Đồng hành")
                            .font(.subheadline).foregroundStyle(.secondary)
                    }
                    .padding().frame(maxWidth: .infinity, alignment: .leading)
                    .background(LLPTheme.lightOrange)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                .padding()
            }
            .navigationTitle("Parent Passport")
        }
    }
}

struct QuickCard: View {
    let title: String; let icon: String; let color: Color
    var body: some View {
        VStack(spacing: 9) {
            Image(systemName: icon).font(.title2).foregroundStyle(color)
            Text(title).font(.headline)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 20)
        .background(color.opacity(0.10)).clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct InfoRow: View {
    let icon: String; let title: String; let detail: String
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon).font(.title3).foregroundStyle(LLPTheme.blue)
                .frame(width: 46, height: 46).background(LLPTheme.lightBlue).clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 3) {
                Text(title).font(.headline)
                Text(detail).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer(); Image(systemName: "chevron.right").foregroundStyle(.secondary)
        }
        .padding().background(.background)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.gray.opacity(0.15)))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
