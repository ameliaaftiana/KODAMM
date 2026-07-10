import Foundation

struct LabRequest: Identifiable {
    let id: String
    let reqNumber: String
    let title: String
    let dateSubmitted: String
    let cooperative: String
    let variety: String
    let sampleWeight: String
    let testTypes: [String]
    let imageName: String
}

struct LabProcessingItem: Identifiable {
    let id: String
    let sampleNumber: String
    let title: String
    let cooperative: String
    let variety: String
    let weight: String
    let dateSubmitted: String
    let dateReceived: String
    let status: String
    let imageName: String
}
