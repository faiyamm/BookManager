//
//  BookDetailView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    if !book.cover.isEmpty {
                        Image(book.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 200)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.largeTitle)
                            .bold()

                        Text(book.author)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .padding(.top, 10)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                }
                
                Divider().padding(.vertical)
                
                Text(book.details)
                    .font(.body)
            }
            .padding(20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: { showEditSheet.toggle() }) {
                    Image(systemName: "pencil")
                }
            }
        }
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: $book)
        }
    }
}

#Preview {
    BookDetailView(book: .constant(Book(
        title: "Cras vehicula et leo non fermentum.",
        author: "Author Name",
        details: "Sed rutrum porta massa. Ut sed lorem elementum, aliquam lectus quis, aliquet velit. Cras libero sem, fermentum sed feugiat sit amet, euismod gravida libero. Aenean cursus egestas nunc et placerat. Mauris maximus dui lectus, vitae rutrum metus fringilla et. Sed mollis, nibh non iaculis fringilla, turpis dolor varius tortor, ac ullamcorper dolor justo sed arcu. Vivamus in dui pulvinar, pellentesque mi non, posuere nisl. Cras id orci ex. Integer neque nunc, condimentum eu tristique eget, dapibus quis mauris. Phasellus nec quam non est euismod laoreet non sed lorem.",
        cover: "lotr_fellowship",
        year: 2018,
        series: "LOTR"
    )))
}
