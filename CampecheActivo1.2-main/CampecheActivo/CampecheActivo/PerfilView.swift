//
//  PerfilView.swift
//  CampecheActivo
//
//  Created by Alumno 13 on 07/11/25.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
        ZStack {
            // Color de fondo principal
            Color.appFondo.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // --- TÍTULO ---
                    Text("Mi Perfil")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.appTextoPrincipal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 60) // Ajusta para "safe area"
                        .padding(.horizontal)
                    
                    // --- TARJETA DE PERFIL MORADA ---
                    PerfilHeaderCard()
                    
                    // --- TARJETA DE PROGRESO DE NIVEL ---
                    ProgresoNivelCard()
                    
                    // --- GRID DE ESTADÍSTICAS ---
                    StatsGridCard()
                    
                    // --- RESUMEN DE ACTIVIDAD ---
                    ResumenActividadCard()
                    
                    // --- LOGROS RECIENTES ---
                    LogrosRecientesCard()
                    
                    // --- BANNER FINAL ---
                    VStack(spacing: 8) {
                        Image(systemName: "sparkles") // TODO: Reemplazar
                            .font(.system(size: 24))
                        Text("¡Excelente Trabajo!")
                            .font(.system(size: 18, weight: .bold))
                        Text("Sigue así y no pierdas la racha.")
                            .font(.system(size: 14))
                    }
                    .foregroundColor(Color(hex: "388E3C")) // Texto verde oscuro
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(Color(hex: "E8F5E9")) // Fondo verde claro
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                }
                .padding(.bottom, 20)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

// --- SUB-VISTA: TARJETA DE PERFIL (MORADA) ---
struct PerfilHeaderCard: View {
    var body: some View {
        VStack(spacing: 12) {
            // TODO: Reemplaza con la imagen de perfil del usuario
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .padding(20)
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
            
            Text("Doña Jochis") // TODO: Hacer dinámico
                .font(.system(size: 22, weight: .bold))
            
            Text("Nivel 1")
                .font(.system(size: 16, weight: .medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.3))
                .cornerRadius(20)
            
            Text("0 Puntos") // TODO: Hacer dinámico
                .font(.system(size: 15, weight: .semibold))
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color.appMoradoPerfil)
        .foregroundColor(.white)
        .cornerRadius(20)
        .shadow(color: .appMoradoPerfil.opacity(0.4), radius: 10, y: 5)
        .padding(.horizontal)
    }
}

// --- SUB-VISTA: TARJETA DE PROGRESO ---
struct ProgresoNivelCard: View {
    let progreso: Double = 0.0 // TODO: Hacer dinámico
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Progreso al Siguiente Nivel")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.appTextoPrincipal)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle() // Fondo
                        .frame(width: geometry.size.width, height: 12)
                        .foregroundColor(Color.gray.opacity(0.2))
                    Rectangle() // Progreso
                        .frame(width: min(geometry.size.width * CGFloat(progreso), geometry.size.width), height: 12)
                        .foregroundColor(.appMoradoPerfil)
                }
                .cornerRadius(6)
            }
            .frame(height: 12)
            
            Text("¡Sigue sumando puntos para subir de nivel!")
                .font(.system(size: 13))
                .foregroundColor(.appTextoSecundario)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// --- SUB-VISTA: GRID DE ESTADÍSTICAS ---
struct StatsGridCard: View {
    var body: some View {
        // Grid de 2 columnas
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            StatGridItem(titulo: "Rutas Completadas", valor: "0", icono: "map.fill", color: .appNaranjaPrincipal)
            StatGridItem(titulo: "Retos Completados", valor: "0", icono: "flag.checkered", color: .appMoradoRetos)
            StatGridItem(titulo: "Distancia Total", valor: "0.0 km", icono: "location.north.fill", color: .appAmarilloPremios)
            StatGridItem(titulo: "Días Activo", valor: "0", icono: "calendar", color: Color(hex: "0288D1")) // Azul
        }
        .padding(16)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// --- SUB-VISTA: ITEM DEL GRID DE ESTADÍSTICAS ---
struct StatGridItem: View {
    let titulo: String
    let valor: String
    let icono: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icono)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(titulo)
                    .font(.system(size: 13))
                    .foregroundColor(.appTextoSecundario)
                Text(valor)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.appTextoPrincipal)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// --- SUB-VISTA: RESUMEN DE ACTIVIDAD ---
struct ResumenActividadCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Resumen de Actividad")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.appTextoPrincipal)
            
            // TODO: Aquí iría una gráfica
            Text("Gráfica de actividad semanal (Placeholder)")
                .font(.system(size: 14))
                .foregroundColor(.appTextoGrisClaro)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// --- SUB-VISTA: LOGROS RECIENTES ---
struct LogrosRecientesCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Logros Recientes")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.appTextoPrincipal)
            
            // TODO: Aquí iría una lista de 2-3 logros
            Text("Aún no tienes logros recientes.")
                .font(.system(size: 14))
                .foregroundColor(.appTextoGrisClaro)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 20)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.appBlancoTarjeta)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// --- PREVISUALIZACIÓN ---
struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView()
    }
}
