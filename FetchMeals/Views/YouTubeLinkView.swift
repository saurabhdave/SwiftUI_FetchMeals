//
//  YouTubeLinkView.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import SwiftUI

struct YouTubeLinkView: View {
    
    // MARK: - PROPERTIES
    let linkName: String
    let youTubeLink: String
    
    // MARK: - BODY
    
    var body: some View {
        if linkName.isEmpty || youTubeLink.isEmpty {
            EmptyView()
        } else {
            GroupBox {
                HStack {
                    Image(systemName: "video.circle")
                    Text("YouTube")
                    Spacer()
                    
                    Group {
                        Image(systemName: "arrow.up.right.square")
                        Link(linkName, destination: URL(string: youTubeLink) ?? URL(string: "https://youtube.com")!)
                            .lineLimit(1)
                    }
                    .foregroundColor(.accentColor)
                }//: HSTACK
            }//: BOX
        }
    }
}

struct YouTubeLinkView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeLinkView(linkName: "Pan Cake", youTubeLink: "https://www.youtube.com/watch?v=YMmgKCNcqwI")
    }
}
