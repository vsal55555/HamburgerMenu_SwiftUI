//
//  ContentView.swift
//  HamburgerMenu_SwiftUI
//
//  Created by BSAL-MAC on 8/21/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    var body: some View {
        ZStack {
            Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0)                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                    }).padding(.leading, 15)
                    Spacer()
                }.padding(.all, 10)
                Spacer()
                Image("mine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Bishal Shrestha")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Divider()
                
                InfoView(text: "+977 980 408 8782", imageName: "phone.fill")  //extract subclass
                InfoView(text: "okbsal@gmail.com", imageName: "envelope.fill")
                
                Spacer()
            }.padding(.all, 10)
            
            HStack {
                VStack(spacing: 20) {
                    Image("female")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(Circle())
                        .padding(.top, 90)
            /*
                    Text("Bishal Shrestha")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroungColor(.)
                    Text("Kathmandu")
                        .font(.title)
                        .fontWeight(.semibold)
              */
                    Form{
                            Section(header:Text("Call")){
                                HStack {
                                    Image(systemName: "phone.circle.fill")
                                        .foregroundColor(Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0));                                Text("9804088782")
                                }
                            }
                        Section(header:Text("Email")){
                            HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0));                               Text("okbsal@outlook.com")
                            }
                        }
                        Section(header:Text("Let's Chat")){
                            HStack {
                            Image(systemName: "text.bubble.fill")
                                .foregroundColor(Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0));                               Text("Click to Whatsapp")
                            }
                        }
                        Section(header:Text("Save Contact")){
                            HStack {
                            Image(systemName: "arrow.down.doc.fill")
                                .foregroundColor(Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0));                               Text("Save to PhoneBook")
                            }
                        }
                    }//.padding(.leading, 20)
                }.frame(width: UIScreen.main.bounds.width / 1.5)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                Spacer()
            }
            .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width / 1.5)
                .background(Color.black.opacity(showMenu ? 0.2 : 0))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        self.showMenu.toggle()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//extract subclass
struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(Color(red: 1.00, green: 0.42, blue: 0.42, opacity: 1.0))
                Text(text)
                }
        ).padding(.all)
    }
}
