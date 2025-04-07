//
//  PantallaPersonajes.swift
//  bocetos_IOS
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        if(controlador.pagina_resultados !=nil){
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){
                        personaje in
                        Text("El personjae es \(personaje.name)")
                        AsyncImage(url: URL(String: personaje.image))
                    }
                }
            }
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion)
}
