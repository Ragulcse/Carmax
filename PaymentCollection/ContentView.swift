//
//  ContentView.swift
//  PaymentCollection
//
//  Created by Ragul on 21/04/20.
//  Copyright © 2020 Photon. All rights reserved.
//

import SwiftUI

enum ModeOfPay:String {
    case Online
    case Auto
    case Other
    
}

struct PaymentData:Identifiable {
    var id: Int
    let payment: Float?
    let date: Date?
    let mop: ModeOfPay
}

struct ContentView: View {
    
    var dataArray:[PaymentData] = [
        .init(id: 1, payment: 1500.0, date: Date(), mop: .Auto),
        .init(id: 2, payment: 1522.0, date: Date(), mop: .Online),
        .init(id: 3, payment: 9800.0, date: Date(), mop: .Other)
    ]
    
    var body: some View {
        // RecentPaymentCollection
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(dataArray, id:\.id) { pay in
                    RecentPaymentCell(post: pay)
                }
            }.padding(.horizontal, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
