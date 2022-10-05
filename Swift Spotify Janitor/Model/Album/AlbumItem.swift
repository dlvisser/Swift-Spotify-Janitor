
import Foundation

struct AlbumItem: Codable{
    var addedDate : String
    var album : Album
    
    private enum CodingKeys : String, CodingKey{
        case addedDate = "added_at", album
    }
}
