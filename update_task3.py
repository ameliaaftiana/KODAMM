import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/task.md"
with open(filepath, "r") as f:
    content = f.read()

content = content.replace("- [ ] Create `MemberCommodityRequestDetailView.swift` and `MemberCertificateDetailView.swift`.", "- [x] Create `MemberCommodityRequestDetailView.swift` and `MemberCertificateDetailView.swift`.")

with open(filepath, "w") as f:
    f.write(content)
print("Updated task.md")
