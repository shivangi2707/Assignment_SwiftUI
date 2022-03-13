//
//  RegularArticleView.swift
//  AssignmentUI
//
//  Created by Shivangi on 13/03/22.
//

import SwiftUI

struct RegularArticleView: View {
    
    var newsFeed: NewsFeedViewModel?
    
    init(newsFeed: NewsFeedViewModel?) {
        self.newsFeed = newsFeed
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                // Title
                Text(newsFeed?.title ?? "")
                    .font(Font.system(size: 17))
                    .foregroundColor(Color(red: 103/255, green: 128/255, blue: 103/255))
                    .lineLimit(3)
                    .lineSpacing(1)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                
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
            }
            .padding(EdgeInsets(top: 14.0, leading: 14.0, bottom: 11.0, trailing: 5))
            
            Spacer()
            
            // Image
            URLImage(url: newsFeed?.thumbnail ?? "")
                .frame(width: 120, height: 126)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .cornerRadius(26.0)
    }
}

struct RegularArticleView_Previews: PreviewProvider {
    static var previews: some View {
        RegularArticleView(newsFeed: NewsFeedViewModel(newsFeedItem: NewsFeedItem()))
            .previewLayout(.sizeThatFits)
            
    }
}
