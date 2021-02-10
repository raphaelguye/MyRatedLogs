//
//  LogsListView.swift
//  MyRatedLogs
//
//  Created by Guye Raphael, I233 on 10.02.21.
//

import SwiftUI

struct LogsListView: View {
    
    @ObservedObject var viewModel: LogsListViewModel
    
    init(viewModel: LogsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("My Rated logs")
        }
        .onAppear(perform: {
            viewModel.viewOnAppear()
        })
    }
    
    var content: some View {
        return Form {
            Section {
                if viewModel.logs.isEmpty {
                    Text("No logs")
                } else {
                    Text("There is logs to be displayed...")
                }
            }
        }
    }
}

struct LogsListView_Previews: PreviewProvider {
    static var previews: some View {
        LogsListView(
            viewModel: LogsListViewModel(
                logService: LogService()
            )
        )
    }
}