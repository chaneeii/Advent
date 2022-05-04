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
    @State var isSearching = false
    @State var showMessageSheet = false
    @State var name: String = ""
    @State var content: String = ""
    @State var msgCompletedAlert: Bool = false
    @State var isShow: Bool = false // 선물하기 공유용 모달
    
    
    var body: some View {

        NavigationView{
            ZStack {
                ZStack{
                   
                    /** 하단 눈 모양 **/
                    SnowLand()
                    
                    /* TODO : TAB-VIEW 로 전환 (양방향 바인딩 필요)
                    
        //             Background Tab View
                    TabView(selection: $currentIndex) {
 
                        ForEach(gifts.indices , id: \.self){ index in

                            VStack{
                                // 시작전
                                if index == 0 {

                                    // 가우시안
                                    ZStack{
                                        GaussianCircle()
                                        Text("12월 01일부터\n하루에 한번 선물을 열수있어요")
                                            .fontWeight(.bold)
                                            .foregroundColor(.adventNavy)
                                            .multilineTextAlignment(.center)
                                    }
//                                    .simultaneousGesture(DragGesture())

                                }
                                // 25일
                                else if index == 25{
                                    Text("25번째")
//                                        .simultaneousGesture(DragGesture())
                                }
                                else{
//                                    CardView(showMessageSheet: $showMessageSheet, currentIndex: $currentIndex, showModal: $showModal)
                                    
                                    CardView(showMessageSheet: $showMessageSheet, currentIndex: $currentIndex, gift: gifts[currentIndex])
//                                        .simultaneousGesture(DragGesture())
                                }
                            }
                            .padding(.bottom, 200)
                            .gesture(isSearching ? DragGesture() : nil)
//                            .simultaneousGesture(DragGesture())

                        }
                    }
//                    .disabled(true)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                    .simultaneousGesture(DragGesture())
                    .frame(alignment: .center)
                    .animation(.easeInOut, value: currentIndex)
                    
                    */
                    

                    /** CARD VIEW **/
                    CardView(showMessageSheet: $showMessageSheet, currentIndex: $currentIndex, gift: gifts[currentIndex])
                        .padding(.bottom, 150)
                    
                    
                    /** DATE SNAPCAROUSEL **/
                    SnapCarousel(spacing: -50, trailingSpace: getRect().height < 750 ? 200 : 200, index: $currentIndex, items: gifts){
                        gift in

                        DateView(day: gift.day)
                        
                    }
                    .offset(y: getRect().height / 1.45 ) //숫자 띄우는 높이
                    
                    
                } // ZSTACK
                .background(Color.adventNavy)
                .navigationBarHidden(true) // 네비게이션 위쪽 바 영역 제거
                .sheet(isPresented: $showMessageSheet){
                    MessageSheet(showMessageSheet: self.$showMessageSheet,
                                 day: self.$currentIndex,
                                 name: self.$name,
                                 content: self.$content,
                                 showModal: self.$msgCompletedAlert,
                                 gift: gifts[currentIndex] )
                }
                
                /** 상단바 영역**/
                VStack{
                    HStack{
                        // APP TITLE
                        Text("advent.")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()

                        // GIFT (FIRE-PLACE)
                        NavigationLink(destination: FirePlace(isShow: $isShow).navigationBarBackButtonHidden(isShow ? true : false)) {
                            Image(systemName: "gift")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .navigationBarTitle("뒤로가기")
                        
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 30)
                    Spacer()
                }
             
                /** ALERT MODAL - 메세지 작성이완료되었을때 모달창 **/
                if msgCompletedAlert {
                    MessageModal(show: $msgCompletedAlert, name: $name, content: $content)
                }
                
            }
            
        }
        .accentColor(.white)
        .ignoresSafeArea()
        
    } // BODY
    
    
    
    @ViewBuilder
    func DateView(day: Int) -> some View {
        
        VStack(spacing: 10){
            //숫자뷰
            GeometryReader{ proxy in
                
                HStack{
                    
                    if(day==0){
                        Image("snowman")
                            .resizable()
                            .frame(width: 100, height: 120)
                            .padding(.top, 65)
                    }else{
                        Text("\(day)")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }

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
