//
//  OnBoardingView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct OnboardingView: View {
    
    // Esta propiedad es para "cerrar" esta vista cuando el usuario presione el botón.
    // La usaremos en el archivo principal de la App.
    var onComplete: () -> Void
    
    var body: some View {
        ZStack {
            // Fondo naranja
            Color.appNaranjaPrincipal
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                Spacer()
                
                // --- TÍTULO ---
                Text("¡Bienvenido a\nCampeche Activo!")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // --- TARJETAS DE CARACTERÍSTICAS ---
                VStack(spacing: 20) {
                    FeatureCardView(
                        iconName: "map", // NO SE NOS OLVIDE PONER ICONO
                        title: "Explora Rutas Únicas",
                        description: "Descubre el Malecón, Centro Histórico y más."
                    )
                    
                    FeatureCardView(
                        iconName: "flag.checkered", //NO SE NOS OLVIDE NUESTRO ICONO
                        title: "Acepta Retos Semanales",
                        description: "Mantente activo con desafíos personalizados."
                    )
                    
                    FeatureCardView(
                        iconName: "trophy", // NO OLCVIDFAR PONER ICONO
                        title: "Gana Medallas",
                        description: "Desbloquea logros y colecciona premios."
                    )
                }
                .padding()

                Spacer()
                
                // --- BOTÓN DE COMENZAR ---
                Button(action: {
                    // Aquí llamamos a la función para cerrar la vista
                    onComplete()
                }) {
                    Text("¡Comenzar Ahora!")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.appNaranjaPrincipal)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.appBlancoTarjeta)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
        }
    }
}

// --- SUB-VISTA: TARJETA DE CARACTERÍSTICA ---
// Esto es para reusar el diseño de las 3 tarjetas
struct FeatureCardView: View {
    let iconName: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(.appNaranjaPrincipal)
                .frame(width: 40, height: 40)
                .background(Color.white.opacity(0.3))
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.85))
            }
            Spacer()
        }
        .padding(16)
        .background(Color.white.opacity(0.15))
        .cornerRadius(20)
    }
}

// --- PREVISUALIZACIÓN ---
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        // El `onComplete: {}` es solo para que el preview funcione
        OnboardingView(onComplete: {})
    }
}
