import SwiftUI
import MapKit

struct MapView: View {

  // MARK: - Properties

  @State private var region: MKCoordinateRegion  = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

    return mapRegion
  }()

  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

  // MARK: - Body
  var body: some View {
//      Map(coordinateRegion: $region)
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent:{ item in
      // Old Pin style (static)
//      MapPin(coordinate: item.location, tint:.accentColor)

      // new style (static)
//      MapMarker(coordinate: item.location, tint: .accentColor)

      // custom basic (interactive)
      MapAnnotation(coordinate: item.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      }
    })
  }

}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
      .previewDevice("iPhone 12 Pro")
  }
}
