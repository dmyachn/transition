//
//  ContentView.swift
//  transition
//
//  Created by Dmitiy Myachin on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isOpen = false
    var body: some View {
        ZStack{
            Spacer()
                .overlay(alignment: isOpen ? .center : .bottomTrailing) {
                    if isOpen{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                            .foregroundColor(.blue)
                            .matchedGeometryEffect(id: "Button", in: animation)
                            .frame(width: 350,height: 520)
                            .overlay(alignment: .topLeading) {
                                Button(action: {
                                    withAnimation{
                                        isOpen.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        Image(systemName: "arrow.down.right.topleft.rectangle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30)
                                        Text("Close")
                                            .frame(width: 70)
                                            .font(.title2)
                                            .bold()
                                    }
                                    .matchedGeometryEffect(id: "Title", in: animation)
                                    .padding()
                                    .foregroundStyle(.white)
                                })
                                .padding()
                            }
                    } else {
                        Button(action: {
                            withAnimation{
                                isOpen.toggle()
                            }
                        }, label: {
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                                .foregroundColor(.blue)
                                .matchedGeometryEffect(id: "Button", in: animation)
                                .frame(width: 120,height: 70)
                                .overlay(alignment: .center) {
                                    Text("Open")
                                        .foregroundStyle(.white)
                                        .font(.title2)
                                        .bold()
                                        .matchedGeometryEffect(id: "Title", in: animation)
                                }
                        })
                        .padding()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
