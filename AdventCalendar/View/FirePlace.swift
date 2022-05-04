//
//  FirePlace.swift
//  AdventCalendar
//  => 선물 모아보는 페이지
//  Created by Chanhee Jeong on 2022/05/01.
//

import SwiftUI

struct FirePlace: View {
    
    @State var postcardModels: [PostCard] = []
    @Binding var isShow: Bool 
    @State var curDay: String = ""
    @State var curName: String = ""
    @State var curContent: String = ""
    
    let columns: [GridItem] = [
           GridItem(.flexible(), spacing: nil, alignment: nil),
           GridItem(.flexible(), spacing: nil, alignment: nil),
           GridItem(.flexible(), spacing: nil, alignment: nil)
       ]
    
    var body: some View {
        
        ZStack{
            
            NavigationView{
                ZStack(alignment: .top){
                    
                    // BACKGOURND COLOR
                    Color(hex: "#2E3354")
                    
                    VStack(alignment: .center){
                        
                        Text("선물모음")
                            .foregroundColor(.white)
                            .font(.title2.bold())
                            .padding(.bottom, 10)
                        
                        Text("12월 25일 0시 0분부터 선물을 공유할 수 있어요")
                            .foregroundColor(.white)
                            .font(.body.bold())
                        
                        // 선물그리드 - VGRID
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(
                                columns: columns,
                                alignment: .center,
                                spacing: nil,
                                pinnedViews: [],
                                content: {
                                    
                                    ForEach(self.postcardModels) { (model) in
                                        
                                        Button(action: {
                                          
                                            curDay = model.day
                                            curName = model.name
                                            curContent = model.content
                                            
                                            // 각 선물페이지
                                            self.isShow.toggle()
                                            
                                        }) {
                                            VStack{
                                                Text(model.name)
                                                    .foregroundColor(.white)
                                                Image("gift\(model.day)")
                                                    .resizable()
                                                    .frame(height: 100)
                                            }
                                            .padding()
                                        }
                                        
                                        
                                    }// FOR EACH

                                    
                                })
                        }
                        .padding()
                        
                    }
                    .padding(.top, 120)

                }// Z
                .navigationBarHidden(true)
                .background(Color.adventNavy)
                .ignoresSafeArea()

            }// Navi
            .onAppear( perform: {
                self.postcardModels =
                DB_Manager().getPostcards()
            })
            
            // 공유하기용 MODAL
            if isShow {
                /** TODO : 나중에는 25일 0시 이후로 공유되도록 수정하기! **/
                MessageModal(isSharedVersion: true, show: $isShow, name: $curName, content: $curContent, day: curDay)
            }
            
        }

    }
}

//struct FirePlace_Previews: PreviewProvider {
//    static var previews: some View {
//        FirePlace()
//    }
//}
//
