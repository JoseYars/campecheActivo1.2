//
//  AgregarProcesoModalView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct AgregarProgresoModalView: View {
    
    @Binding var isPresented: Bool
    
    @State private var progresoTexto: String = ""
    
    let tituloReto: String
    let unidad: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            // --- TÍTULO ---
            Text(tituloReto)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.appTextoPrincipal)
                .padding(.top)
            
            Text("Agrega tu progreso manualmente")
                .font(.system(size: 15))
                .foregroundColor(.appTextoSecundario)
                .multilineTextAlignment(.center)
            
            // --- CAMPO DE TEXTO ---
    
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Text(unidad)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.appTextoSecundario)
            }
            .padding(.horizontal)
            
            // --- BOTONES ---
            VStack(spacing: 12) {
                Button(action: {
                    // TODO: Aquí debe ir agregado la lógica
                    // para guardar el progreso
                    isPresented = false // Cierra el modal
                }) {
                    Text("Agregar Progreso")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.appNaranjaPrincipal)
                        .cornerRadius(15)
                }
                
                Button(action: {
                    isPresented = false // Cierra el modal
                }) {
                    Text("Cancelar")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.appTextoSecundario)
                        .padding(.vertical, 5)
                }
            }
            .padding([.horizontal, .bottom])
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
        .padding(.horizontal, 30)
    }
}

// --- PREVISUALIZACIÓN ---
struct AgregarProgresoModalView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarProgresoModalView(
            isPresented: .constant(true),
            tituloReto: "Caminador Semanal",
            unidad: "km"
        )
        .background(Color.black.opacity(0.3))
    }
}

