//
//  AvatarDownloader.swift
//  Interview
//
//  Created by Pavlo Dvorovenko on 04/03/2025.
//

import SwiftUI

class AvatarDownloader: ObservableObject {
    
    private struct Constants {
        static let endPoint = "https://avatars.githubusercontent.com/u/"
        
        static func userInfoEndPoint(user: String) -> String {
            "https://api.github.com/users/\(user)"
        }
    }
    
    @Published var image: UIImage?
    @Published var errorMessage: String?
    
    func downloadAvatar(id: Int) {
        guard let imageUrl = URL(string: Constants.endPoint + "/" + String(id) + "?v=4") else {
            return
        }
        
        let request = URLRequest(url: imageUrl)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                self.errorMessage = error.localizedDescription
            } else if let data = data, let image = UIImage(data: data) {
                self.image = image
            }
        }
        dataTask.resume()
    }
}
