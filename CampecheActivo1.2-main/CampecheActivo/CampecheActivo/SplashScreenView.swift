//
//  SplashScreenView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            // Fondo de color naranja principal
            Color.appNaranjaPrincipal
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Spacer()
                
                // --- LOGO ---
                // TODO: Reemplaza "logo_campeche" con el nombre de tu imagen de logo
                // Tendrás que agregar tu logo a los assets cuando estés en Xcode.
                Image(systemName: "figure.walk.circle.fill") // Icono de reemplazo temporal
                    .font(.system(size: 120))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // --- TÍTULO ---
                Text("Campeche Activo")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                // --- SUBTÍTULO ---
                Text("Descubre Campeche en movimiento")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                
                Spacer()
                Spacer() // Doble spacer para subir un poco el contenido
            }
            .padding()
        }
    }
}

// --- PREVISUALIZACIÓN ---
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
