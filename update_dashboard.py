import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopDashboardView.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """                            NavigationLink(destination: CoopLoansView()) {
                                HStack {
                                    Image(systemName: "person.2.fill")
                                    Text("Simpan Pinjam & Daftar Anggota")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }

                            NavigationLink(destination: CoopLoanDetailView(loan: SampleData.coopLoans[0])) {
                                HStack {
                                    Image(systemName: "doc.text.magnifyingglass")
                                    Text("Detail Peminjaman Aktif")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }"""

replacement = """                            NavigationLink(destination: CoopLoansView()) {
                                HStack {
                                    Image(systemName: "banknote.fill")
                                    Text("Simpan Pinjam")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }

                            NavigationLink(destination: CoopMembersListView()) {
                                HStack {
                                    Image(systemName: "person.3.fill")
                                    Text("Daftar Anggota")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopDashboardView.swift")
else:
    print("Could not find target in CoopDashboardView.swift")
