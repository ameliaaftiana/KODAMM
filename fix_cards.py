import os

# Fix CoffeeLotCard
coffee_card_path = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Cards/CoffeeLotCard.swift"
with open(coffee_card_path, "r") as f:
    content = f.read()

# Replace the Button wrapper and the placeholder image
# First, find the Button wrapper and remove it
content = content.replace("""    var body: some View {
        Button {
            onTap?()
        } label: {
            VStack(alignment: .leading, spacing: 0) {""", """    var body: some View {
        VStack(alignment: .leading, spacing: 0) {""")

# We also need to remove the closing bracket of the Button. The Button ends at the very end of the body.
# Wait, let's just do a regex or just replace the last closing bracket.
# It ends with:
#         }
#         .buttonStyle(.plain)
#     }
# }
# But looking at CoffeeLotCard.swift: it probably doesn't have .buttonStyle(.plain) there.

