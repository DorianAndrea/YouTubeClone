import Foundation

// MARK: - ChannelModel
struct ChannelModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Item]
    
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    // MARK: - Items
    struct Item: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        let statistics: Statistics?
        let brandingSettings : BrandingSettings?
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let title : String
            let description : String
            let thumbnails: Thumbnails
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let medium : Default?
                let high: Default?
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width : Int
                    let height: Int
                }
            }
        }
        
        // MARK: - Statistics
        struct Statistics: Decodable {
            let viewCount: String
            let subscriberCount: String
            let hiddenSubscriberCount: Bool
            let videoCount: String
        }
        
        struct BrandingSettings : Decodable{
            let image: Image
            
            struct Image : Decodable{
                let bannerExternalUrl : String
            }
        }
    }
}
