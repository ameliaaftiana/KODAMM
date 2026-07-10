import Foundation

struct CoopMember: Identifiable {
    let id: String
    let name: String
    let memberId: String
    let phone: String
    let isActive: Bool
    let avatarImage: String
}

struct RepaymentItem: Identifiable {
    let id: String
    let title: String
    let date: String
    let amount: Double
    let isCompleted: Bool
}

struct CoopLoan: Identifiable {
    let id: String
    let borrowerName: String
    let borrowerAvatar: String
    let status: String
    let remainingAmount: Double
    let totalAmount: Double
    let purpose: String
    let period: String
    let repayments: [RepaymentItem]
}

struct CoopOrder: Identifiable {
    let id: String
    let orderNumber: String
    let productName: String
    let buyerUsername: String
    let status: OrderStatus
    let quantityKg: Int
    let deadline: String
    let requestDate: String
    let totalRevenue: Double
    let imageName: String
}
