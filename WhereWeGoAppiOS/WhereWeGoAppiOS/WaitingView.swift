//
//  WaitingView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 07/07/22.
//

import SwiftUI

struct WaitingView: View {
    var bounds = UIScreen.main.bounds
    var body: some View {
        ZStack{
            Rectangle()
                 .frame(width: bounds.width, height: bounds.height)
                 .background(.green)
                 .foregroundColor(.green)
            
            Rectangle()
                .frame(width: bounds.width * 0.7, height: bounds.height * 0.3)
                .cornerRadius(40)
                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1))
            
            Text("Please wait...")
                .font(.system(size: 80.0, weight: .regular))
                .fontWeight(.regular)
           
        }
    }
}

struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}
