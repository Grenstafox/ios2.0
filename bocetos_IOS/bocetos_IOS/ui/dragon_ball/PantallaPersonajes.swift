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
        NavigationStack{
            if(controlador.pagina_resultados != nil){
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){
                            personaje in
                            NavigationLink {
                                Text("Hola mundo \(personaje.name)")
                            } label: {
                                Text("El personaje es \(personaje.name)")
                                AsyncImage(url: URL(string:personaje.image))
                                    .frame(width: 50, height: 50)
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador
                                    .descargar_informacion_personaje(id: personaje.id)
                            }))
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
