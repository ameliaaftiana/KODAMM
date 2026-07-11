import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/BuyerCartView.swift"

content = """import SwiftUI

// MARK: - Cart Item Model
struct CartItem: Identifiable {
    let id = UUID()
    var lot: CoffeeLot
    var quantity: Int
    var isSelected: Bool = true
}

// MARK: - Buyer Cart View
/// Shopping cart page showing selected commodity lots.
/// Styled to match the provided design.
struct BuyerCartView: View {
    @State private var cartItems: [CartItem] = [
        CartItem(lot: SampleData.coffeeLots[0], quantity: 250), // Gayo
        CartItem(lot: SampleData.coffeeLots[1], quantity: 100)  // Bajawa
    ]
    
    @State private var selectAll = true
    
    private var totalPrice: Double {
        cartItems.filter({ $0.isSelected }).reduce(0) { $0 + ($1.lot.pricePerKg * Double($1.quantity)) }
    }
    
    private var totalItemsSelected: Int {
        cartItems.filter({ $0.isSelected }).count
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Header
                        Text("Keranjang")
                            .font(KODAMFonts.heading(.title1))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, KODAMTheme.spacingLG)
                            .padding(.bottom, KODAMTheme.spacingXL)

                        // Cart Items
                        VStack(spacing: KODAMTheme.spacingXL) {
                            ForEach($cartItems) { $item in
                                cartItemSection(item: $item)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Dampak Pembiayaan (Impact Card)
                        impactCard()
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingXL)

                        Spacer(minLength: 160) // Space for bottom bar
                    }
                }

                // Bottom Floating Action Bar
                bottomBar()
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Subviews
    
    private func cartItemSection(item: Binding<CartItem>) -> some View {
        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
            // Cooperative Header
            HStack(spacing: 8) {
                Image(systemName: "storefront")
                    .font(.system(size: 16))
                    .foregroundStyle(KODAMTheme.textSecondary)
                Text(cooperativeName(for: item.wrappedValue.lot))
                    .font(KODAMFonts.heading(.title3))
                    .foregroundStyle(KODAMTheme.textPrimary)
            }
            .padding(.horizontal, 4)
            
            // Product Card
            VStack(spacing: 0) {
                // Image
                Image(item.wrappedValue.lot.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 140)
                    .clipped()
                
                // Content
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        Text(item.wrappedValue.lot.title)
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        Spacer()
                        
                        Button {
                            // Delete action
                        } label: {
                            Image(systemName: "trash")
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 4) {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.system(size: 10))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            Text("\(item.wrappedValue.lot.originDusun), \(item.wrappedValue.lot.province)")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                        
                        Text("ID: \(item.wrappedValue.lot.cooperativeCode)")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    
                    HStack(alignment: .bottom) {
                        HStack(alignment: .firstTextBaseline, spacing: 2) {
                            Text("Rp \(Int(item.wrappedValue.lot.pricePerKg).formattedWithSeparator())")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(KODAMTheme.amberGold)
                            Text("/ kg")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 12) {
                            // Checkbox
                            Button {
                                item.wrappedValue.isSelected.toggle()
                                checkSelectAllState()
                            } label: {
                                Image(systemName: item.wrappedValue.isSelected ? "checkmark.square.fill" : "square")
                                    .font(.system(size: 24))
                                    .foregroundStyle(item.wrappedValue.isSelected ? KODAMTheme.amberGold : KODAMTheme.textSecondary)
                            }
                            
                            // Stepper
                            HStack(spacing: 16) {
                                Button {
                                    if item.wrappedValue.quantity > 0 {
                                        item.wrappedValue.quantity -= 10
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                
                                VStack(spacing: 0) {
                                    Text("\(item.wrappedValue.quantity)")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("kg")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                
                                Button {
                                    item.wrappedValue.quantity += 10
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule().stroke(KODAMTheme.cardBorder, lineWidth: 1)
                            )
                        }
                    }
                }
                .padding(KODAMTheme.spacingMD)
                .background(Color.white.opacity(0.4))
            }
            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))
            .overlay(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                    .stroke(KODAMTheme.cardBorder, lineWidth: 1)
            )
        }
    }
    
    private func impactCard() -> some View {
        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
            HStack(alignment: .top, spacing: 16) {
                Circle()
                    .fill(KODAMTheme.emeraldGreen.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "leaf")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(KODAMTheme.emeraldGreen)
                    }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dampak Pembiayaan")
                        .font(KODAMFonts.heading(.title3))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Text("**12% dari total Anda** (Rp 6.192.000) secara langsung mendanai pembayaran Pembiayaan Berbasis Pendapatan KoperAI untuk koperasi desa Gayo dan Bajawa.")
                        .font(KODAMFonts.body(.bodySmall))
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .lineSpacing(4)
                }
            }
            
            VStack(spacing: 6) {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(KODAMTheme.warmIvoryDarker)
                            .frame(height: 8)
                        Capsule()
                            .fill(KODAMTheme.emeraldGreen)
                            .frame(width: geometry.size.width * 0.12, height: 8)
                    }
                }
                .frame(height: 8)
                
                HStack {
                    Text("PEMBAYARAN LANGSUNG")
                        .font(KODAMFonts.mono(.caption2))
                        .foregroundStyle(KODAMTheme.textSecondary)
                    Spacer()
                    Text("RP 6.192.000")
                        .font(KODAMFonts.mono(.caption2).weight(.bold))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
            }
            .padding(.top, 8)
        }
        .padding(KODAMTheme.spacingLG)
        .background(
            LinearGradient(
                colors: [Color(hex: "e8f5e9"), KODAMTheme.warmIvory],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))
        .overlay(
            RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                .stroke(KODAMTheme.emeraldGreen.opacity(0.3), lineWidth: 1)
        )
    }
    
    private func bottomBar() -> some View {
        VStack(spacing: 0) {
            Divider()
            
            VStack(spacing: KODAMTheme.spacingMD) {
                HStack {
                    Button {
                        selectAll.toggle()
                        for i in 0..<cartItems.count {
                            cartItems[i].isSelected = selectAll
                        }
                    } label: {
                        HStack {
                            Image(systemName: selectAll ? "checkmark.square.fill" : "square")
                                .font(.system(size: 20))
                                .foregroundStyle(selectAll ? KODAMTheme.amberGold : KODAMTheme.textSecondary)
                            Text("Pilih Semua")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                    }
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("TOTAL ESTIMASI")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Rp \(Int(totalPrice).formattedWithSeparator())")
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Button {
                        // Checkout action
                    } label: {
                        Text("Checkout (\(totalItemsSelected) Produk)")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .background(KODAMTheme.amberGold)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(KODAMTheme.warmIvory.opacity(0.95))
        }
    }
    
    // MARK: - Helpers
    
    private func checkSelectAllState() {
        selectAll = cartItems.allSatisfy { $0.isSelected }
    }
    
    private func cooperativeName(for lot: CoffeeLot) -> String {
        if lot.cooperativeCode.contains("GAYO") { return "Koperasi Gayo" }
        if lot.cooperativeCode.contains("BJW") { return "Koperasi Bajawa" }
        return "Koperasi \(lot.originDusun)"
    }
}

// Helper extension for number formatting
extension Int {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

#Preview {
    BuyerCartView()
}
"""

with open(filepath, "w") as f:
    f.write(content)

print("BuyerCartView fully rewritten.")
