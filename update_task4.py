import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/task.md"
with open(filepath, "r") as f:
    content = f.read()

content = content.replace("- [ ] Create `MemberLoansView.swift` and `MemberLoanDetailView.swift`.", "- [x] Create `MemberLoansView.swift` and `MemberLoanDetailView.swift`.")

with open(filepath, "w") as f:
    f.write(content)
print("Updated task.md")
