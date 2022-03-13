//
//  ImageLoader.swift
//  GridSwiftUI
//
//  Created by Mohammad Azam on 6/13/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    // Fetches data from URL
    func getData(from urlString: String) {
        // Replacing occurences, as removingPercentEncoding was not working for the same
        let urlStr = urlString.replacingOccurrences(of: "amp;", with: "")
        guard let url = URL(string: urlStr) else {
            return
        }
        
        // Fetches data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                DispatchQueue.main.async {
                    self.downloadedData = data
                }
                return
            }
            return
        }.resume()
    }
    
}
