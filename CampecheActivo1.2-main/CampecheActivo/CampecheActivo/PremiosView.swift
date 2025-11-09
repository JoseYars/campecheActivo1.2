//
//  PremiosView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct PremiosView: View {
    var body: some View {
        ZStack {
            // Color de fondo principal
            Color.appFondo.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // --- TÍTULO ---
                    Text("Premios y Logros")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.appTextoPrincipal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 60) // Ajusta para "safe area"
                        .padding(.horizontal)
                    
                    // --- TARJETA DE ESTADÍSTICAS AMARILLA ---
                    PremiosStatsCardView()
                    
                    // --- SECCIÓN: MEDALLAS POR CONSEGUIR ---
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Medallas por Conseguir")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.appTextoPrincipal)
                            .padding(.horizontal)
                        
                        PremioCardView(
                            titulo: "Primer Paso",
                            descripcion: "Completa tu primera ruta",
                            puntos: 50,
                            tagRaridad: "Común",
                            tagColor: .appTagVerde,
                            tagTextoColor: .appTagVerdeTexto,
                            progresoActual: 0,
                            progresoTotal: 1
                        )
                        
                        PremioCardView(
                            titulo: "Explorador",
                            descripcion: "Completa 5 rutas diferentes",
                            puntos: 200,
                            tagRaridad: "Raro",
                            tagColor: .appTagAmarillo,
                            tagTextoColor: .appTagAmarilloTexto,
                            progresoActual: 0,
                            progresoTotal: 5
                        )
                        
                        PremioCardView(
                            titulo: "Caminante Kilométrico",
                            descripcion: "Camina 10 km en total",
                            puntos: 150,
                            tagRaridad: "Común",
                            tagColor: .appTagVerde,
                            tagTextoColor: .appTagVerdeTexto,
                            progresoActual: 0,
                            progresoTotal: 10
                        )
                    }
                    .padding(.horizontal)
                    
                    // --- SECCIÓN: LOGROS ESPECIALES ---
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Logros Especiales")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.appTextoPrincipal)
                            .padding(.horizontal)
                        
                        PremioCardView(
                            titulo: "Madrugador",
                            descripcion: "Completa una ruta antes de las 8 AM",
                            puntos: 100,
                            tagRaridad: "Raro",
                            tagColor: .appTagAmarillo,
                            tagTextoColor: .appTagAmarilloTexto,
                            progresoActual: 0,
                            progresoTotal: 1
                        )
                        
                        // Agrega más logros aquí...
                    }
                    .padding(.horizontal)

                    // --- BANNER AZUL FINAL ---
                    VStack(spacing: 8) {
                        Image(systemName: "figure.walk") // TODO: Reemplazar
                            .font(.system(size: 24))
                        Text("¡Sigue Activo!")
                            .font(.system(size: 18, weight: .bold))
                        Text("Nuevos logros te esperan cada semana.")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(Color(hex: "0D47A1")) // Texto azul oscuro
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(Color(hex: "E3F2FD")) // Fondo azul claro
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                }
                .padding(.bottom, 20)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

// --- SUB-VISTA: TARJETA DE ESTADÍSTICAS (PREMIOS) ---
struct PremiosStatsCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            StatItemView(valor: "0", etiqueta: "Medallas Ganadas")
            Divider().background(Color.white.opacity(0.5))
            StatItemView(valor: "0", etiqueta: "Puntos Totales")
            Divider().background(Color.white.opacity(0.5))
            StatItemView(valor: "10", etiqueta: "Medallas Disponibles")
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.appAmarilloPremios) // Color amarillo
        .cornerRadius(15)
        .shadow(color: .appAmarilloPremios.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        // Cambiamos los colores del texto a blanco/oscuro
        .foregroundColor(.white)
        .colorScheme(.dark)
    }
}

// --- PREVISUALIZACIÓN ---
struct PremiosView_Previews: PreviewProvider {
    static var previews: some View {
        PremiosView()
    }
}
