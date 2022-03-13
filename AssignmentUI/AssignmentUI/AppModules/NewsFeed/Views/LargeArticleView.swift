//
//  LargeArticleView.swift
//  AssignmentUI
//
//  Created by Shivangi on 13/03/22.
//

import SwiftUI

struct LargeArticleView: View {
    
    var newsFeed: NewsFeedViewModel?
    
    init(newsFeed: NewsFeedViewModel?) {
        self.newsFeed = newsFeed
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image
            URLImage(url: newsFeed?.link ?? "")
                .frame(maxWidth: .infinity, maxHeight: 226)
                .frame(height: 226)
            
            // Title
            Text(newsFeed?.title ?? "")
                .font(Font.system(size: 30.0).bold())
                .lineSpacing(1)
                .foregroundColor(Color(red: 103/255, green: 128/255, blue: 103/255))
                .padding(EdgeInsets(top: 24, leading: 16, bottom: 18, trailing: 10))
            
            // Separator Line
            Divider()
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 10))
                .background(Color(red: 219/255, green: 219/255, blue: 219/255))
                .frame(height: 1.0)
            
            HStack(spacing: 8.0) {
                // Date
                Text(newsFeed?.date ?? "")
                    .font(Font.system(size: 10))
                    .bold()
                    .foregroundColor(Color(red: 156/255, green: 156/255, blue: 156/255))
                
                // Time
                Text(newsFeed?.time ?? "")
                    .font(Font.system(size: 10))
                    .foregroundColor(Color(red: 156/255, green: 156/255, blue: 156/255))
            }
            .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 10))
        }
    }
}

struct LargeArticleView_Previews: PreviewProvider {
    static var previews: some View {
        LargeArticleView(newsFeed: NewsFeedViewModel(newsFeedItem: NewsFeedItem()))
            .previewLayout(.sizeThatFits)
    }
}
