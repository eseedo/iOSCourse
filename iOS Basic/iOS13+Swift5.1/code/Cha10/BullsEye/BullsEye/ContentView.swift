//
//  ContentView.swift
//  BullsEye
//
//  Created by cylonspace on 2020/1/22.
//  Copyright © 2020 happybubsy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false //设置初始状态
    
    var body: some View {
        VStack {
            Text("2020年面对困难不要害怕，武汉加油！")
                .fontWeight(.black)
                .foregroundColor(.red)
            Button(action:
                {
                    print("这辈子都没见过这样的要求~")
                    self.alertIsVisible = true //更改状态
            }) {
                Text("过来打我啊")
            }
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("你好"),
                      message: Text("这样的要求不算奇怪"),
                      dismissButton: .default(Text("太棒了！")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
