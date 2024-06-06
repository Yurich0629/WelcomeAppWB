//
//  OnboardingView.swift
//  WelcomeApp
//
//  Created by Илья Десятов on 05.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State var isShowingSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 42){
                onboardingImage
                onboardingText
            }
            
            Spacer()
            
            VStack(spacing: 18) {
                userAgreementButton
                startChattingButton
            }
            .padding(.bottom, 20)
        }
        .sheet(isPresented: $isShowingSheet) {
            Text("Пользовательское соглашение")
        }
    }
}

private extension OnboardingView {
    
    // MARK: OnboardingImage
    
    var onboardingImage: some View {
        Image("OnboardingImage")
            .resizable()
            .frame(width: 262, height: 271)
    }
    
    // MARK: OnboardingText
    
    var onboardingText: some View {
        Text("Общайтесь с друзьями и близкими легко")
            .font(.system(size: 24,weight: .bold))
            .multilineTextAlignment(.center)
            .foregroundStyle(.darkPurple)
            .frame(width: 280)
    }
    
    // MARK: UserAgreementButton
    
    var userAgreementButton: some View {
        Button("Пользовательское соглашение") {
            isShowingSheet.toggle()
        }
        .foregroundStyle(.darkPurple)
    }
    
    // MARK: StartChattingButton
    
    var startChattingButton: some View {
        Button("Начать общаться") {
        }
        .foregroundStyle(.naturaleWhite)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.lightPurple)
        .clipShape(Capsule())
        .padding(.horizontal, 24)
    }
}

#Preview {
    OnboardingView()
}
