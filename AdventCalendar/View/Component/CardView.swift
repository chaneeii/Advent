//
//  CardView.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/04/30.
//

import SwiftUI

struct CardView: View {
    
    @State var isFront: Bool = true // 앞면: true, 뒷면: false
    @Binding var showMessageSheet: Bool // 메세지 작성시트를 띄울지 결정하는 변수
    @Binding var currentIndex: Int // 캐러셀에서 현재 선택된 인덱스
    @State var idxDate = Date.now.dateToString()
    @EnvironmentObject var modelData: ModelData
    var gift: Gift
    
    var xmas = "2022.12.25 00:00:00".stringToDate()  // TODO: 크리스마스 당일을 설정하는 변수

    var body: some View {
        
        VStack{
            // 1. 미래
            if Date().dateCompare(fromDate: "2022.12.\(String(format: "%02d", currentIndex+1)) 00:00:00".stringToDate()!) == "Future"
            {
                
                ZStack{
                    GaussianCircle() // 가우시안에서 리스 이미지로 전환
                    Text("12월 \(currentIndex+1)일부터\n선물을 열수있어요")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                                        
            }
            // 2. 크리스마스
            else if xmas!.dateCompare(fromDate: "2022.12.\(String(format: "%02d", currentIndex+1)) 00:00:00".stringToDate()!) == "Same"{
        
                xmasSide
                
            }
            // 3. 과거-현재
            else{

                LazyHStack {
                    TabView {
                        ForEach(0..<2) { i in
                            
                            /** 카드 앞면 **/
                            if i == 0 {
                                frontSide
                            }
                            /** 카드 뒷면 **/
                            else{
                                backSide
                            }
                        }
                        .padding(.all, 10)
                    }
                    .frame(width : getRect().width - 100, height: 400)
                    .tabViewStyle(PageTabViewStyle())
                    
                }

            }
            
        }
        
        
    }
    
    
    var frontSide: some View {
        /** FRONT **/
        ZStack{

            Color(hex: "#42A266" )

            VStack{
                
                HStack{
                    // 사슴아이콘
                    Image("deer1")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                }
                .frame(height: 69)

                Text(gift.comment)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.horizontal,16)
                    .multilineTextAlignment(.center)
                
                VStack{
                    
                    if gift.image != "" {
                        Image(gift.image)
                            .resizable()
                            .frame(width: 125, height: 125)
                    }
                    
                    Text(gift.title)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5)
                    
                    Text(gift.description)
                        .font(.caption)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(16)
                Spacer(minLength: 0)

            }

        }
        .cornerRadius(32)
    }
    
    
    var backSide: some View {
        /** BACK **/
        VStack{
            ZStack{
                Color(hex: "#42A266")
                // 사슴아이콘
                Image("deer1")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)

            }
            .frame(height: 69)
            Spacer()

            Text(gift.hint)
                .foregroundColor(Color.gray40)
                .fontWeight(.bold)
                .padding(.horizontal,16)
                .multilineTextAlignment(.center)

            Spacer()
            
            
            Button(action: {
                showMessageSheet.self.toggle()
            }) {
                
                HStack{
                    Text(DB_Manager().findPost(dayValue: String(self.currentIndex+1)) == 1 ? "작성완료": "작성하기")
                }
                .padding()
                .frame(width: 140)
                .foregroundColor(.white)
                .background( DB_Manager().findPost(dayValue: String(self.currentIndex+1)) == 1 ? Color.gray: Color.adventGreen )
                .clipShape(Capsule())
                .padding(.bottom, 55)
                
            }
            .disabled(DB_Manager().findPost(dayValue: String(self.currentIndex+1)) == 1 ? true : false)
            
            

        }
        .background(.white)
        .cornerRadius(32)
    }
    
    var xmasSide: some View {
        VStack{
            Text("🌟MERRY CHRISTMAS🌟")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text("산타가 되어 선물을 전달해보세요!")
                .foregroundColor(.white)
            
            LottieView(filename: "santa_lottie")
               .frame(width: 200, height: 200)
        }
    }
    
    
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(index: 2)
//    }
//}
