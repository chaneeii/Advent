//
//  Message.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/01.
//

import SwiftUI

struct MessageSheet: View {
    @Binding var showMessageSheet: Bool
    @Binding var day: Int // 작성일
    @Binding var name: String // 받는 사람
    @Binding var content: String // 편지 내용
    @Binding var showModal: Bool
    
    @EnvironmentObject var modelData: ModelData
    var gift: Gift
    

    
    var body: some View {
        NavigationView {
            
                VStack{

                        /** 받는 사람  :  name**/
                        HStack{
                            Text("받는사람")
                                .foregroundColor(.adventGreen)
                            TextField("이름을 입력해 주세요.", text: $name)
                                .textFieldStyle(.plain)
                        }
                        .padding(.horizontal, 5)
                        
                        Divider()
                    
                        /** 편지 내용  : content **/
                        ZStack{
                            // 추후 : 글자수제한
                            TextEditor(text: $content)
                                .textFieldStyle(.plain)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(10.0)
//                                .onChange(of: content) { value in
//                                    print("수정된 텍스트 = \(content) ")
//                                }
                            
                            if content == "" {
                                VStack{
                                    Text("< 오늘의 추천 주제 >")
                                        .lineSpacing(10.0)
                                        .foregroundColor(Color(UIColor.placeholderText))
                                        .padding(.bottom, 10)

                                    Text(gift.hint)
                                        .lineSpacing(10.0)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(UIColor.placeholderText))
                                }
                            }
                            
                        }
                        .frame(height: 300)

                        Spacer()

                }
                .padding()
                .navigationBarTitle(Text("오늘의 카드"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {

                    hideKeyboard()
                    self.showMessageSheet = false
                    
                    // SQLite 에 해당 포스트카드를 저장한다.
                    DB_Manager().addPost(dayValue: String(self.day+1), nameValue: self.name, contentValue: self.content)
                                        
                    
                    /** TODO :  작성이 완료된건지 확인하는 사용자를 위한 알림창 하나 더 추가하기**/
                    
                    // 작성 완료된 메세지 모달 확인창
                    withAnimation{
                        showModal.toggle()
                    }
                    
                }) {
                    Text("저장").bold().foregroundColor(.adventGreen)
                })
            
                .navigationBarItems(leading: Button(action: {
                    print("취소-닫기")
                    hideKeyboard()
                    self.showMessageSheet = false
                }) {
                    Text("취소").bold().foregroundColor(.gray)
                })
            
        }
    }
}

//struct MessageSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageSheet(showSheetView: true)
//    }
//}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
