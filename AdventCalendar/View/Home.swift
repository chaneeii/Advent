//
//  Home.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/04/29.
//

import SwiftUI

struct Home: View {
    
    // Current Index
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                
                // LOGO
                VStack{
                    HStack{
                         Text("advent.")
                             .fontWeight(.bold)
                             .font(.title)
                             .foregroundColor(.white)
                             .padding(.leading, 30)
                             .padding(.vertical, 16)
                        Spacer()
                   }
                   Spacer()
                }
                
                
                
                // Background Tab View
                TabView(selection: $currentIndex) {
                    
                    ForEach(gifts.indices, id: \.self){ index in
                        
                        GeometryReader{ proxy in
                            
                            //                            Image(gifts[index].postImage)
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fill)
                            //                                .frame(width: proxy.size.width, height: proxy.size.height)
                            //                                .cornerRadius(1)
                            
                        }
                        .ignoresSafeArea()
                        .offset(y: -100)
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentIndex)
                .ignoresSafeArea()
                
                
                
                //Snow Land
                SnowLand()
                
                
                // 날짜테스트용
                Text(getNowDateTime24())
                    .foregroundColor(.white)

                
                
                // Date SnapCarousel
                SnapCarousel(spacing: -50, trailingSpace: getRect().height < 750 ? 200 : 200, index: $currentIndex, items: gifts){
                    
                    gift in
                    
                    DateView(day: gift.day)
                    
                }
                .offset(y: getRect().height / 1.45 ) //숫자 띄우는 높이
                
                
                
                
            } // ZSTACK
            .background(Color.adventNavy)
            
        }
        
        
    } // BODY
    
    
    @ViewBuilder
    func DateView(day: Int) -> some View {
        
        VStack(spacing: 10){
            //숫자뷰
            GeometryReader{ proxy in
                
                HStack{
                    Text("\(day)")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor( .white) 
                    
                }
                .frame(width: proxy.size.width/2, height: proxy.size.height)
                
            }
            .frame(height: getRect().height / 10)
            .padding(.bottom, 50)
               
        }
    }

    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct SnowLand: View {
    
    var body: some View {
        
        ZStack{
            Color(.white)
            VStack(alignment: .trailing){
                Text("D-5")
            }
        }.clipShape(
            Circle().path(in: CGRect(x: -200 , y: 700, width: 800, height: 800))
        )
        .ignoresSafeArea()
        
    }
    
}


