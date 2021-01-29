import SwiftUI

struct VideoListView: View {

  // MARK: - Properties
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  let hapticImapact = UIImpactFeedbackGenerator(style: .medium)

  // MARK: - Body
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          VideoListItemView(video: item)
            .padding(.vertical, 8)
        }//: Loop
      }//: List
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            videos.shuffle()
            hapticImapact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }//: Navigation
  }
}

// MARK: Preview
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
      .previewDevice("iPhone 12 Pro")
  }
}
