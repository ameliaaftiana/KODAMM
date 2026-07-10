import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopLotsView.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """                        Button {
                            // Action to add new lot
                        } label: {
                            Image(systemName: "plus")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(.white)
                                .frame(width: 60, height: 60)
                                .background(KODAMTheme.oliveGreen)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
                        }"""

replacement = """                        NavigationLink(destination: CoopCommodityRequestsView()) {
                            Image(systemName: "plus")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(.white)
                                .frame(width: 60, height: 60)
                                .background(KODAMTheme.oliveGreen)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
                        }"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopLotsView.swift FAB")
else:
    print("Failed to find target in CoopLotsView.swift")
