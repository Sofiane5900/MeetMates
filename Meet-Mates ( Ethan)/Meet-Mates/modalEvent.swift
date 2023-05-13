import SwiftUI
import MapKit


struct modalEvent: View {
    @Binding var showEventSheet: Bool
    @State private var name = ""
    @State private var address = ""
    @State private var discordLink = ""
    @State private var description = ""
    
    @Environment (\.dismiss) var dimiss

    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("customGray").opacity(2.0),
                        Color("customGray").opacity(0.8)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()
          
                Button("Retour"){
                    dimiss()
                }.position(x:50, y:30)
                    .foregroundColor(Color("customRed"))
                
            
            VStack {
                
             Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:200,height: 200)
                
                Text("Création d'evenement")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 10)
                    .disableAutocorrection(false)

                TextField("Enter address", text: $address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 10)
                    .disableAutocorrection(false)
                
                TextField("Discord link", text: $discordLink)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 10)
                    .disableAutocorrection(false)
                
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 10)
                    .disableAutocorrection(false)
                
                Spacer()
                
                Button("Save 🎉") {
                    
                    // J'utilise un GeoCoder pour géocoder l'adresse fourni par l'user
                    let geocoder = CLGeocoder()
                    // Je récupere l'adresse, la fonction recherche les cordonnées de celle ci
                    geocoder.geocodeAddressString(address) { placemarks, error in
                        guard let placemark = placemarks?.first, let location = placemark.location else {
                            return
                        }
                        
                        // Ici je crée une nouvelle anotation, je la stock dans le tableau EventAnnotation du createEvent
                        let newAnnotation = EventAnnotation(title: name.isEmpty ? "New Event" : name, coordinate: location.coordinate, address: address, discordLink: discordLink, description: description)
                        eventAnnotations.append(newAnnotation)
                        // Je ferme la vue modalEvent une fois que le bouton est pressé
                        showEventSheet = false
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(.bottom)
                .padding(.top)
                .padding(.horizontal, 50.0)
                .cornerRadius(50)
                .font(.title3)
                .background(Color.red)

            }

        }
    }
}

struct ModalEvent_Previews: PreviewProvider {
    static var previews: some View {
        modalEvent(showEventSheet: .constant(true) )
    }
}

