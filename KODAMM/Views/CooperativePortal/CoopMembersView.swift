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
                // Back Button Header
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingMD)
                
                // Title and Total Member Count
                HStack(alignment: .bottom) {
                    Text("Daftar Anggota")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Spacer()
                    
                    Text("\(SampleData.coopMembers.count) Anggota")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .padding(.bottom, 6) // Align baseline visually
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingMD)

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
