import SwiftUI

struct ContentView: View {

  // MARK: - Properties

  @State private var isGridViewActive: Bool = false
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String  = "square.grid.2x2"

  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)

  //: MARK: - FUNCTIONS

  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count

    //: TOOLBAR IMAGE
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }

  // MARK: - Body

  var body: some View {

    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            ForEach(animals) { animal in
              NavigationLink(
                destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }//: Link
            }//: Loop
          }//: List
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink( destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItItemView(animal: animal)
                }//: LINK
              }//: LOOP
            }//: GRID
            .padding(10)
            .animation(.easeIn)
          }//: SCROLL
        }//: Condition
      }//: Group
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {

            Button(action: {
              print("List View Activate")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }

            // Grid view
            Button(action: {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          }//: HStack
        }//: BarItem
      }//: ToolBar
    }//: Navigation
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
