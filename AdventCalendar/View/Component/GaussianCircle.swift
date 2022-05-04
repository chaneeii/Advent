//
//  GaussianCircle.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/01.
//

import SwiftUI

struct GaussianCircle: View {
    var body: some View {

        /*
        Circle()
            .fill(Color.white)
//            .fill(Color.adventRed)
            .frame(width: 200, height: 200)
            .blur(radius: 80)
         */
        
        Image("wreath")
            .resizable()
            .frame(width: 330, height: 330)
        
    }
}

struct GaussianCircle_Previews: PreviewProvider {
    static var previews: some View {
        GaussianCircle()
    }
}
