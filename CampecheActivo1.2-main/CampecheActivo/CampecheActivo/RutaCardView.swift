//
//  RutaCardView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

// --- TARJETA REUTILIZABLE PARA CADA RUTA ---
struct RutaCardView: View {
    
    // Propiedades para hacer la tarjeta dinámica
    let nombreImagen: String
    let titulo: String
    let distancia: String
    let duracion: String
    let tipo: String
    let dificultad: String
    let tagColor: Color
    let tagTextoColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // --- IMAGEN DE LA RUTA ---
            // TODO: Reemplaza "placeholder_ruta" con el nombre de tu imagen
            Image(systemName: "photo") // Placeholder temporal
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
            
            // --- CONTENIDO DE LA TARJETA ---
            VStack(alignment: .leading, spacing: 12) {
                
                // --- TÍTULO Y DIFICULTAD ---
                HStack {
                    Text(titulo)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.appTextoPrincipal)
                    Spacer()
                    TagView(texto: dificultad, colorFondo: tagColor, colorTexto: tagTextoColor)
                }
                
                // --- ESTADÍSTICAS (Icono y Texto) ---
                HStack(spacing: 16) {
                    StatIconView(iconName: "location.north", texto: distancia)
                    StatIconView(iconName: "clock", texto: duracion)
                    StatIconView(iconName: "figure.walk", texto: tipo)
                }
                
                // --- BOTÓN ---
                Button(action: {
                    // La navegación se manejará en la vista padre (RutasView)
                    // con NavigationLink, así que este botón es más visual.
                }) {
                    Text("Ver Detalles")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.appNaranjaPrincipal)
                        .cornerRadius(10)
                }
                
            }
            .padding(16)
        }
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

// --- SUB-VISTA: ETIQUETA DE DIFICULTAD ---
struct TagView: View {
    let texto: String
    let colorFondo: Color
    let colorTexto: Color
    
    var body: some View {
        Text(texto)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(colorTexto)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(colorFondo)
            .cornerRadius(20)
    }
}

// --- SUB-VISTA: ICONO DE ESTADÍSTICA ---
struct StatIconView: View {
    let iconName: String
    let texto: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 14))
                .foregroundColor(.appNaranjaPrincipal)
            Text(texto)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.appTextoSecundario)
        }
    }
}

// --- PREVISUALIZACIÓN ---
struct RutaCardView_Previews: PreviewProvider {
    static var previews: some View {
        RutaCardView(
            nombreImagen: "placeholder_ruta",
            titulo: "Malecón de Campeche",
            distancia: "3.2 km",
            duracion: "35-45 min",
            tipo: "Caminata",
            dificultad: "Fácil",
            tagColor: .appTagVerde,
            tagTextoColor: .appTagVerdeTexto
        )
        .padding()
        .background(Color.appFondo)
    }
}
