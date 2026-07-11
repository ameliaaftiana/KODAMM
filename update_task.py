import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/task.md"
with open(filepath, "r") as f:
    content = f.read()

content = content.replace("- [ ] Create directory `KODAMM/Views/MemberPortal`.", "- [x] Create directory `KODAMM/Views/MemberPortal`.")
content = content.replace("- [ ] Create `MemberPortalMainView.swift`.", "- [x] Create `MemberPortalMainView.swift`.")
content = content.replace("- [ ] Create `MemberDashboardView.swift`.", "- [x] Create `MemberDashboardView.swift`.")

with open(filepath, "w") as f:
    f.write(content)
print("Updated task.md")
