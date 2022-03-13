//
//  NewsListView.swift
//  AssignmentUI
//
//  Created by Shivangi on 13/03/22.
//

import SwiftUI

struct NewsListView: View {
    
    var newsFeeds: [NewsFeedViewModel]?
    
    init(newsFeeds: [NewsFeedViewModel]) {
        self.newsFeeds = newsFeeds
    }
    
    var body: some View {
        if let newsFeeds = newsFeeds {
            ScrollView {
                ForEach(0..<newsFeeds.count, id: \.self) { index in
                    
                    // At 0 index, show Large article
                    if index == 0 {
                        LargeArticleView(newsFeed: newsFeeds[index])
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(26.0)
                            .padding([.bottom], 8)
                    }
                    // At other index, show regular article
                    else {
                        RegularArticleView(newsFeed: newsFeeds[index])
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(26.0)
                            .padding([.bottom], 8)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(newsFeeds: [])
    }
}
