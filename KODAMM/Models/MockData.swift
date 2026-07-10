import Foundation

// MARK: - ============================================================
// MARK: - SAMPLE DATA
// MARK: - ============================================================

enum SampleData {

    // MARK: Filter Origins
    static let filterOrigins: [FilterOrigin] = [
        FilterOrigin(id: "all", name: "Semua Asal"),
        FilterOrigin(id: "gayo", name: "Gayo"),
        FilterOrigin(id: "bajawa", name: "Bajawa"),
        FilterOrigin(id: "toraja", name: "Toraja"),
        FilterOrigin(id: "pengalengan", name: "Pengalengan"),
    ]

    // MARK: Lab Certificates
    static let gayoCertificate = LabCertificate(
        id: "cert-001",
        certCode: "KODAM-CERT-2026-01",
        barcodeString: "KODAM-GAYO-2026-001",
        moisturePercent: 11.2,
        densityGml: 0.68,
        defectCount: 4,
        sniGrade: "Grade 1",
        isHalalCertified: true,
        halalCertificateNumber: "ID-HALAL-2023-882",
        tanyakanPadaAiContext: "Lot kopi hijau Gayo Organic Washed dari Koperasi Gayo menunjukkan kadar air 11.2% yang ideal untuk penyimpanan jangka panjang. Densitas 0.68 g/ml menandakan biji berukuran konsisten. Hanya 4 defect per 300g menunjukkan kualitas sortasi premium.",
        scaTotal: 86.25,
        scaRasa: 8.75,
        scaKeseimbangan: 8.50,
        scaBody: 8.0,
        scaKeasaman: 8.75,
        scaAroma: 9.0,
        scaAftertaste: 8.5
    )

    static let bajawaCertificate = LabCertificate(
        id: "cert-002",
        certCode: "KODAM-CERT-2026-02",
        barcodeString: "KODAM-BJW-2026-042",
        moisturePercent: 10.8,
        densityGml: 0.71,
        defectCount: 2,
        sniGrade: "Grade 1",
        isHalalCertified: true,
        halalCertificateNumber: "ID-HALAL-2023-997",
        tanyakanPadaAiContext: "Lot kopi Bajawa Ngada Natural menampilkan profil fruity dan wine-like yang khas. Dengan kadar air 10.8% dan hanya 2 defect, lot ini memenuhi standar ekspor premium.",
        scaTotal: 88.0,
        scaRasa: 9.0,
        scaKeseimbangan: 8.75,
        scaBody: 8.5,
        scaKeasaman: 9.0,
        scaAroma: 9.25,
        scaAftertaste: 8.75
    )

    static let torajaCertificate = LabCertificate(
        id: "cert-003",
        certCode: "KODAM-CERT-2026-03",
        barcodeString: "KODAM-TRJ-2026-015",
        moisturePercent: 11.5,
        densityGml: 0.65,
        defectCount: 6,
        sniGrade: "Grade 2",
        isHalalCertified: true,
        halalCertificateNumber: "ID-HALAL-2024-112",
        tanyakanPadaAiContext: "Lot Toraja Sapan Minanga menunjukkan karakter earthy dan herbal yang khas. Kadar air 11.5% masih dalam batas SNI. Defect 6 biji memerlukan perhatian pada proses sortasi.",
        scaTotal: 84.5,
        scaRasa: 8.25,
        scaKeseimbangan: 8.0,
        scaBody: 8.75,
        scaKeasaman: 8.25,
        scaAroma: 8.5,
        scaAftertaste: 8.0
    )
    
    static let kintamaniCertificate = LabCertificate(
        id: "cert-004",
        certCode: "KODAM-CERT-2026-04",
        barcodeString: "KODAM-KINT-2026-002",
        moisturePercent: 11.0,
        densityGml: 0.69,
        defectCount: 3,
        sniGrade: "Grade 1",
        isHalalCertified: true,
        halalCertificateNumber: "ID-HALAL-2024-150",
        tanyakanPadaAiContext: "Lot kopi Kintamani Washed memiliki aroma citrus yang kuat. Kadar air 11.0% dan defect 3 biji menjadikannya kopi grade spesialti yang sangat baik.",
        scaTotal: 85.5,
        scaRasa: 8.5,
        scaKeseimbangan: 8.5,
        scaBody: 8.0,
        scaKeasaman: 9.0,
        scaAroma: 8.75,
        scaAftertaste: 8.25
    )

    // MARK: Coffee Lots
    static let coffeeLots: [CoffeeLot] = [
        CoffeeLot(
            id: "lot-001",
            cooperativeCode: "KOP-GAYO-001",
            title: "Gayo Organic Washed",
            originDusun: "Takengon",
            province: "Aceh Tengah",
            processType: "Washed",
            pricePerKg: 185000,
            availableKg: 500,
            cuppingScore: 86.5,
            sniGrade: "Grade 1",
            isHalalCertified: true,
            imageName: "gayo_beans",
            labCertificate: gayoCertificate
        ),
        CoffeeLot(
            id: "lot-002",
            cooperativeCode: "KOP-BJW-042",
            title: "Bajawa Ngada Natural",
            originDusun: "Flores",
            province: "Nusa Tenggara Timur",
            processType: "Natural",
            pricePerKg: 215000,
            availableKg: 300,
            cuppingScore: 88.0,
            sniGrade: "Grade 1",
            isHalalCertified: true,
            imageName: "bajawa_beans",
            labCertificate: bajawaCertificate
        ),
        CoffeeLot(
            id: "lot-003",
            cooperativeCode: "KOP-TRJ-015",
            title: "Toraja Sapan Minanga",
            originDusun: "Rantepao",
            province: "Sulawesi Selatan",
            processType: "Honey",
            pricePerKg: 175000,
            availableKg: 250,
            cuppingScore: 84.5,
            sniGrade: "Grade 2",
            isHalalCertified: true,
            imageName: "toraja_beans",
            labCertificate: torajaCertificate
        ),
        CoffeeLot(
            id: "lot-004",
            cooperativeCode: "KOP-GAYO-002",
            title: "Gayo Highland Reserve",
            originDusun: "Bener Meriah",
            province: "Aceh Tengah",
            processType: "Washed",
            pricePerKg: 225000,
            availableKg: 150,
            cuppingScore: 89.0,
            sniGrade: "Grade 1",
            isHalalCertified: true,
            imageName: "gayo_reserve",
            labCertificate: gayoCertificate
        ),
        CoffeeLot(
            id: "lot-005",
            cooperativeCode: "KOP-PLG-008",
            title: "Malabar Natural Lot B",
            originDusun: "Pengalengan",
            province: "Jawa Barat",
            processType: "Natural",
            pricePerKg: 155000,
            availableKg: 400,
            cuppingScore: 82.0,
            sniGrade: "Grade 2",
            isHalalCertified: true,
            imageName: "malabar_beans",
            labCertificate: nil
        ),
        CoffeeLot(
            id: "lot-006",
            cooperativeCode: "KOP-KINT-002",
            title: "Bali Kintamani Washed",
            originDusun: "Kintamani",
            province: "Bali",
            processType: "Washed",
            pricePerKg: 165000,
            availableKg: 200,
            cuppingScore: 85.5,
            sniGrade: "Grade 1",
            isHalalCertified: true,
            imageName: "kintamani_beans",
            labCertificate: kintamaniCertificate
        )
    ]

    // MARK: Orders
    static let orders: [Order] = [
        Order(
            id: "ord-001",
            orderNumber: "KD-8823",
            productName: "Gayo Permata\nLot A",
            status: .inTransit,
            quantityKg: 250,
            estimatedDate: "Oct 12",
            totalPrice: 46250000,
            imageName: "gayo_beans",
            cooperativeName: "Koperasi Gayo"
        ),
        Order(
            id: "ord-002",
            orderNumber: "KD-8791",
            productName: "Lintong Nihuta\nReserve",
            status: .processing,
            quantityKg: 100,
            estimatedDate: "Oct 15",
            totalPrice: 21500000,
            imageName: "lintong_beans",
            cooperativeName: "Koperasi Lintong"
        ),
        Order(
            id: "ord-003",
            orderNumber: "KD-8650",
            productName: "Bajawa Ngada\nNatural",
            status: .completed,
            quantityKg: 200,
            estimatedDate: "Sep 28",
            totalPrice: 35000000,
            imageName: "bajawa_beans",
            cooperativeName: "Koperasi Bajawa"
        ),
        Order(
            id: "ord-004",
            orderNumber: "KD-8902",
            productName: "Bali Kintamani\nWashed",
            status: .processing,
            quantityKg: 150,
            estimatedDate: "Oct 20",
            totalPrice: 24750000,
            imageName: "kintamani_beans",
            cooperativeName: "Koperasi Kintamani"
        )
    ]

    // MARK: Chat Conversations
    static let chatConversations: [ChatConversation] = [
        ChatConversation(
            id: "chat-001",
            name: "Koperasi Gayo",
            lastMessage: "Halo, stok Gayo Arabika kami ...",
            timestamp: "14:20",
            unreadCount: 2,
            isOnline: true,
            avatarSystemName: "person.crop.circle.fill",
            isRead: false
        ),
        ChatConversation(
            id: "chat-002",
            name: "Koperasi Bajawa",
            lastMessage: "Terima kasih atas pesanannya! ...",
            timestamp: "09:15",
            unreadCount: 0,
            isOnline: false,
            avatarSystemName: "person.crop.circle.fill",
            isRead: true
        ),
        ChatConversation(
            id: "chat-003",
            name: "Toraja Bean Co.",
            lastMessage: "Apakah Bapak butuh sampel u...",
            timestamp: "Kemarin",
            unreadCount: 1,
            isOnline: false,
            avatarSystemName: "t.circle.fill",
            isRead: false
        ),
        ChatConversation(
            id: "chat-004",
            name: "Lab Uji Kualitas",
            lastMessage: "Hasil cupping test untuk lot B-4...",
            timestamp: "Senin",
            unreadCount: 0,
            isOnline: false,
            avatarSystemName: "flask.fill",
            isRead: true
        ),
        ChatConversation(
            id: "chat-005",
            name: "Koperasi Kintamani",
            lastMessage: "Kami siap mengirimkan pesanan ...",
            timestamp: "Baru saja",
            unreadCount: 1,
            isOnline: true,
            avatarSystemName: "person.crop.circle.fill",
            isRead: false
        )
    ]

    // MARK: Chat Messages (for detail view)
    static let chatMessages: [ChatMessage] = [
        ChatMessage(
            id: "msg-001",
            text: "Halo! Ya, lot Gayo Highland washed siap diekspor minggu depan. Kami baru saja menyelesaikan analisis kelembaban.",
            isFromMe: false,
            timestamp: "10:42",
            isRead: true,
            attachment: nil
        ),
        ChatMessage(
            id: "msg-002",
            text: "Kabar baik. Bisakah Anda membagikan laporan kualitas terbaru? Roaster kami menanyakan skor cup spesifik sebelum kami menyelesaikan PO.",
            isFromMe: true,
            timestamp: "10:45",
            isRead: true,
            attachment: nil
        ),
        ChatMessage(
            id: "msg-003",
            text: "Tentu. Saya telah melampirkan dokumen micro-lot terverifikasi di bawah ini. Skornya 86.5 dengan notes teh hitam dan bergamot.",
            isFromMe: false,
            timestamp: "10:48",
            isRead: true,
            attachment: ChatAttachment(
                fileName: "Lot_GAYO_042_Report.pdf",
                subtitle: "Laporan Q-Grader Terverifikasi",
                fileSize: "2.4 MB",
                fileType: "Dokumen PDF"
            )
        ),
    ]

    // MARK: Reviews
    static let reviews: [CoffeeReview] = [
        CoffeeReview(
            id: "rev-001",
            reviewerName: "Budi Roaster",
            reviewerSubtitle: "Roaster Spesialis",
            rating: 5.0,
            text: "Kualitas green bean benar-benar konsisten. Notes green apple-nya sektor banget saat di roast mesti pakai..."
        ),
        CoffeeReview(
            id: "rev-002",
            reviewerName: "Sari Cafe",
            reviewerSubtitle: "Pemilik Kedai Kopi",
            rating: 4.8,
            text: "Suka dengan sistem transparansi RBF-nya. Asyik semua dan terasa dampaknya untuk buat..."
        ),
        CoffeeReview(
            id: "rev-003",
            reviewerName: "Ahmad Barista",
            reviewerSubtitle: "Kepala Barista",
            rating: 5.0,
            text: "Profil rasa yang sangat clean dan bright. Cocok untuk pour over dan espresso blend premium kami."
        ),
        CoffeeReview(
            id: "rev-004",
            reviewerName: "Cinta Kopi",
            reviewerSubtitle: "Penikmat Kopi",
            rating: 4.9,
            text: "Luar biasa, pengiriman cepat dan kualitas beans terjaga. Sangat merekomendasikan supplier ini."
        )
    ]

    // MARK: RBF Info
    static let rbfInfo = RBFTransparencyInfo(
        totalContributionPercent: 15,
        pricePerKg: 27750,
        farmerCooperativeSharePercent: 80,
        farmerCooperativeSharePerKg: 148000,
        rbfRepaymentPercent: 15,
        rbfRepaymentPerKg: 27750,
        rbfRepaymentLabel: "Masjid Halilur"
    )

    // MARK: Lab Data
    static let labRequests: [LabRequest] = [
        LabRequest(
            id: "req-001",
            reqNumber: "#REQ-042",
            title: "Kopi Arabika - Lot A",
            dateSubmitted: "24 Okt 2023",
            cooperative: "Koperasi Tani Makmur",
            variety: "Arabika Gayo",
            sampleWeight: "5 kg",
            testTypes: ["Fisik", "Kimia", "SCA"],
            imageName: "gayo_beans"
        ),
        LabRequest(
            id: "req-002",
            reqNumber: "#REQ-043",
            title: "Kakao Fermentasi",
            dateSubmitted: "25 Okt 2023",
            cooperative: "Koperasi Sejahtera",
            variety: "Trinitario",
            sampleWeight: "3 kg",
            testTypes: ["Fisik", "Organoleptik"],
            imageName: "toraja_beans"
        )
    ]

    static let labProcessingItems: [LabProcessingItem] = [
        LabProcessingItem(
            id: "proc-001",
            sampleNumber: "#SMP-2023-405",
            title: "Gayo Highland Batch #405",
            cooperative: "Koperasi Tani Makmur",
            variety: "Arabika Typica",
            weight: "250g",
            dateSubmitted: "12 Okt 2023",
            dateReceived: "14 Okt 2023",
            status: "Uji Profil Rasa",
            imageName: "gayo_beans"
        ),
        LabProcessingItem(
            id: "proc-002",
            sampleNumber: "#SMP-2023-406",
            title: "Mandailing Estate Reserve",
            cooperative: "Koperasi Mandailing Jaya",
            variety: "Sigararutang",
            weight: "150g",
            dateSubmitted: "15 Okt 2023",
            dateReceived: "18 Okt 2023",
            status: "Analisis Fisik",
            imageName: "bajawa_beans"
        ),
        LabProcessingItem(
            id: "proc-003",
            sampleNumber: "#SMP-2023-407",
            title: "Toraja Sapan Premium",
            cooperative: "Koperasi Toraja Sejahtera",
            variety: "Lini S",
            weight: "500g",
            dateSubmitted: "18 Okt 2023",
            dateReceived: "19 Okt 2023",
            status: "Uji Kadar Air",
            imageName: "toraja_beans"
        )
    ]

    // MARK: Cooperative Mock Data
    static let coopMembers: [CoopMember] = [
        CoopMember(id: "1", name: "Budi Santoso", memberId: "KOP-2023-001", phone: "+62 812 3456 7890", isActive: true, avatarImage: "person.circle.fill"),
        CoopMember(id: "2", name: "Siti Aminah", memberId: "KOP-2023-042", phone: "+62 813 9876 5432", isActive: true, avatarImage: "person.circle.fill"),
        CoopMember(id: "3", name: "Agus Setiawan", memberId: "KOP-2022-115", phone: "+62 856 1234 9876", isActive: false, avatarImage: "person.circle.fill"),
        CoopMember(id: "4", name: "Reza Pratama", memberId: "KOP-2024-018", phone: "+62 811 5555 2222", isActive: true, avatarImage: "person.circle.fill"),
        CoopMember(id: "5", name: "Diana Susanti", memberId: "KOP-2021-089", phone: "+62 812 9988 7766", isActive: true, avatarImage: "person.circle.fill"),
        CoopMember(id: "6", name: "Joko Widodo", memberId: "KOP-2023-112", phone: "+62 811 1111 2222", isActive: true, avatarImage: "person.circle.fill")
    ]

    static let coopOrders: [CoopOrder] = [
        CoopOrder(id: "o1", orderNumber: "ORD-8892-A", productName: "Kopi Arabika Premium", buyerUsername: "@warungkopi", status: .inTransit, quantityKg: 500, deadline: "30 Okt", requestDate: "24 Okt", totalRevenue: 12500000, imageName: "gayo_beans"),
        CoopOrder(id: "o2", orderNumber: "ORD-8893-B", productName: "Kopi Arabika Premium", buyerUsername: "@kedaikopikita", status: .processing, quantityKg: 120, deadline: "02 Nov", requestDate: "25 Okt", totalRevenue: 4200000, imageName: "gayo_beans"),
        CoopOrder(id: "o3", orderNumber: "ORD-8894-C", productName: "Kopi Robusta Fine", buyerUsername: "@robusta_lover", status: .completed, quantityKg: 300, deadline: "15 Okt", requestDate: "10 Okt", totalRevenue: 9000000, imageName: "toraja_beans")
    ]

    static let coopLoans: [CoopLoan] = [
        CoopLoan(
            id: "l1",
            borrowerName: "Budi Santoso",
            borrowerAvatar: "person.circle.fill",
            status: "Aktif",
            remainingAmount: 12500000,
            totalAmount: 25000000,
            purpose: "Pembelian Pupuk Subsidi Musim Tanam 1",
            period: "12 Bulan (Okt 2023 - Sep 2024)",
            repayments: [
                RepaymentItem(id: "r1", title: "Pembayaran Bulan 2", date: "15 Nov 2023", amount: 2083333, isCompleted: false),
                RepaymentItem(id: "r2", title: "Pembayaran Bulan 1", date: "15 Okt 2023", amount: 2083333, isCompleted: true),
                RepaymentItem(id: "r3", title: "Pencairan Dana", date: "01 Okt 2023", amount: 25000000, isCompleted: true)
            ]
        ),
        CoopLoan(
            id: "l2",
            borrowerName: "Siti Aminah",
            borrowerAvatar: "person.circle.fill",
            status: "Aktif",
            remainingAmount: 5000000,
            totalAmount: 10000000,
            purpose: "Perbaikan Mesin Pengupas Kopi",
            period: "6 Bulan (Sep 2023 - Feb 2024)",
            repayments: [
                RepaymentItem(id: "r4", title: "Pembayaran Bulan 3", date: "15 Des 2023", amount: 1666666, isCompleted: false),
                RepaymentItem(id: "r5", title: "Pembayaran Bulan 2", date: "15 Nov 2023", amount: 1666666, isCompleted: true),
                RepaymentItem(id: "r6", title: "Pembayaran Bulan 1", date: "15 Okt 2023", amount: 1666666, isCompleted: true)
            ]
        )
    ]

    // MARK: Member Requests
    static let memberRequests: [MemberCommodityRequest] = [
        MemberCommodityRequest(id: "req-01", memberName: "Budi Santoso", memberAvatar: "person.circle.fill", variety: "Arabica Gayo", quantityKg: 500, processType: "Full Washed", dateSubmitted: "12 Okt 2026", status: .pending),
        MemberCommodityRequest(id: "req-02", memberName: "Siti Rahma", memberAvatar: "person.crop.circle.fill", variety: "Arabica Gayo", quantityKg: 200, processType: "Natural", dateSubmitted: "11 Okt 2026", status: .testing),
        MemberCommodityRequest(id: "req-03", memberName: "Agus Setiawan", memberAvatar: "person.circle", variety: "Arabica Gayo", quantityKg: 150, processType: "Honey", dateSubmitted: "09 Okt 2026", status: .tested),
        MemberCommodityRequest(id: "req-04", memberName: "Joko Widodo", memberAvatar: "person.circle.fill", variety: "Robusta Temanggung", quantityKg: 300, processType: "Natural", dateSubmitted: "13 Okt 2026", status: .pending)
    ]
    
    // MARK: Coop Lab Tests
    static let coopLabTests: [CoopLabTestItem] = [
        CoopLabTestItem(id: "test-01", reqNumber: "LAB-26-001", variety: "Arabica Gayo - Full Washed", dateSubmitted: "10 Okt 2026", status: "Selesai", certificate: gayoCertificate),
        CoopLabTestItem(id: "test-02", reqNumber: "LAB-26-002", variety: "Arabica Gayo - Natural", dateSubmitted: "12 Okt 2026", status: "Diproses", certificate: nil),
        CoopLabTestItem(id: "test-03", reqNumber: "LAB-26-003", variety: "Arabica Bali - Washed", dateSubmitted: "14 Okt 2026", status: "Menunggu", certificate: nil)
    ]
}