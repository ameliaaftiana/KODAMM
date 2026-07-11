import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/BuyerCartView.swift"
with open(filepath, "r") as f:
    content = f.read()

# Fix Stepper
old_stepper = """                            // Stepper
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
                                    Text("\\(item.wrappedValue.quantity)")
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
                            .padding(.vertical, 8)"""

new_stepper = """                            // Stepper
                            HStack(spacing: 12) {
                                Button {
                                    if item.wrappedValue.quantity > 0 {
                                        item.wrappedValue.quantity -= 10
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                        .font(.system(size: 14))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                
                                VStack(spacing: 0) {
                                    Text("\\(item.wrappedValue.quantity)")
                                        .font(KODAMFonts.heading(.subheadline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("kg")
                                        .font(.system(size: 8))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                
                                Button {
                                    item.wrappedValue.quantity += 10
                                } label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 14))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)"""

content = content.replace(old_stepper, new_stepper)

# Fix Checkout Bottom Bar
old_bottom = """                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("TOTAL ESTIMASI")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Rp \\(Int(totalPrice).formattedWithSeparator())")
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Button {
                        // Checkout action
                    } label: {
                        Text("Checkout (\\(totalItemsSelected) Produk)")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)"""

new_bottom = """                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("TOTAL ESTIMASI")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Rp \\(Int(totalPrice).formattedWithSeparator())")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Button {
                        // Checkout action
                    } label: {
                        Text("Checkout (\\(totalItemsSelected) Produk)")
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)"""

content = content.replace(old_bottom, new_bottom)

with open(filepath, "w") as f:
    f.write(content)
print("Updated BuyerCartView")
