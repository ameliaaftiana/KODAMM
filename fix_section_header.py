import os

section_header_file = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Components/Common/SectionHeader.swift"
with open(section_header_file, "r") as f:
    content = f.read()

# Make the title bolder
content = content.replace(
    ".font(KODAMFonts.heading(.title3))",
    ".font(KODAMFonts.heading(.title3).weight(.bold))"
)

with open(section_header_file, "w") as f:
    f.write(content)
print("Updated SectionHeader.swift")
