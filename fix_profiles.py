import os

files = [
    "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/UserProfileView.swift",
    "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/MemberPortal/MemberProfileView.swift",
    "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/LabPortal/LabProfileView.swift",
]

for filepath in files:
    if os.path.exists(filepath):
        with open(filepath, "r") as f:
            content = f.read()
            
        old_button = """                        // Logout
                        Button {
                            // Logout action
                        } label: {
                            Text("Keluar")"""
                            
        new_button = """                        // Logout
                        Button {
                            NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                        } label: {
                            Text("Keluar")"""
                            
        if old_button in content:
            content = content.replace(old_button, new_button)
            with open(filepath, "w") as f:
                f.write(content)
            print(f"Updated {os.path.basename(filepath)}")
        else:
            print(f"Keluar button not found in {os.path.basename(filepath)} with expected format.")
    else:
        print(f"File not found: {filepath}")

# For CoopProfileView, add a Keluar button at the end
coop_file = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopProfileView.swift"
with open(coop_file, "r") as f:
    content = f.read()

if "NotificationCenter.default.post" not in content:
    end_of_vstack = """                            }
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.vertical, KODAMTheme.spacingMD)
                }
            }
            .navigationBarHidden(true)
        }
    }"""
    
    new_end = """                            }
                        }
                        
                        // Logout
                        Button {
                            NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                        } label: {
                            Text("Keluar")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.destructiveRed)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingLG)
                                .background(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                                        .fill(KODAMTheme.destructiveRed.opacity(0.1))
                                )
                        }
                        .padding(.top, KODAMTheme.spacingMD)
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.vertical, KODAMTheme.spacingMD)
                }
            }
            .navigationBarHidden(true)
        }
    }"""
    
    content = content.replace(end_of_vstack, new_end)
    with open(coop_file, "w") as f:
        f.write(content)
    print("Updated CoopProfileView.swift")

