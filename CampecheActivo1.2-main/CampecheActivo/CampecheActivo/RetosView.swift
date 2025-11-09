//
//  RetosView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct RetosView: View {
    
    // @State para saber si el modal debe mostrarse
    @State private var showingModal = false
    
    // @State para saber qué reto se seleccionó
    @State private var retoSeleccionado = ""
    @State private var unidadSeleccionada = ""
    
    var body: some View {
        ZStack {
            // Color de fondo principal
            Color.appFondo.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // --- TÍTULO ---
                    Text("Retos Semanales")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.appTextoPrincipal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 60) // Ajusta para "safe area"
                        .padding(.horizontal)
                    
                    // --- TARJETA DE ESTADÍSTICAS MORADA ---
                    RetosStatsCardView()
                    
                    // --- BANNER DE SEMANA ---
                    Text("Semana del 18/10/2025") // TODO: Hacer dinámico
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.appTextoSecundario)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.appBlancoTarjeta)
                    
                    // --- LISTA DE RETOS ---
                    VStack(spacing: 20) {
                        RetoCardView(
                            titulo: "Caminador Semanal",
                            descripcion: "Completa 3 km de caminata esta semana.",
                            puntos: 100,
                            progresoActual: 0.0,
                            progresoTotal: 3.0,
                            unidad: "km",
                            tagDificultad: "Fácil",
                            tagColor: .appTagVerde,
                            tagTextoColor: .appTagVerdeTexto,
                            onAgregar: {
                                // Al presionar, guardamos los datos del reto
                                // y activamos el modal
                                retoSeleccionado = "Caminador Semanal"
                                unidadSeleccionada = "km"
                                withAnimation {
                                    showingModal = true
                                }
                            }
                        )
                        
                        RetoCardView(
                            titulo: "Ciclista Activo",
                            descripcion: "Recorre 10 km en bicicleta.",
                            puntos: 150,
                            progresoActual: 0.0,
                            progresoTotal: 10.0,
                            unidad: "km",
                            tagDificultad: "Moderado",
                            tagColor: .appTagAmarillo,
                            tagTextoColor: .appTagAmarilloTexto,
                            onAgregar: {
                                retoSeleccionado = "Ciclista Activo"
                                unidadSeleccionada = "km"
                                withAnimation {
                                    showingModal = true
                                }
                            }
                        )
                        
                        // Agrega tus otros retos aquí...
                        
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.bottom, 20)
            }
            .edgesIgnoringSafeArea(.top)
            
            // --- SECCIÓN DEL MODAL ---
            if showingModal {
                // Fondo oscuro semitransparente
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        // Permite cerrar el modal al tocar el fondo
                        withAnimation {
                            showingModal = false
                        }
                    }
                
                // El Modal
                AgregarProgresoModalView(
                    isPresented: $showingModal,
                    tituloReto: retoSeleccionado,
                    unidad: unidadSeleccionada
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

// --- SUB-VISTA: TARJETA DE ESTADÍSTICAS (RETOS) ---
struct RetosStatsCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            StatItemView(valor: "0", etiqueta: "Retos Completados")
            Divider().background(Color.white.opacity(0.5))
            StatItemView(valor: "0", etiqueta: "Puntos Esta Semana")
            Divider().background(Color.white.opacity(0.5))
            StatItemView(valor: "6", etiqueta: "Retos Disponibles")
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.appMoradoRetos) // Color morado
        .cornerRadius(15)
        .shadow(color: .appMoradoRetos.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        // Cambiamos los colores del texto a blanco
        .foregroundColor(.white)
        .colorScheme(.dark) // Asegura que el texto se vea bien
    }
}

// --- PREVISUALIZACIÓN ---
struct RetosView_Previews: PreviewProvider {
    static var previews: some View {
        RetosView()
    }
}
