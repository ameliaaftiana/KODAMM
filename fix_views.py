import os

# 1. Update CoopMembersView.swift
members_file = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopMembersView.swift"
with open(members_file, "r") as f:
    members_content = f.read()

# Replace KODAMNavigationBar with Title
nav_bar_target = 'KODAMNavigationBar(title: "Daftar Anggota", showAvatar: false)'
new_title = '''// Title
                Text("Daftar Anggota")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .frame(maxWidth: .infinity, alignment: .leading)'''

if nav_bar_target in members_content:
    members_content = members_content.replace(nav_bar_target, new_title)
    with open(members_file, "w") as f:
        f.write(members_content)
    print("Updated CoopMembersView.swift")

# 2. Update CoopOrdersView.swift
orders_file = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopOrdersView.swift"
with open(orders_file, "r") as f:
    orders_content = f.read()

nav_bar_target_orders = 'KODAMNavigationBar(title: "Pesanan", showAvatar: false)'
new_title_orders = '''// Title
                Text("Pesanan")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .frame(maxWidth: .infinity, alignment: .leading)'''

if nav_bar_target_orders in orders_content:
    orders_content = orders_content.replace(nav_bar_target_orders, new_title_orders)

# Replace the custom tab bar with TextTabRow
old_tabs_block = '''                    // Custom Tab Bar
                    HStack(spacing: 0) {
                        ForEach(tabs, id: \.self) { tab in
                            Button(action: {
                                withAnimation {
                                    selectedTab = tab
                                }
                            }) {
                                VStack(spacing: 12) {
                                    Text(tab)
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(selectedTab == tab ? KODAMTheme.espressoAccent : KODAMTheme.textSecondary)

                                    Rectangle()
                                        .fill(selectedTab == tab ? KODAMTheme.espressoAccent : Color.clear)
                                        .frame(height: 2)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, KODAMTheme.spacingMD)
                    .background(Color.white.opacity(0.5))'''

new_tabs_block = '''                    // Text Tab Row
                    TextTabRow(
                        tabs: tabs,
                        selectedTab: $selectedTab
                    )
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingMD)
                    .padding(.bottom, KODAMTheme.spacingSM)'''

if old_tabs_block in orders_content:
    orders_content = orders_content.replace(old_tabs_block, new_tabs_block)
    with open(orders_file, "w") as f:
        f.write(orders_content)
    print("Updated CoopOrdersView.swift")


# 3. Update CoopProfileView.swift
profile_file = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopProfileView.swift"
with open(profile_file, "r") as f:
    profile_content = f.read()

# We want to change the title for each section to be bold.
# In SectionHeader.swift, .font(KODAMFonts.heading(.title3)) is already used. 
# But in CoopProfileView, some titles are not using SectionHeader, or if they are, the user wants them bold.
# "also for each section on it please make it different with bold on the title maybe for each sections."
# Let's change the first section (Header Profile Card) which has: Text("Koperasi Tani Makmur Sejahtera").font(KODAMFonts.heading(.title1))
# And "Status Koperasi" which has: Text("Status Koperasi").font(KODAMFonts.heading(.title3)) -> change to SectionHeader!
# Let's see if we can just make sure all sections use SectionHeader or use .weight(.bold) explicitly.

profile_content = profile_content.replace(
    '''                                Text("Status Koperasi")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)''',
    '''                                Text("Status Koperasi")
                                    .font(KODAMFonts.heading(.title3).weight(.bold))
                                    .foregroundStyle(KODAMTheme.textPrimary)'''
)

profile_content = profile_content.replace(
    '''                                    Text("Koperasi Tani Makmur Sejahtera")
                                        .font(KODAMFonts.heading(.title1))''',
    '''                                    Text("Koperasi Tani Makmur Sejahtera")
                                        .font(KODAMFonts.heading(.title1).weight(.bold))'''
)

# Replace SectionHeader calls to wrap them with something that makes them bolder?
# Actually SectionHeader uses .heading(.title3). We can't change it inside CoopProfileView without changing the component.
# Let's change the component SectionHeader to use .weight(.bold).

with open(profile_file, "w") as f:
    f.write(profile_content)
print("Updated CoopProfileView.swift")
