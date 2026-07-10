import Foundation

struct CoopLabTestItem: Identifiable {
    let id: String
    let reqNumber: String
    let variety: String
    let dateSubmitted: String
    let status: String
    let certificate: LabCertificate?
}
