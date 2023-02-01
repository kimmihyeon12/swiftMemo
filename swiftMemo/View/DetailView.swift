//
//  DetailView.swift
//  swiftMemo
//
//  Created by HoHocompany on 2023/02/01.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo : Memo
    // published 로 선언한 값 바뀔때마다 화면 update
    @EnvironmentObject var store : MemoStore
    
    @State private var showComposer = false
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate,style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showComposer){
            ComposeView(memo:memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(memo: Memo(content: "test"))
                .environmentObject(MemoStore())
        }
    }
}
