//
//  ContentView.swift
//  AssignmentUI
//
//  Created by Shivangi on 13/03/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var newsFeedVM: NewsFeedListViewModel = NewsFeedListViewModel()
    
    var body: some View {
        
        // Navigation view
        NavigationView {
            
            // List
            NewsListView(newsFeeds: newsFeedVM.newsFeeds ?? [])
                .ignoresSafeArea(.container, edges: .bottom)

            // Title
            .navigationTitle(Text("GeeksForGeeks"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
