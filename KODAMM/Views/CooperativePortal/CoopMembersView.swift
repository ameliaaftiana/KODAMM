import SwiftUI

struct CoopMembersView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""

    var filteredMembers: [CoopMember] {
        if searchText.isEmpty {
            return SampleData.coopMembers
        } else {
            return SampleData.coopMembers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()

            VStack(spacing: 0) {
                // Title
                Text("Daftar Anggota")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(KODAMTheme.textSecondary)
                    TextField("Cari anggota...", text: $searchText)
                        .font(KODAMFonts.body(.body))
                }
                .padding()
                .background(Color.white.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                .overlay(
                    RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                )
                .padding(KODAMTheme.spacingLG)

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: KODAMTheme.spacingMD) {
                        ForEach(filteredMembers) { member in
                            CoopMemberCard(member: member)
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.bottom, KODAMTheme.spacingXXL)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CoopMembersView()
}
