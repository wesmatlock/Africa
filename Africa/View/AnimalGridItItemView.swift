import SwiftUI

struct AnimalGridItItemView: View {

  // MARK: - PROPERTIES
  var animal: Animal
  // MARK: - BODY
  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: PREVIEW
struct AnimalGridItItemView_Previews: PreviewProvider {

  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    AnimalGridItItemView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
