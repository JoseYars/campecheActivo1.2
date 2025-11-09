//
//  PremioCardView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct PremioCardView: View {
    let titulo: String
    let descripcion: String
    let puntos: Int
    let tagRaridad: String
    let tagColor: Color
    let tagTextoColor: Color
    let progresoActual: Double
    let progresoTotal: Double
    
    // Calcula el porcentaje de progreso (un valor entre 0.0 y 1.0)
    private var porcentajeProgreso: Double {
        return (progresoActual / progresoTotal)
    }
    
    // Revisa si el logro está completado
    private var isCompleted: Bool {
        return progresoActual >= progresoTotal
    }
    
    var body: some View {
        HStack(spacing: 16) {
            // --- ICONO DE LA MEDALLA ---
            // TODO: Reemplaza esto con la imagen de tu medalla
            Image(systemName: isCompleted ? "star.fill" : "star")
                .font(.system(size: 32))
                .foregroundColor(isCompleted ? .appAmarilloPremios : .appTextoGrisClaro)
                .frame(width: 50, height: 50)
                .background(isCompleted ? Color.appAmarilloPremios.opacity(0.1) : Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            // --- DETALLES DEL PREMIO ---
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(titulo)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.appTextoPrincipal)
                    Spacer()
                    TagView(texto: tagRaridad, colorFondo: tagColor, colorTexto: tagTextoColor)
                }
                
                Text(descripcion)
                    .font(.system(size: 14))
                    .foregroundColor(.appTextoSecundario)
                    .padding(.bottom, 4)
                
                // --- BARRA DE PROGRESO Y PUNTOS ---
                if isCompleted {
                    Text("¡Completado! (+ \(puntos) Puntos)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.appTagVerdeTexto)
                } else {
                    // Barra de progreso
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle() // Fondo
                                .frame(width: geometry.size.width, height: 6)
                                .foregroundColor(Color.gray.opacity(0.2))
                            Rectangle() // Progreso
                                .frame(width: min(geometry.size.width * CGFloat(porcentajeProgreso), geometry.size.width), height: 6)
                                .foregroundColor(.appAmarilloPremios)
                        }
                        .cornerRadius(3)
                    }
                    .frame(height: 6)
                    
                    HStack {
                        Text("\(progresoActual, specifier: "%.0f") / \(progresoTotal, specifier: "%.0f")")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
            }
        }
    }
}
