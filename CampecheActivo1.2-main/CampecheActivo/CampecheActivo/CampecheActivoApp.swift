//
//  CampecheActivoApp.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

@main
struct CampecheActivoApp: App {
    
    @State private var isLoading = true // Inicia mostrando el Splash
    
    // @AppStorage guarda si el usuario ya vio el onboarding
    // para no mostrarlo cada vez que abre la app
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var body: some Scene {
        WindowGroup {
            // Lógica de vistas
            if isLoading {
                // 1. MUESTRA LA SPLASH SCREEN
                SplashScreenView()
                    .onAppear {
                        // Espera 2 segundos y luego pasa a la siguiente vista
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                isLoading = false
                            }
                        }
                    }
            } else if !hasCompletedOnboarding {
                // 2. MUESTRA EL ONBOARDING
                OnboardingView {
                    // Esto se ejecuta cuando el usuario presiona "¡Comenzar Ahora!"
                    withAnimation {
                        hasCompletedOnboarding = true
                    }
                }
            } else {
                // 3. MUESTRA LA APP PRINCIPAL
                ContentView()
            }
        }
    }
}
