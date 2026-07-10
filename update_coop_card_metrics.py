import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cooperative/CoopOrderCard.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """                    // Metrics
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Total Pendapatan")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            Text(order.totalRevenue.formattedRupiah())
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Kuantitas & Deadline")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            HStack(spacing: 4) {
                                Text("\(order.quantityKg) kg")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)

                                Text("|")
                                    .foregroundStyle(KODAMTheme.cardBorder)

                                Text(order.deadline)
                                    .font(KODAMFonts.body(.body))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                        }
                    }"""

replacement = """                    // Metrics
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Total Pendapatan")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            Text(order.totalRevenue.formattedRupiah())
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Kuantitas")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            Text("\(order.quantityKg) kg")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    // Deadline Section
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Deadline Pengiriman")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            
                        Spacer()
                        
                        Text(order.deadline)
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }"""

if target in content:
    new_content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(new_content)
    print("Successfully updated CoopOrderCard metrics.")
else:
    print("Target not found.")
