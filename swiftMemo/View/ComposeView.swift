//
//  ComposeView.swift
//  swiftMemo
//
//  Created by HoHocompany on 2023/02/01.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) //content 바인딩 toA
                    .padding()
            }
            .navigationTitle("새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement:
                        .navigationBarLeading){
                            Button{
                                dismiss()
                            }label: {
                                Text("취소")
                            }
                        }
            }
            .toolbar{
                ToolbarItemGroup(placement:
                        .navigationBarTrailing){
                            Button{
                                store.insert(memo: content)
                                dismiss()
                            }label: {
                                Text("저장")
                            }
                        }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
