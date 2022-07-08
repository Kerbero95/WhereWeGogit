//
//  InitialView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 07/07/22.
//

import SwiftUI

struct InitialView: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    var body: some View {
        Button(action : {
            mpcManager.startService()
        }, label : {
            Image(systemName: "appletv")
                .font(.system(size: 80))
                .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
        })
        .frame(width: bounds.width * 0.2, height: bounds.height * 0.1)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
