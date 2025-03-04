//
//  ContentView.swift
//  Interview
//
//  Created by Pavlo Dvorovenko on 04/03/2025.
//

import SwiftUI

struct MainView: View {
    private let insets = EdgeInsets(top: 10.0, leading: 20.0, bottom: 10.0, trailing: 20.0)
    private let itemsInRow: CGFloat = 2
    private let dataSource = DataSource()
    private let avatarDownloader = AvatarDownloader()

    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: insets.leading), count: Int(itemsInRow))

        ScrollView {
            LazyVGrid(columns: columns, spacing: insets.leading) {
                ForEach(dataSource.persons, id: \.id) { person in
                    AvatarCell(person: person)
                        .onTapGesture { }
                }
            }
            .padding(insets)
        }
        .navigationTitle("Main View")
    }
}

struct AvatarCell: View {
    @StateObject private var downloader = AvatarDownloader()
    @State private var isActivityIndicatorAnimating = false

    var person: Person?

    var body: some View {
        VStack {
            if isActivityIndicatorAnimating {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 50, height: 50)
            }
            
            if let image = downloader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
            } else if let errorMessage = downloader.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            if let person = person {
                Text(person.login)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.top, 8)
            }
        }
        .onAppear {
            Task {
                await loadImage(for: person)
            }
        }
    }

    private func loadImage(for person: Person?) async {
        guard let person = person else { return }
        isActivityIndicatorAnimating = true
        downloader.downloadAvatar(id: person.id)
    }
}
