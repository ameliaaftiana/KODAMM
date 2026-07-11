import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/walkthrough.md"
with open(filepath, "r") as f:
    content = f.read()

addition = """
## Login and Role Selection
I have introduced a new **Login Page** (`LoginView.swift`) that acts as the entry point for the entire application.
- **Dynamic Routing**: The application now dynamically routes you to the correct portal based on your selected role.
- **Roles Available**:
    - Buyer (Cart Icon) -> Routes to `UserPortalMainView`
    - Koperasi (Building Icon) -> Routes to `CooperativePortalMainView`
    - Anggota (People Icon) -> Routes to `MemberPortalMainView`
    - Lab (Flask Icon) -> Routes to `LabPortalMainView`
- **UI Design**: Features a visually appealing 2x2 grid for selecting roles. The selected role highlights in KODAM's Emerald Green. It includes stylish text fields for Email and Password, and a bold Amber Gold "Masuk" (Login) button.
- **State Management**: Updated `ContentView.swift` to handle state changes seamlessly and route the user to their designated portal immediately upon logging in.
"""

with open(filepath, "a") as f:
    f.write(addition)
print("Updated walkthrough.md")
