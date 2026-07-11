import os

# 1. Update CoopDashboardView.swift
filepath_dashboard = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopDashboardView.swift"
with open(filepath_dashboard, "r") as f:
    content_dashboard = f.read()

content_dashboard = content_dashboard.replace("NavigationLink(destination: CoopMembersListView())", "NavigationLink(destination: CoopMembersView())")
with open(filepath_dashboard, "w") as f:
    f.write(content_dashboard)
print("Updated CoopDashboardView.swift")

# 2. Update CoopCommodityRequestsView.swift
filepath_req = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopCommodityRequestsView.swift"
with open(filepath_req, "r") as f:
    content_req = f.read()

target_header = """                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Text("Permintaan Anggota")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Spacer()
                    
                    // Invisible placeholder for alignment
                    Image(systemName: "chevron.left")
                        .opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                // Tabs
                TextTabRow(tabs: tabs, selectedTab: $selectedTab, justified: true)
                    .padding(.top, KODAMTheme.spacingMD)"""

replacement_header = """                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingSM)
                
                Text("Permintaan Anggota")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.bottom, KODAMTheme.spacingMD)
                
                // Tabs
                TextTabRow(tabs: tabs, selectedTab: $selectedTab, justified: true)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingMD)"""

if target_header in content_req:
    content_req = content_req.replace(target_header, replacement_header)
    with open(filepath_req, "w") as f:
        f.write(content_req)
    print("Updated CoopCommodityRequestsView.swift")
else:
    print("Failed to find target in CoopCommodityRequestsView.swift")

# 3. Delete CoopMembersListView.swift
try:
    os.remove("/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopMembersListView.swift")
    print("Deleted CoopMembersListView.swift")
except Exception as e:
    print(f"Failed to delete CoopMembersListView.swift: {e}")

