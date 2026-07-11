import os

# Fix ChatRowCard.swift
chat_card = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cards/ChatRowCard.swift"
with open(chat_card, "r") as f:
    content = f.read()

content = content.replace("""    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: KODAMTheme.spacingMD) {""", """    var body: some View {
        HStack(spacing: KODAMTheme.spacingMD) {""")

content = content.replace("""        }
        .buttonStyle(.plain)
    }
}""", """    }
}""")

with open(chat_card, "w") as f:
    f.write(content)


# Fix CoffeeLotCard.swift
coffee_card = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cards/CoffeeLotCard.swift"
with open(coffee_card, "r") as f:
    content = f.read()

content = content.replace("""    var body: some View {
        Button {
            onTap?()
        } label: {
            VStack(alignment: .leading, spacing: 0) {""", """    var body: some View {
        VStack(alignment: .leading, spacing: 0) {""")

content = content.replace("""        }
        .buttonStyle(.plain)
    }
}""", """    }
}""")

# Also replace the coffee bean placeholder with real image
image_placeholder = """                    // Coffee bean image placeholder
                    RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                        .fill(
                            LinearGradient(
                                colors: [
                                    KODAMTheme.coffeeGradientStart,
                                    KODAMTheme.coffeeGradientEnd,
                                    KODAMTheme.coffeeGradientMid,
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 200)
                        .overlay {
                            // Texture pattern for coffee beans
                            Image(systemName: "leaf.fill")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(.white.opacity(0.1))
                                .rotationEffect(.degrees(-15))
                        }"""

new_image = """                    // Coffee bean image
                    Image(lot.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))"""

content = content.replace(image_placeholder, new_image)

with open(coffee_card, "w") as f:
    f.write(content)

print("Fixed both cards!")
