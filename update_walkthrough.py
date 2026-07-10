import os

filepath = "/Users/ameliaaftiana/.gemini/antigravity-ide/brain/87c4fe76-37db-400f-944d-42c2ec22916d/walkthrough.md"
with open(filepath, "r") as f:
    content = f.read()

target = """### 3. Detailed Request Pipeline (`CoopCommodityRequestDetailView.swift`)
- This is a completely new page that displays the full context of a single member request.
- **Waiting for Lab State**: If the request is currently in the testing phase (simulated by `.testing`), a "Pilih Laboratorium" section appears. This provides AI recommendations for the best nearby labs (e.g., Lab KODAM Gayo, Lab Penguji Kopi Aceh) complete with estimated processing times and prices.
- **Verified State**: If the lab test has finished (simulated by `.tested`), a success banner appears indicating the certificate is ready, and a large **"Jual Sekarang" (Sell Now)** button is displayed."""

replacement = """### 3. Detailed Request Pipeline (`CoopCommodityRequestDetailView.swift`)
- This is a completely new page that displays the full context of a single member request.
- **Visual Improvements**: It now features a beautiful full-width hero image at the top of the page, and a dedicated "Deskripsi Tambahan" (Additional Description) section within the main information card to provide more context about the item.
- **Waiting for Lab State**: If the request is currently in the testing phase (simulated by `.testing`), a "Pilih Laboratorium" section appears. This provides AI recommendations for the best nearby labs (e.g., Lab KODAM Gayo, Lab Penguji Kopi Aceh) complete with estimated processing times and prices.
- **Verified State**: If the lab test has finished (simulated by `.tested`), a success banner appears indicating the certificate is ready, and a large **"Jual Sekarang" (Sell Now)** button is displayed."""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated walkthrough.md")
else:
    print("Could not find target in walkthrough.md")
