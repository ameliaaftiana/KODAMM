import os

# 1. CoopLotCard.swift
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cooperative/CoopLotCard.swift"
with open(filepath, "r") as f:
    content = f.read()

old_lot_image = """                // Image Placeholder
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                KODAMTheme.coffeeGradientStart,
                                KODAMTheme.coffeeGradientEnd
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 140)
                    .overlay {
                        Image(systemName: "leaf.fill")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(.white.opacity(0.1))
                            .rotationEffect(.degrees(-15))
                    }"""

new_lot_image = """                Image(lot.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 140)
                    .clipped()"""

if old_lot_image in content:
    content = content.replace(old_lot_image, new_lot_image)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopLotCard.swift")

# 2. CoopOrderCard.swift
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cooperative/CoopOrderCard.swift"
with open(filepath, "r") as f:
    content = f.read()

old_order_image = """                // Product Image Banner
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .fill(KODAMTheme.cardBorder)
                        .frame(height: 140)
                        .overlay {
                            // Mocking the image using a gradient since asset might not exist
                            LinearGradient(
                                colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        }"""

new_order_image = """                // Product Image Banner
                ZStack(alignment: .topTrailing) {
                    Image(order.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 140)
                        .clipped()"""

if old_order_image in content:
    content = content.replace(old_order_image, new_order_image)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopOrderCard.swift")

# 3. CoopLotDetailView.swift
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopLotDetailView.swift"
with open(filepath, "r") as f:
    content = f.read()

old_detail_image = """    // MARK: - Hero Image Section
    private var heroImageSection: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientMid, KODAMTheme.coffeeGradientEnd],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 280)
                .overlay {
                    // Decorative coffee plant overlay
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "leaf.fill")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(.white.opacity(0.08))
                                .rotationEffect(.degrees(25))
                                .offset(x: 20, y: 20)
                        }
                    }
                }"""

new_detail_image = """    // MARK: - Hero Image Section
    private var heroImageSection: some View {
        ZStack(alignment: .bottomLeading) {
            Image(lot.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 280)
                .clipped()
                .overlay(Color.black.opacity(0.1))"""

if old_detail_image in content:
    content = content.replace(old_detail_image, new_detail_image)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopLotDetailView.swift")

