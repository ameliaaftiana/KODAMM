import SwiftUI

// MARK: - Filter Chip Row
/// Horizontally scrolling row of selectable filter pills.
struct FilterChipRow: View {
    let filters: [FilterOrigin]
    @Binding var selectedFilter: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: KODAMTheme.spacingSM) {
                ForEach(filters) { filter in
                    FilterChip(
                        title: filter.name,
                        isSelected: selectedFilter == filter.id
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedFilter = filter.id
                        }
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
        }
    }
}

// MARK: - Single Filter Chip
struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(KODAMFonts.body(.caption))
                .foregroundStyle(isSelected ? .white : KODAMTheme.textPrimary)
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.vertical, KODAMTheme.spacingSM)
                .background(
                    Capsule()
                        .fill(isSelected ? KODAMTheme.espressoDark : Color.clear)
                )
                .overlay(
                    Capsule()
                        .strokeBorder(
                            isSelected ? Color.clear : KODAMTheme.cardBorder,
                            lineWidth: 1
                        )
                )
        }
        .sensoryFeedback(.selection, trigger: isSelected)
    }
}

// MARK: - Text Tab Row (for orders)
/// Segmented tab filter row (used in orders: Semua, Sedang Proses, etc.)
struct TextTabRow: View {
    let tabs: [String]
    @Binding var selectedTab: String
    var justified: Bool = false

    var body: some View {
        if justified {
            HStack(spacing: 4) {
                ForEach(tabs, id: \.self) { tab in
                    tabButton(for: tab)
                }
            }
            .padding(KODAMTheme.spacingXS)
            .background(
                Capsule()
                    .fill(KODAMTheme.warmIvoryDarker)
            )
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(tabs, id: \.self) { tab in
                        tabButton(for: tab)
                    }
                }
                .padding(KODAMTheme.spacingXS)
                .background(
                    Capsule()
                        .fill(KODAMTheme.warmIvoryDarker)
                )
            }
        }
    }

    @ViewBuilder
    private func tabButton(for tab: String) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = tab
            }
        } label: {
            Text(tab)
                .font(KODAMFonts.body(.caption))
                .foregroundStyle(selectedTab == tab ? KODAMTheme.textPrimary : KODAMTheme.textSecondary)
                .padding(.horizontal, KODAMTheme.spacingMD)
                .padding(.vertical, KODAMTheme.spacingSM)
                .frame(maxWidth: justified ? .infinity : nil)
                .background(
                    Capsule()
                        .fill(selectedTab == tab ? KODAMTheme.cardWhite : Color.clear)
                        .shadow(
                            color: selectedTab == tab ? KODAMTheme.obsidianDark.opacity(0.08) : .clear,
                            radius: 4, x: 0, y: 1
                        )
                )
        }
        .sensoryFeedback(.selection, trigger: selectedTab)
    }
}

#Preview {
    VStack(spacing: 20) {
        FilterChipRow(
            filters: SampleData.filterOrigins,
            selectedFilter: .constant("all")
        )

        TextTabRow(
            tabs: ["Semua", "Sedang Proses", "Selesai", "Dibatalkan"],
            selectedTab: .constant("Sedang Proses")
        )
        .padding(.horizontal)
    }
    .padding(.vertical)
    .background(KODAMTheme.warmIvory)
}
