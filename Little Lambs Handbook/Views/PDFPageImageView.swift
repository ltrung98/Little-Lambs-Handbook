//
//  PDFPageImageView.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import SwiftUI
import PDFKit

struct PDFPageImageView: View {

    let pageNumber: Int

    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                    .shadow(
                        color: .black.opacity(0.12),
                        radius: 8,
                        y: 4
                    )
            } else {
                ProgressView()
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 300
                    )
            }
        }
        .task {
            loadPDFPage()
        }
    }

    private func loadPDFPage() {

        guard let url = Bundle.main.url(
            forResource: "PASSPORT2",
            withExtension: "pdf"
        ) else {
            print("❌ PASSPORT.pdf not found")
            return
        }

        guard let document = PDFDocument(url: url) else {
            print("❌ Cannot open PASSPORT2.pdf")
            return
        }

        // PDFKit uses zero-based page index.
        let index = pageNumber - 1

        guard index >= 0,
              index < document.pageCount,
              let page = document.page(at: index) else {
            print("❌ Invalid PDF page: \(pageNumber)")
            return
        }

        let pageRect = page.bounds(
            for: .mediaBox
        )

        let targetWidth: CGFloat = 1200

        let scale =
            targetWidth / pageRect.width

        let targetSize = CGSize(
            width: targetWidth,
            height: pageRect.height * scale
        )

        image = page.thumbnail(
            of: targetSize,
            for: .mediaBox
        )
    }
}
