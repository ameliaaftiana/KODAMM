import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/walkthrough.md"
with open(filepath, "r") as f:
    content = f.read()

addition = """
## Member Portal (Petani / Anggota)

I have built the new **Member Portal** from scratch to empower individual cooperative members (farmers). You can preview this right now because I updated the app entry point (`ContentView`) to launch it!

### 1. Dashboard (`MemberDashboardView.swift`)
- Displays personalized greetings and ID.
- Shows financial metrics: Total Revenue and Active Loan balances using visually rich `GlassCard` components.
- Includes a horizontal scrollable "Recent Activity" section for quick links.

### 2. Commodity Requests (`MemberCommodityRequestsView.swift` & `MemberCommodityRequestCreateView.swift`)
- Displays a clean list of all commodities the farmer has submitted for cooperative assistance.
- A bold **`+`** button allows them to easily request a new sale.
- Submitting a new request opens a beautifully styled form (`MemberCommodityRequestCreateView`) with custom Pickers and TextFields.

### 3. Commodity Details & Certificate (`MemberCommodityRequestDetailView.swift` & `MemberCertificateDetailView.swift`)
- The detailed view shows exactly what stage the commodity is at (e.g., Pending, Processing, Tested).
- If the lab test is complete (`.tested`), a vibrant green button appears to view the **Lab Certificate**.
- The Certificate view highlights the SCA Score and SNI Grade.
- Features a **Tanya AI** chat interface where members can ask questions about their certificate (e.g., "What does an 84.5 score mean for my price?").

### 4. Loans (`MemberLoansView.swift` & `MemberLoanDetailView.swift`)
- Loans are organized clearly with a `TextTabRow` (Pengajuan, Diproses, Selesai).
- The Detail view breaks down the total amount, remaining balance with a progress bar, and a comprehensive checklist of past and upcoming repayment schedules.

### 5. Profile (`MemberProfileView.swift`)
- A centralized location for personal settings, bank accounts, and an eye-catching logout button.
"""

with open(filepath, "a") as f:
    f.write(addition)
print("Updated walkthrough.md")
