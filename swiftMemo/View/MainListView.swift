//
//  MainListView.swift
//  swiftMemo
//
//  Created by HoHocompany on 2023/02/01.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                MemoCell(memo: memo)
                    
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

