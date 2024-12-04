//
//  QuestionView.swift
//  Spirit Quiz
//
//  Created by Improve on 27.10.2024.
//

import SwiftUI

struct QuestionViewGQ: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: QuestionViewModelGQ
    
    var ehngfjmr = "rfc3"
    var hbnegvcfjmk = 35
    func ghtrfjk() -> String {
        return "uhnefrijmko"
    }
    func rj4nufm() {
        print("gnmfr")
    }
    
    
    func ejufek() -> Int {
        print(2 + 3)
        return 2 + 3
    }
    var jrncfm = [352: "crfc"]
    init(type: GameType) {
        _vm = StateObject(wrappedValue: QuestionViewModelGQ(typeOfGame: type))
    }
    
    var body: some View {
        VStack {
            topBar
            Spacer()
            
            questionView()
            
            Spacer()
        }.background(2)
            .blur(radius: vm.showEnterView ? 10: 0)
            .overlay {
                enterNameView
            }
            .blur(radius: vm.showFinishView ? 10: 0)
            .overlay {
                if vm.typeOfGame == .oneP {
                    onePlayerWinView
                } else {
                    multWinView
                }
            }
            .animation(.easeInOut, value: vm.showFinishView)
    }
    
    private var enterNameView: some View {
        ZStack {
            Color.hex("1B1D1E")
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            VStack {
                Spacer()
                
                Text("Player 2 name")
                    .withFont(size: 30.57, weight: .medium)
                
                Image("namefield.label")
                    .overlay {
                        TextField("Your Name...", text: $vm.player2)
                            .withFont(size: 18, weight: .semibold)
                            .padding(.horizontal)
                            .onChange(of: vm.player2) { newValue in
                                if newValue.count > 15 {
                                    vm.player2.removeLast()
                                }
                            }
                    }
                
                Spacer()
                Button {
                    guard !vm.player2.isEmpty else { return }
                    withAnimation {
                        vm.showEnterView = false
                    }
                } label: {
                    Image("button.bg")
                        .overlay {
                            Text("NEXT")
                                .withFont(size: 18.6, weight: .regular)
                        }
                }
                
                Spacer()
            }
        }.opacity(vm.showEnterView ? 1: 0)
    }
    
    private func questionView() -> some View {
        return VStack(spacing: 25) {
           Image("question.bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay {
                    Text(vm.currentQuestion.question)
                        .withFont(size: 20, weight: .semibold, color: .black)
                        .padding(.horizontal, 50)
                }
            
            ForEach(Array(vm.currentQuestion.answerOptions.enumerated()), id: \.element) { index, answer in
                Button {
                    vm.answerTheQuestion(answer: answer)
                } label: {
                    Group {
                        if vm.answer.isEmpty || answer != vm.answer && answer != vm.currentQuestion.correctAnswer {
                            Image("answer.bg")
                        } else if !vm.answer.isEmpty, answer == vm.currentQuestion.correctAnswer {
                            Image("answer.bg.corect")
                        } else {
                            Image("answer.bg.wrong")
                        }
                    }.animation(.easeInOut, value: vm.questionNumber)
                    .overlay {
                            HStack {
                                Text("\(Character(UnicodeScalar(97 + index)!))".uppercased())
                                    .withFont(size: 28, weight: .regular)
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .padding(.leading, 25)
                                
                                Spacer()
                                
                                Text(answer)
                                    .withFont(size: 16, weight: .medium, color: .black)
                                    .padding(.horizontal)
                                    .padding(.leading, 17)
                                
                                Spacer()
                            }.frame(maxWidth: .infinity)
                        }
                }.disabled(!vm.answer.isEmpty)
            }
        }
    }
    
    private var topBar: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("arrow.back")
                }
                
                Spacer()
                
                if vm.typeOfGame == .oneP {
                    ForEach(1...3, id: \.self) { index in
                        Image("heart")
                            .grayscale(vm.heartCount < index ? 1: 0)
                            .animation(.easeInOut, value: vm.heartCount)
                    }
                } else {
                    Text("\(vm.questionNumber)/20")
                        .withFont(size: 30, weight: .semibold)
                }
            }
            
            if vm.typeOfGame != .oneP {
                HStack {
                    VStack(spacing: 5) {
                        Text(vm.player1)
                            .withFont(size: 21, weight: .bold, color: vm.questionNumber % 2 != 0 ? .hex("55E4A2"): .white)
                        
                        HStack {
                            Text("\(vm.player1RightAnswers)/10")
                                .withFont(size: 21, weight: .medium)
                            Image("corect.answer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 25)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text(vm.player2)
                            .withFont(size: 21, weight: .bold, color: vm.questionNumber % 2 == 0 ? .hex("55E4A2"): .white)
                        
                        HStack {
                            Text("\(vm.player2RightAnswers)/10")
                                .withFont(size: 21, weight: .medium)
                            Image("corect.answer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 25)
                        }
                    }
                }.padding(.top, 8)
            }
        }
    }
    
    private var onePlayerWinView: some View {
        ZStack {
            Color.hex("1B1D1E")
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            Image("singlewin.bg")
                .overlay {
                    VStack {
                        Spacer()
                        
                        HStack {
                            Text("Right answers:")
                                .withFont(size: 25.56, weight: .light)
                            
                            Image("sme")
                                .overlay {
                                    Text("\(vm.questionNumber + (vm.heartCount - 3))/20")
                                        .withFont(size: 21.44, weight: .light)
                                }
                        }.padding(.top, 80)
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image("green.button.bg")
                                .resizable()
                                .frame(height: 40)
                                .overlay {
                                    Text("MAIN MENU")
                                        .withFont(size: 18.46, weight: .regular, color: .hex("0D0D0D"))
                                }
                        }.padding(40)
                    }
                }
        }.opacity(vm.showFinishView ? 1: 0)
    }
    
    private var multWinView: some View {
        ZStack {
            Color.hex("1B1D1E")
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            Image("multwin.bg")
                .overlay {
                    VStack {
                        Spacer()
                        
                        HStack {
                            VStack {
                                Text("\(vm.player1)")
                                    .withFont(size: 21.44, weight: .light)
                                
                                Image("sme")
                                    .overlay {
                                        Text("\(vm.player1RightAnswers)/10")
                                            .withFont(size: 21.44, weight: .light)
                                    }
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("\(vm.player2)")
                                    .withFont(size: 21.44, weight: .light)
                                
                                Image("sme")
                                    .overlay {
                                        Text("\(vm.player2RightAnswers)/10")
                                            .withFont(size: 21.44, weight: .light)
                                    }
                            }
                        }.padding(.horizontal, 30)
                        
                        
                        Text("\(vm.player1RightAnswers >= vm.player2RightAnswers ? vm.player1: vm.player2) WIN!")
                            .withFont(size: 28.42, weight: .semibold, color: .hex("55E4A2"))
                            .shadow(color: .hex("55E4A2"), radius: 15)
                            .padding(.top, 30)
                            .padding(.bottom, -10)
                        Button {
                            dismiss()
                        } label: {
                            Image("green.button.bg")
                                .resizable()
                                .frame(height: 40)
                                .overlay {
                                    Text("MAIN MENU")
                                        .withFont(size: 18.46, weight: .regular, color: .hex("0D0D0D"))
                                }
                        }.padding(40)
                    }
                }
        }.opacity(vm.showFinishView ? 1: 0)
    }
}

#Preview {
    QuestionViewGQ(type: .withC)
}
