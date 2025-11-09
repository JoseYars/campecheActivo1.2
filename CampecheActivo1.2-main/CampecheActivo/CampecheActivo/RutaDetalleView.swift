//
//  RutaDetalleView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct RutaDetalleView: View {
    
    // Propiedad para poder cerrar la vista (volver atrás)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(spacing: 0) {
                    
                    // --- IMAGEN DE CABECERA ---
                    ZStack(alignment: .topLeading) {
                        Image(systemName: "photo") // TODO: Reemplazar
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        // --- BOTÓN DE VOLVER ---
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.appNaranjaPrincipal)
                                .padding(12)
                                .background(Color.appBlancoTarjeta.opacity(0.8))
                                .clipShape(Circle())
                        }
                        .padding([.leading, .top], 20)
                    }
                    
                    // --- CONTENIDO INFERIOR ---
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // --- TÍTULO Y TAG ---
                        HStack {
                            Text("Malecón de Campeche") // TODO: Hacer dinámico
                                .font(.system(size: 26, weight: .bold))
                            Spacer()
                            TagView(texto: "Fácil", colorFondo: .appTagVerde, colorTexto: .appTagVerdeTexto)
                        }
                        
                        // --- TARJETA DE ESTADÍSTICAS ---
                        HStack {
                            StatItemView(valor: "3.2 km", etiqueta: "Distancia")
                            Divider().background(Color.gray.opacity(0.5))
                            StatItemView(valor: "35-45 min", etiqueta: "Duración")
                            Divider().background(Color.gray.opacity(0.5))
                            StatItemView(valor: "Caminata", etiqueta: "Actividad")
                        }
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.appBlancoTarjeta)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        
                        // --- PUNTOS DE LA RUTA ---
                        InfoCardView(
                            titulo: "Puntos de la Ruta",
                            items: [
                                (icon: "flag", text: "Inicio: Puerta de Mar"),
                                (icon: "flag.fill", text: "Final: Reducto de San José")
                            ]
                        )
                        
                        // --- PUNTOS DESTACADOS ---
                        InfoCardView(
                            titulo: "Puntos Destacados",
                            items: [
                                (icon: "camera", text: "Monumento a la Novia del Mar"),
                                (icon: "camera", text: "Letras 'Campeche'")
                            ]
                        )
                        
                    }
                    .padding(20)
                    .background(Color.appFondo)
                    .cornerRadius(20)
                    .offset(y: -20) // Sube el contenido
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            // --- BOTÓN FLOTANTE ---
            Button(action: {
                // TODO: Acción de comenzar seguimiento
            }) {
                Text("Comenzar Seguimiento")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appNaranjaPrincipal)
                    .cornerRadius(15)
                    .shadow(color: .appNaranjaPrincipal.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            .frame(maxHeight: .infinity, alignment: .bottom) // Fija el botón abajo
        }
        .navigationBarHidden(true) // Oculta la barra de navegación
        .background(Color.appFondo.edgesIgnoringSafeArea(.all))
    }
}

// --- SUB-VISTA: TARJETA DE INFORMACIÓN (Puntos) ---
struct InfoCardView: View {
    let titulo: String
    let items: [(icon: String, text: String)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(titulo)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.appTextoPrincipal)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(items, id: \.text) { item in
                    HStack(spacing: 10) {
                        Image(systemName: item.icon)
                            .font(.system(size: 14))
                            .foregroundColor(.appNaranjaPrincipal)
                            .frame(width: 20)
                        Text(item.text)
                            .font(.system(size: 15))
                            .foregroundColor(.appTextoSecundario)
                    }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

// --- PREVISUALIZACIÓN ---
struct RutaDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        RutaDetalleView()
    }
}
