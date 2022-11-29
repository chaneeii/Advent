//
//  MessageModal.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/01.
//

import SwiftUI


struct MessageModal: View {
    
    @State var isSharedVersion: Bool = false
    
    @Binding var show: Bool
    @Binding var name: String
    @Binding var content: String
    @State var day: String = ""
    
    @State private var item: ActivityItem?
//    @State var items: [Any] = []
//    @State var sheet = false
    
    
    var postcardView: some View {
        VStack{
            
            /** 상단 **/
            ZStack{
                Color(hex: "#42A266")
                
                Image("deer1")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                
            }
            .frame(height: 69)
            
            Spacer()
            
            VStack(alignment: .leading){
                Text("받는사람: \(name)")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 16)
                
                Divider()
                
                Text("\(content)")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.horizontal,16)
            
            
            Spacer()
            
        }
        .frame(width : getRect().width - 50, height: 500)
        .background(.white)
        .cornerRadius(32)
    }
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text(isSharedVersion ? "12월 \(day)일의 선물" : "오늘의 카드가 선물창고에 저장되었습니다")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.top, 50)
                .padding(.bottom, 30)
            
            postcardView
                .padding(.bottom, 30)
            
            
            /** 공유하기용 **/
            if isSharedVersion {
                
                HStack{
                    
                    Button(action: {
                        name = ""
                        content = ""
                        withAnimation{
                            show.toggle()
                        }
                    }) {
                        HStack{
                            Text("닫기")
                        }
                        .padding()
                        .frame(width: 140)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Capsule())
                    }
                    
                    Button(action: {
                        let image = postcardView.snapshot()
                        item = ActivityItem(items: image)
                    }) {
                        HStack{
                            Text("공유하기")
                        }
                        .padding()
                        .frame(width: 140)
                        .foregroundColor(.white)
                        .background(Color.adventGreen)
                        .clipShape(Capsule())
                    }
                    
                }
                .padding(.bottom, 20)
                
                
            }
            /** 작성확인용 **/
            else{
                
                Button("닫기") {
                    name = ""
                    content = ""
                    withAnimation{
                        show.toggle()
                    }
                }
                .padding()
                .frame(width: 140)
                .foregroundColor(.white)
                .background(Color.adventGreen)
                .clipShape(Capsule())
                .padding(.bottom, 20)
            }
            
            Spacer()
            
        }
        .frame(width: getRect().width)
        .ignoresSafeArea()
        .background(Color.black.opacity(0.8))
        .activitySheet($item)
        
        
    }
    
}


//struct MessageModal_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageModal(show: .constant(true))
//    }
//}
