//
//  MyChildView.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 2/10/26.
//
import SwiftUI

struct MyChildView: View {
    @Bindable var store: ParentPassportStore

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("MY CHILD").font(.caption.bold()).foregroundStyle(LLPTheme.orange)
                        Text(store.child.fullName.isEmpty ? "Thông tin của bé" : store.child.fullName).font(.title2.bold())
                    }.padding(.vertical, 7)
                }
                Section("Thông tin của bé") {
                    TextField("Họ và tên", text: $store.child.fullName)
                    TextField("Tên gọi ở nhà", text: $store.child.nickname)
                    TextField("Ngày sinh", text: $store.child.dateOfBirth)
                    TextField("Lớp", text: $store.child.className)
                    TextField("Cơ sở", text: $store.child.campus)
                }
                Section("Thông tin phụ huynh") {
                    TextField("Tên phụ huynh", text: $store.child.parentName)
                    TextField("Số điện thoại", text: $store.child.parentPhone).keyboardType(.phonePad)
                }
                Section("Thông tin cần lưu ý") {
                    TextField("Dị ứng / chế độ ăn đặc biệt", text: $store.child.allergy, axis: .vertical)
                    TextField("Ghi chú khác", text: $store.child.specialNotes, axis: .vertical)
                }
                Button { store.saveChild() } label: { Label("Lưu thông tin", systemImage: "checkmark.circle.fill") }
            }
            .navigationTitle("My Child")
        }
    }
}

