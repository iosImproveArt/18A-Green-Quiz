//
//  QuestionPickView.swift
//  Spirit Quiz
//
//  Created by Improve on 27.10.2024.
//

import SwiftUI

struct QuestionPickViewGQ: View {
    
    var ehngfjmr = "rfc3"
    var hbnegvcfjmk = 35
    func ghtrfjk() -> String {
        return "uhnefrijmko"
    }
    func rj4nufm() {
        print("gnmfr")
    }
    
    
    func ejufek() -> Int {
        print(2 + 3)
        return 2 + 3
    }
    var jrncfm = [352: "crfc"]
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("Choose a quiz mode")
                .withFont(size: 30.57, weight: .medium)
            
            NavigationLink {
                QuestionViewGQ(type: .oneP)
            } label: {
                Image("1p")
            }

            
            NavigationLink {
                QuestionViewGQ(type: .withC)
            } label: {
                Image("wc")
            }
            
            NavigationLink {
                QuestionViewGQ(type: .withF)
            } label: {
                Image("wf")
            }
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ContentViewGQ(showLoading: false, selectedTab: .quiz)
}
