//
//  ContactView.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Little Lambs Preschool") {
                    ContactRow(title: "Cơ sở 1", detail: "Số 1, đường số 5B, KDC Vĩnh Lộc, P. Bình Tân, TP.HCM", icon: "mappin.and.ellipse")
                    ContactRow(title: "Cơ sở 2", detail: "Số 9, đường số 6A, KDC Vĩnh Lộc, P. Bình Tân, TP.HCM", icon: "mappin.and.ellipse")
                }
                Section("Liên hệ") {
                    Link(destination: URL(string: "https://www.littlelambs.edu.vn")!) { Label("Website", systemImage: "globe") }
                    Link(destination: URL(string: "mailto:admin@littlelambs.edu.vn")!) { Label("admin@littlelambs.edu.vn", systemImage: "envelope.fill") }
                    Link(destination: URL(string: "tel://0906996147")!) { Label("0906 996 147", systemImage: "phone.fill") }
                    Link(destination: URL(string: "tel://0903081409")!) { Label("0903 081 409", systemImage: "phone.fill") }
                }
                Section("Social") {
                    Link("TikTok @little.lambs.pres", destination: URL(string: "https://www.tiktok.com/@little.lambs.pres")!)
                }
            }
            .navigationTitle("Contact")
        }
    }
}

struct ContactRow: View {
    let title: String; let detail: String; let icon: String
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon).foregroundStyle(LLPTheme.blue)
            VStack(alignment: .leading, spacing: 4) { Text(title).font(.headline); Text(detail).font(.subheadline).foregroundStyle(.secondary) }
        }.padding(.vertical, 4)
    }
}

