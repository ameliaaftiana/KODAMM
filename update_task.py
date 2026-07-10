import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/task.md"
with open(filepath, "r") as f:
    content = f.read()

content = content.replace("- [ ] Update `MockData.swift` and `CoopDashboardView.swift` to add dashboard entry point.", "- [x] Update `MockData.swift` and `CoopDashboardView.swift` to add dashboard entry point.")
content = content.replace("- [ ] Update `CoopCommodityRequestsView.swift` to include tabs (Permintaan Baru, Diproses) and logic for \"Accept\" vs \"Detail\".", "- [x] Update `CoopCommodityRequestsView.swift` to include tabs (Permintaan Baru, Diproses) and logic for \"Accept\" vs \"Detail\".")
content = content.replace("- [ ] Create `CoopCommodityRequestDetailView.swift` (Lab Selection & Jual Sekarang states).", "- [x] Create `CoopCommodityRequestDetailView.swift` (Lab Selection & Jual Sekarang states).")
content = content.replace("- [ ] Update `CoopCreateProductView.swift` to carry over all data and look like buyer detail view, with AI pricing based on certificate.", "- [x] Update `CoopCreateProductView.swift` to carry over all data and look like buyer detail view, with AI pricing based on certificate.")
content = content.replace("- [ ] Verify build and styling.", "- [x] Verify build and styling.")

with open(filepath, "w") as f:
    f.write(content)
print("Updated task.md")
