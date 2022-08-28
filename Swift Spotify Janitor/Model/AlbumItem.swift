
import Foundation

struct AlbumItem: Codable{
    var addedDate : String
    var album : Int
    
    private enum CodingKeys : String, CodingKey{
        case addedDate = "added_at", album
    }
}
