//
//  NewsFeedViewModel.swift
//  AssignmentUI
//
//  Created by Shivangi on 13/03/22.
//

import Foundation

class NewsFeedListViewModel: ObservableObject {
    
    @Published var newsFeeds: [NewsFeedViewModel]?
    var apiService: APIService = APIService()

    init() {
        self.requestToGetNewsFeed()
    }
    
    // API request
    func requestToGetNewsFeed() {
        self.apiService.fetchRssFeed { [weak self] newsFeeds in
            DispatchQueue.main.async {
                if let newsFeeds = newsFeeds {
                    // Update object and refresh list
                    self?.newsFeeds = newsFeeds.map({NewsFeedViewModel.init(newsFeedItem: $0)})
                }
            }
        }
    }
}

class NewsFeedViewModel: Identifiable {
    
    var id = UUID()
    var newsFeedItem: NewsFeedItem
    
    init(newsFeedItem: NewsFeedItem) {
        self.newsFeedItem = newsFeedItem
    }
    
    var title: String {
        return newsFeedItem.title ?? ""
    }
    
    var thumbnail: String {
        return newsFeedItem.thumbnail ?? ""
    }
    
    var link: String {
        return newsFeedItem.enclosure?.link ?? ""
    }
    
    var date: String {
        return newsFeedItem.pubDate?.convertStringDateFormat(formatFrom: DateFormat.yyyyMdHHms, formatTo: DateFormat.mmmdyyyy) ?? ""
    }
    
    var time: String {
        return newsFeedItem.pubDate?.convertStringDateFormat(formatFrom: DateFormat.yyyyMdHHms, formatTo: DateFormat.hhmma) ?? ""
    }
}
