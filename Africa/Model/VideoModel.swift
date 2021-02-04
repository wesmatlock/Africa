import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
}

extension Video {
  var thumbnail: String {
    "video-\(id)"
  }
}
