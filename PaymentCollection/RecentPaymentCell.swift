//
//  RecentPaymentCell.swift
//  PaymentCollection
//
//  Created by Ragul on 21/04/20.
//  Copyright © 2020 Photon. All rights reserved.
//

import SwiftUI

struct RecentPaymentCell: View {
    ///Calling Model
    let post: PaymentData
    /// Date format styles April 28,2020
    static let dateFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,YYYY"
        return formatter
    }()
    /// Fills the shape with a color or stoke with a color
    var hasmop: Bool { post.mop == .Auto}
    /// cell View
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8.0){
            Text("$\(post.payment?.description ?? "0")")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
            Text("\(RecentPaymentCell.dateFormate.string(from: post.date ?? Date()))")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
            HStack(spacing: 5.0){
                if(hasmop)
                {
                    Circle()
                    .fill(Color.gray)
                    .frame(width: 20, height: 20)
                }
                else
                {
                    Circle()
                    .stroke(Color.gray)
                    .frame(width: 20, height: 20)
                }
                
                Text("\(post.mop.rawValue)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

struct RecentPaymentCell_Previews: PreviewProvider {
    static var previews: some View {
        RecentPaymentCell(post: PaymentData(id: 0, payment: 1500.0, date: Date(), mop: .Other))
    }
}
