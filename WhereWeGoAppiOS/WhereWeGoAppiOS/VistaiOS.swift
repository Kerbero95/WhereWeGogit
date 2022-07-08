//
//  ContentView.swift
//  Quiz
//
//  Created by Stefano Leva on 03/07/22.
//

import SwiftUI

struct VistaiOS: View {
    var bounds = UIScreen.main.bounds


    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                let redButton = Button(action: {}){
                    Text("1")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                
                redButton.background(.red)
                
                let greenButton = Button(action: {}){
                    Text("2")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                greenButton.background(.green)
            }
            
            HStack(spacing:0){
                let blueButton = Button(action: {}){
                    Text("3")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                blueButton.background(.blue)
                
                let purpleButton = Button(action: {}){
                    Text("4")
                    .tint(.white)
                    .font(.system(size: 100.0, weight: .bold, design: .default))
                    .frame(width: bounds.size.width * 0.5, height: bounds.size.height * 0.5)
                }
                purpleButton.background(.purple)
            }
        }
    }
}

struct VistaiOS_Previews: PreviewProvider {
    static var previews: some View {
        VistaiOS()
    }
}
