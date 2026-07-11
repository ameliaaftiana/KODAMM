# KODAM (Koperasi Dari Masyarakat)

## Executive Summary
KODAM is an AI-driven digital cooperative platform that transforms village cooperatives from mere trading middlemen into hubs of transparent commodity quality data, laboratory certification, and Revenue-Based Financing (RBF). 

This project is developed for the **Hackathon Digital Cooperatives Expo 2026** (Kementerian Koperasi RI).

**Commodity Focus**: Green Coffee Beans (Biji Kopi) with specialty grading (SNI 01-2907-2008 & SCA standard: moisture ~10-12%, defect beans, cupping score 85+).

## App Screenshots

<p align="center">
  <img src="Images/iPhone%2017%20Pro%20Silver.png" width="22%" />
  <img src="Images/iPhone%2017%20Pro%20Silver%20(1).png" width="22%" />
  <img src="Images/iPhone%2017%20Pro%20Silver%20(2).png" width="22%" />
  <img src="Images/iPhone%2017%20Pro%20Silver%20(3).png" width="22%" />
</p>

## System Requirements
*   **Operating System**: macOS 14.0+ (for development)
*   **Target Device OS**: iOS 17.0+
*   **IDE**: Xcode 15.0 or later
*   **Device Requirements**: iPhone or iPad with camera access (for the Dual-Mode Camera Scanner)
*   **Frameworks Used**: SwiftUI, SwiftData, Swift Charts, Observation, AVFoundation, Vision, CoreML

## Installation Instructions
1.  **Clone the Repository**
    ```bash
    git clone https://github.com/username/KODAMM.git
    cd KODAMM
    ```
2.  **Open the Project**
    Open `KODAMM.xcodeproj` using Xcode 15.0 or later.
3.  **Resolve Dependencies**
    Let Xcode automatically resolve any Swift Package Manager dependencies.
4.  **Configure Signing & Capabilities**
    Select your Development Team in the Signing & Capabilities tab for the KODAMM target. Ensure Camera permissions are correctly set in the `Info.plist` (already configured).
5.  **Build and Run**
    Select your target device or simulator (running iOS 17.0+) and press `Cmd + R` to build and run the application.

## Architecture Overview

KODAM is built with a 100% Native SwiftUI front-end, utilizing the Observation framework and SwiftData for live local persistence (Optimistic UI Cache) that provides a 0 ms rendering experience. 

The core philosophy of the application is "1 Dusun = 1 Koperasi", ensuring that every village has exactly one registered Cooperative that acts as the quality assurance and trade aggregator for local farmers.

### The 4-Role Ecosystem

The ecosystem relies on four major interconnected roles:

1.  **USER / BUYER**: B2B buyers sourcing verified green coffee beans.
2.  **KOPERASI DUSUN**: The village cooperative aggregating coffee lots.
3.  **LABORATORIUM MITRA**: Accredited labs testing physical, chemical, and halal parameters.
4.  **MEMBERS**: Farmers managing their produce and tracking their RBF.

```mermaid
graph TD
    subgraph Ecosystem: 1 Dusun = 1 Koperasi
        Koperasi[KOPERASI DUSUN]
        Members[MEMBERS / FARMERS]
        Lab[LABORATORIUM MITRA]
        Buyer[USER / BUYER]

        Members -- Submit Coffee Produce --> Koperasi
        Koperasi -- Request Certification --> Lab
        Lab -- Provide Lab Results & Certificate --> Koperasi
        Koperasi -- Sell Verified Coffee Lots --> Buyer
        Buyer -- Revenue-Based Financing --> Koperasi
        Koperasi -- Distribute RBF & Support --> Members
    end
```

## Apple Technology Stack Highlights

*   **100% Native SwiftUI & Observation**: Complete modern UI implementation designed for iOS 17.0+.
*   **SwiftData**: Used as the local Optimistic UI cache for instantaneous 0ms screen rendering.
*   **AVFoundation + Vision + CoreML (Dual-Mode Camera Scanner)**:
    *   **Barcode Scanner**: Instantly detects packaging barcodes via `VNDetectBarcodesRequest` to display the Digital Quality Passport card.
    *   **Buyer Random Spot-Check Scanner**: Employs a Two-Step Hybrid Bean Quality Detection Pipeline (YOLO Object Detector + Traditional ML Classifier) to verify grading compliance against SNI 01-2907-2008.
*   **Swift Charts**: Visualizes KODAM Revenue-Based Financing (tracking cooperative growth ledgers) and cupping score radar/bar charts.
*   **Sensory Feedback**: Embeds native Apple haptics (`.sensoryFeedback(.impact)`) on crucial actions for an elevated sensory experience.

## Local-First Philosophy
The application adheres to a local-first philosophy to minimize cloud dependency, ensuring that all actions that can be performed locally are handled natively on-device, offering resilience and speed without sacrificing necessary cloud synchronizations for ledger reporting.
