//
//  URLImage.swift
//  GridSwiftUI
//
//  Created by Mohammad Azam on 6/13/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    @ObservedObject private var imageLoader: ImageLoader = ImageLoader()
    
    init(url: String) {
        self.url = url
        self.imageLoader.getData(from: url)
    }
    
    var body: some View {
        if let imageData = self.imageLoader.downloadedData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img!)
                    .resizable()
            }
        } else {
            return VStack {
                Image("gfg").resizable()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
