//
//  RutasView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct RutasView: View {
    var body: some View {
        // NavigationView nos permite navegar a la pantalla de detalle
        NavigationView {
            ZStack {
                // Color de fondo principal
                Color.appFondo.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // --- ENCABEZADO CON GRADIENTE ---
                        HeaderView()
                        
                        // --- TARJETA DE ESTADÍSTICAS ---
                        StatsCardView()
                        
                        // --- LISTA DE RUTAS ---
                        VStack(spacing: 20) {
                            
                            // --- RUTA 1 ---
                            NavigationLink(destination: RutaDetalleView()) {
                                RutaCardView(
                                    nombreImagen: "malecon", // TODO: Cambia esto
                                    titulo: "Malecón de Campeche",
                                    distancia: "3.2 km",
                                    duracion: "35-45 min",
                                    tipo: "Caminata",
                                    dificultad: "Fácil",
                                    tagColor: .appTagVerde,
                                    tagTextoColor: .appTagVerdeTexto
                                )
                            }
                            
                            // --- RUTA 2 ---
                            NavigationLink(destination: RutaDetalleView()) {
                                RutaCardView(
                                    nombreImagen: "centro", // TODO: Cambia esto
                                    titulo: "Centro Histórico",
                                    distancia: "2.1 km",
                                    duracion: "25-35 min",
                                    tipo: "Caminata",
                                    dificultad: "Fácil",
                                    tagColor: .appTagVerde,
                                    tagTextoColor: .appTagVerdeTexto
                                )
                            }
                            
                            // --- RUTA 3 ---
                            NavigationLink(destination: RutaDetalleView()) {
                                RutaCardView(
                                    nombreImagen: "fortificaciones", // TODO: Cambia esto
                                    titulo: "Ruta de las Fortificaciones",
                                    distancia: "4.5 km",
                                    duracion: "50-60 min",
                                    tipo: "Caminata",
                                    dificultad: "Moderado",
                                    tagColor: .appTagAmarillo,
                                    tagTextoColor: .appTagAmarilloTexto
                                )
                            }
                            
                            // Agrega tus otras 3 rutas aquí...
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    .padding(.bottom, 20) // Espacio al final
                }
                .edgesIgnoringSafeArea(.top) // El scroll pasa por debajo del header
            }
            .navigationBarHidden(true) // Ocultamos la barra de navegación estándar
        }
        .accentColor(.appNaranjaPrincipal) // Para el botón de "Volver" en la vista de detalle
    }
}

// --- SUB-VISTA: ENCABEZADO ---
struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Campeche Activo")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                // TODO: Reemplaza esto con tu ícono de perfil
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
            }
            Text("¡Descubre rutas, completa retos!")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
        }
        .padding(.horizontal, 20)
        .padding(.top, 60) // Ajusta esto para tu "safe area"
        .padding(.bottom, 20)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.appNaranjaHeader, .appNaranjaPrincipal]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}

// --- SUB-VISTA: TARJETA DE ESTADÍSTICAS ---
struct StatsCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            StatItemView(valor: "0", etiqueta: "Rutas Completadas")
            Divider().background(Color.gray.opacity(0.5))
            StatItemView(valor: "0.0", etiqueta: "Distancia Total")
            Divider().background(Color.gray.opacity(0.5))
            StatItemView(valor: "6", etiqueta: "Rutas Disponibles")
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        .offset(y: -15) // Sube la tarjeta para que se encime un poco
    }
}

// --- SUB-VISTA: ITEM DE ESTADÍSTICA ---
struct StatItemView: View {
    let valor: String
    let etiqueta: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(valor)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.appTextoPrincipal)
            Text(etiqueta)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.appTextoSecundario)
                .multilineTextAlignment(.center)
                .frame(height: 25)
        }
        .frame(maxWidth: .infinity)
    }
}

// --- PREVISUALIZACIÓN ---
struct RutasView_Previews: PreviewProvider {
    static var previews: some View {
        RutasView()
    }
}
