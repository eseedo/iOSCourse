//
//  ContentView.swift
//  BullsEye
//
//  Created by cylonspace on 2020/1/22.
//  Copyright © 2020 happybubsy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("2020年面对困难不要害怕，武汉加油！")
                .fontWeight(.black)
                .foregroundColor(.red)
            Button(action:
                {
                    print("这辈子都没见过这样的要求~")
            }) {
                Text("过来打我啊")
            }
   
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
