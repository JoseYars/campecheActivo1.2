//
//  RetoCardView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct RetoCardView: View {
    let titulo: String
    let descripcion: String
    let puntos: Int
    let progresoActual: Double // ej. 2.5
    let progresoTotal: Double // ej. 3.0
    let unidad: String // ej. "km"
    let tagDificultad: String
    let tagColor: Color
    let tagTextoColor: Color
    
    // Esta es una "acción" que la vista padre (RetosView) nos pasará.
    // Se ejecutará cuando se presione el botón "Agregar".
    var onAgregar: () -> Void
    
    // Calcula el porcentaje de progreso (un valor entre 0.0 y 1.0)
    private var porcentajeProgreso: Double {
        return (progresoActual / progresoTotal)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // --- TÍTULO, TAG Y PUNTOS ---
            HStack {
                Text(titulo)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.appTextoPrincipal)
                Spacer()
                TagView(texto: tagDificultad, colorFondo: tagColor, colorTexto: tagTextoColor)
            }
            
            Text(descripcion)
                .font(.system(size: 14))
                .foregroundColor(.appTextoSecundario)
            
            // --- BARRA DE PROGRESO ---
            VStack(alignment: .leading, spacing: 4) {
                // Barra de progreso personalizada
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle() // Fondo de la barra
                            .frame(width: geometry.size.width, height: 10)
                            .foregroundColor(Color.gray.opacity(0.2))
                        
                        Rectangle() // Progreso
                            .frame(width: min(geometry.size.width * CGFloat(porcentajeProgreso), geometry.size.width), height: 10)
                            .foregroundColor(.appNaranjaPrincipal)
                    }
                    .cornerRadius(5)
                }
                .frame(height: 10)
                
                HStack {
                    Text("Progreso: \(progresoActual, specifier: "%.1f") / \(progresoTotal, specifier: "%.1f") \(unidad)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.appNaranjaPrincipal)
                    Spacer()
                }
            }
            
            // --- DIVISOR Y BOTÓN ---
            Divider()
            
            HStack {
                Text("\(puntos) Puntos")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.appTextoSecundario)
                
                Spacer()
                
                Button(action: onAgregar) {
                    HStack(spacing: 4) {
                        Image(systemName: "plus")
                        Text("Agregar")
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color.appNaranjaPrincipal)
                    .cornerRadius(10)
                }
            }
            
        }
        .padding(16)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

// --- PREVISUALIZACIÓN ---
struct RetoCardView_Previews: PreviewProvider {
    static var previews: some View {
        RetoCardView(
            titulo: "Caminador Semanal",
            descripcion: "Completa 3 km de caminata esta semana.",
            puntos: 100,
            progresoActual: 1.5,
            progresoTotal: 3.0,
            unidad: "km",
            tagDificultad: "Fácil",
            tagColor: .appTagVerde,
            tagTextoColor: .appTagVerdeTexto,
            onAgregar: {} // Acción vacía para el preview
        )
        .padding()
        .background(Color.appFondo)
    }
}
