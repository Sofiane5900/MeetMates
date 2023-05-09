import SwiftUI
import MapKit

// Structure pour stocker les informations de chaque événement
struct EventAnnotation: Identifiable {
    var id = UUID()
    var title: String
    var coordinate: CLLocationCoordinate2D
    var address: String
    var discordLink: String
    var description: String
}


struct CreateEventView: View {
    @State var eventTitle = ""
    @State var eventAddress = ""
    @State var eventDiscordLink = ""
    @State var description = ""
    
    // J'initialise la carte avec son centre sur Lille
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    // Liste de trois événements pour afficher sur la carte
    @State var eventAnnotations = [
        EventAnnotation(title: "Geeks Day", coordinate: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667), address: "Rue de la Paix", discordLink: "https://discord.gg/geeksday", description: "Un événement dédié aux geeks et aux fans de jeux vidéo."),
        EventAnnotation(title: "Japan Expo", coordinate: CLLocationCoordinate2D(latitude: 50.62, longitude: 3.06), address: "Avenue des Champs-Élysées", discordLink: "https://discord.gg/japanexpo", description: "Le plus grand événement dédié à la culture japonaise en Europe."),
        EventAnnotation(title: "Z Event", coordinate: CLLocationCoordinate2D(latitude: 50.64, longitude: 3.08), address: "Place Vendôme", discordLink: "https://discord.gg/zevent", description: "Un événement caritatif de streaming pour la Croix-Rouge.")
    ]
    
    // Variable stat pour stocker l'événement sélectionné
    @State var selectedEvent: EventAnnotation?
    
    @State var buttonAnimation = false
    @State var createEvent = false
    
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
            
            VStack {
                   
                
                Map(
                    coordinateRegion: $region,
                    annotationItems: eventAnnotations
                ) { event in
                    MapAnnotation(coordinate: event.coordinate) {
                        VStack {
                            Image(systemName: "gamecontroller.fill")
                                .foregroundColor(.red)
                            Text(event.title)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.red)
                                .onTapGesture {
                                    selectedEvent = event
                                    eventTitle = event.title
                                    eventAddress = event.address
                                    eventDiscordLink = event.discordLink
                                   
                                            description = event.description
                                        }
                                    
                                }
                                
                            }
                        }
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding(.top, 100)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Nom de l'Event")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("Nom de l'event", text: $eventTitle)
                                .disabled(true)
                                .foregroundColor(.black)
                                .font(Font.system(size: 20, weight: .regular))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(20)

                            Text("Adresse")
                                .font(.headline)
                                .foregroundColor(.white)
                            TextField("Adresse de l'event", text: $eventAddress)
                                .disabled(true)
                                .foregroundColor(.black)
                                .font(Font.system(size: 20, weight: .regular))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(20)

                            Text("Lien Discord")
                                .foregroundColor(.white)
                                .font(.headline)
                            TextField("Lien du discord", text: $eventDiscordLink)
                                .disabled(true)
                                .foregroundColor(.black)
                                .font(Font.system(size: 20, weight: .regular))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .cornerRadius(20)
                            Text("Description")
                                .font(.headline)
                                .foregroundColor(.white)
                        
                                TextField("Description de l'event", text: $description)
                                    .disabled(true)
                                    .foregroundColor(.black)
                                    .font(Font.system(size: 20, weight: .regular))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                
                            

                            Spacer()


                        }
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                buttonAnimation.toggle() // Quand j'appuie sur le boutton ça toggle la var en "true"
                                createEvent = true
                            }
                        }, label: {
                            Text("CREATE EVENT")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 50.0)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(50)
                                .scaleEffect(buttonAnimation ? 1.1 : 1.0) // ternaire, si buttonAnimation vrai le button upscale, sinons il downscale
                                .fullScreenCover(isPresented: $createEvent) {
                                    modalEvent(showEventSheet: $createEvent, eventAnnotations: $eventAnnotations)
                                }


                                                    })
                        
                    }
                    
        };                             
                
            }
        }


        struct CreateEventView_Previews: PreviewProvider {
            static var previews: some View {
                CreateEventView()
            }
        }

