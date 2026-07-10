import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Common/FilterChipRow.swift"
with open(filepath, "r") as f:
    content = f.read()

# We need to replace the entire TextTabRow struct.
import re
# Find where TextTabRow starts and ends
start_idx = content.find("struct TextTabRow: View {")

# Find the end of TextTabRow. It ends just before `#Preview`
end_idx = content.find("#Preview {", start_idx)

new_text_tab_row = """struct TextTabRow: View {
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
"""

if start_idx != -1 and end_idx != -1:
    new_content = content[:start_idx] + new_text_tab_row + "\n" + content[end_idx:]
    with open(filepath, "w") as f:
        f.write(new_content)
    print("Updated TextTabRow")
else:
    print("Could not find TextTabRow boundaries.")

# Now update CoopOrdersView to use justified = true
coop_orders_path = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopOrdersView.swift"
with open(coop_orders_path, "r") as f:
    coop_orders_content = f.read()

coop_orders_content = coop_orders_content.replace(
    "TextTabRow(\n                        tabs: tabs,\n                        selectedTab: $selectedTab\n                    )",
    "TextTabRow(\n                        tabs: tabs,\n                        selectedTab: $selectedTab,\n                        justified: true\n                    )"
)

with open(coop_orders_path, "w") as f:
    f.write(coop_orders_content)
print("Updated CoopOrdersView")
