import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cooperative/CoopOrderCard.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """                        }
                    }
                }
                .padding(KODAMTheme.spacingLG)"""

replacement = """                        }
                    }

                    if order.status == .inTransit {
                        Button(action: {
                            // Terima action
                        }) {
                            Text("Terima")
                                .font(KODAMFonts.heading(.headline))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingMD)
                                .background(KODAMTheme.oliveGreen)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                        .padding(.top, KODAMTheme.spacingSM)
                    } else if order.status == .processing {
                        Button(action: {
                            // Lacak action
                        }) {
                            Text("Lacak")
                                .font(KODAMFonts.heading(.headline))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingMD)
                                .background(KODAMTheme.espressoAccent)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                        .padding(.top, KODAMTheme.spacingSM)
                    }
                }
                .padding(KODAMTheme.spacingLG)"""

if target in content:
    new_content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(new_content)
    print("Successfully updated CoopOrderCard.swift")
else:
    print("Could not find the target string in CoopOrderCard.swift")
