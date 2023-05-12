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

var eventAnnotations = [
    EventAnnotation(title: "Grand Con", coordinate: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667), address: "Rue de la Paix", discordLink: "https://discord.gg/Grand Con", description: "Un événement dédié aux geeks et aux fans de jeux vidéo."),
    EventAnnotation(title: "Japan Expo", coordinate: CLLocationCoordinate2D(latitude: 50.62, longitude: 3.06), address: "Avenue des Champs-Élysées", discordLink: "https://discord.gg/japanexpo", description: "Le plus grand événement dédié à la culture japonaise en Europe."),
    EventAnnotation(title: "Z Lan", coordinate: CLLocationCoordinate2D(latitude: 50.64, longitude: 3.08), address: "Place Vendôme", discordLink: "https://discord.gg/zevent", description: "Un événement caritatif de streaming pour la Croix-Rouge.")
]

struct CreateEventView: View {
    @State var eventTitle = ""
    @State var eventAddress = ""
    @State var eventDiscordLink = ""
    @State var description = ""
    
    @AppStorage("favoriteEvent") var favoriteEvent: String?

    // J'initialise la carte avec son centre sur Lille
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    // Liste de trois événements pour afficher sur la carte
    
    
    // Variable stat pour stocker l'événement sélectionné
    @State var selectedEvent: EventAnnotation?
    
    @State var buttonAnimation = false
    @State var createEvent = false
    @State var animation = false
    @State var isFavorite = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2.0), Color(.black).opacity(1.8)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(Color("darkRed"))
                .blur(radius: animation ? 80 : 120)
                .offset(x: animation ? -50 : -130, y: animation ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 2).repeatForever()) {
                        animation.toggle()
                        
                    }
                }
            
            Circle()
                .foregroundColor(Color("darkRed"))
                .blur(radius: animation ? 80 : 120)
                .offset(x: animation ? 100 : 130, y: animation ? 150 : 100)
            
                .ignoresSafeArea()
            
            VStack {
                
                
                Map(
                    coordinateRegion: $region,
                    annotationItems: eventAnnotations
                ) { event in
                    MapAnnotation(coordinate: event.coordinate) {
                        VStack {
                            Image(systemName: "gamecontroller.fill")
                                .foregroundColor(Color("darkRed"))
                                .shadow(radius: 2, y: 2)
                            Text(event.title)
                                .font(.subheadline)
                                .bold()
                                .shadow(radius: 2, y: 2)
                                .foregroundColor(Color("darkRed"))
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
                .padding(.top, 10)
                ZStack {
                    Rectangle()
                        .fill(Color.white.opacity(0.09))
                        .cornerRadius(40)
                        .padding(20)
                    

                    VStack(alignment: .leading, spacing: 10) {
                        VStack(spacing: 20) {
                            Spacer()
                                .frame(width: 10, height: 10)
                            VStack(alignment: .leading, spacing: 5) {
                                VStack {
                                    Text("Nom de l'Event")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color("darkRed"))
                                        .cornerRadius(4)
                                        .shadow(radius: 2, y: 2)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 2)
                                        .opacity(0)
                                        .frame(height: 40)
                                        .overlay(Text(eventTitle)
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 20, weight: .regular))
                                            .padding(.horizontal, 20))
                                        .padding(.vertical, 10)
                                    
                                    Text("Adresse")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 40)
                                        .padding(.vertical, 8)
                                        .background(Color("darkRed"))
                                        .cornerRadius(4)
                                        .shadow(radius: 2, y: 2)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 2)
                                        .opacity(0)
                                        .frame(height: 40)
                                        .overlay(Text(eventAddress)
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 20, weight: .regular))
                                            .padding(.horizontal, 20))
                                        .padding(.vertical, 10)
                                    
                                    Text("Lien Discord")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 22)
                                        .padding(.vertical, 8)
                                        .background(Color("darkRed"))
                                        .cornerRadius(4)
                                        .shadow(radius: 2, y: 2)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 2)
                                        .opacity(0)
                                        .frame(height: 40)
                                        .overlay(Text(eventDiscordLink)
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 20, weight: .regular))
                                            .padding(.horizontal, 20))
                                        .padding(.vertical, 10)
                                    
                                    Text("Description")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 30)
                                        .padding(.vertical, 8)
                                        .background(Color("darkRed"))
                                        .cornerRadius(4)
                                        .shadow(radius: 2, y: 2)
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 2)
                                        .opacity(0)
                                        .frame(height: 100)
                                        .overlay(Text(description)
                                            .foregroundColor(.white)
                                            .font(Font.system(size: 20, weight: .regular))
                                            .padding(.horizontal, 20))
                                        .padding(.vertical, 10)
                                    
                                    Button(action: {
                                        isFavorite = true
                                        favoriteEvent = "\(eventTitle),\(eventAddress)"

                                    }) {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                            .resizable()
                                            .foregroundColor(isFavorite ? .red : .white)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                            .padding(.bottom, 50)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
        struct CreateEventView_Previews: PreviewProvider {
            static var previews: some View {
                CreateEventView()
            }
        }

