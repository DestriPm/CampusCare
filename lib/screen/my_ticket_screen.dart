import 'package:flutter/material.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  int _selectedFilter = 0; // 0: Semua, 1: Diproses, 2: Selesai

  final List<Map<String, dynamic>> _tickets = [
    {
      'code': 'CC-0248',
      'date': '25 Okt 2026',
      'title': 'AC ruang kelas tidak dingin',
      'location': 'Gedung B - Ruang 204',
      'status': 'Diproses',
      'step': 2, // 1: Diajukan, 2: Diproses, 3: Selesai
      'statusColor': Color(0xFFD97706),
      'statusBg': Color(0xFFFEF3C7),
      'technicianNote': 'Teknisi Bpk. Joko sedang melakukan pengisian freon AC.',
    },
    {
      'code': 'CC-0247',
      'date': '24 Okt 2026',
      'title': 'Lampu koridor mati',
      'location': 'Perpustakaan - Lantai 2',
      'status': 'Diajukan',
      'step': 1,
      'statusColor': Color(0xFF475569),
      'statusBg': Color(0xFFF1F5F9),
      'technicianNote': 'Laporan diterima tim Sarpras. Menunggu giliran teknisi.',
    },
    {
      'code': 'CC-0231',
      'date': '22 Okt 2026',
      'title': 'Keran wastafel bocor',
      'location': 'Gedung A - Toilet lantai 1',
      'status': 'Selesai',
      'step': 3,
      'statusColor': Color(0xFF16A34A),
      'statusBg': Color(0xFFDCFCE7),
      'technicianNote': 'Keran air pipa utama telah diganti dengan part baru.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF007245);
    const textDark = Color(0xFF111827);
    const borderColor = Color(0xFFE5E7EB);

    final filteredTickets = _tickets.where((ticket) {
      if (_selectedFilter == 1) return ticket['status'] == 'Diproses';
      if (_selectedFilter == 2) return ticket['status'] == 'Selesai';
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Daftar Tiket & Progres',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textDark),
        ),
      ),
      body: Column(
        children: [
          // Filter Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterBtn('Semua (3)', 0, primaryGreen),
                const SizedBox(width: 8),
                _buildFilterBtn('Diproses (1)', 1, primaryGreen),
                const SizedBox(width: 8),
                _buildFilterBtn('Selesai (1)', 2, primaryGreen),
              ],
            ),
          ),
          const Divider(color: borderColor, height: 16),

          // List Tiket
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: filteredTickets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = filteredTickets[index];
                return GestureDetector(
                  onTap: () => _showProgressModal(context, item),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${item['code']} • ${item['date']}', style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: item['statusBg'], borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '• ${item['status']}',
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: item['statusColor']),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(item['title'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textDark)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF9CA3AF)),
                            const SizedBox(width: 4),
                            Expanded(child: Text(item['location'], style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)))),
                            const Text('Cek Progres >', style: TextStyle(fontSize: 11, color: primaryGreen, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBtn(String text, int index, Color activeColor) {
    final isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF4B5563),
          ),
        ),
      ),
    );
  }

  // MODAL BOTTOM SHEET: Menampilkan Timeline Progres Approval Perbaikan
  void _showProgressModal(BuildContext context, Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item['code']} - Progres Penanganan', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(item['title'], style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13)),
              const SizedBox(height: 20),

              // Timeline Stepper (Progres)
              _buildStep(1, 'Laporan Diajukan Mahasiswa', item['step'] >= 1),
              _buildStep(2, 'Diverifikasi & Sedang Ditangani Teknisi', item['step'] >= 2),
              _buildStep(3, 'Perbaikan Selesai & Ditutup Sarpras', item['step'] >= 3),

              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Catatan Teknisi:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF007245))),
                    const SizedBox(height: 4),
                    Text(item['technicianNote'], style: const TextStyle(fontSize: 12, color: Color(0xFF374151))),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStep(int stepNum, String title, bool isDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
            color: isDone ? const Color(0xFF007245) : Colors.grey[400],
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
              color: isDone ? const Color(0xFF111827) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}