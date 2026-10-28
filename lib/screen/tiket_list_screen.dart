import 'package:flutter/material.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  int _selectedFilter = 0; // 0: Semua, 1: Diproses, 2: Selesai

  final List<Map<String, dynamic>> _tickets = [
    {
      'code': 'CC-0248',
      'date': '25 Okt 2026',
      'title': 'AC ruang kelas tidak dingin',
      'location': 'Gedung B - Ruang 204',
      'status': 'Diproses',
      'statusColor': Color(0xFFD97706),
      'statusBg': Color(0xFFFEF3C7),
    },
    {
      'code': 'CC-0247',
      'date': '24 Okt 2026',
      'title': 'Lampu koridor mati',
      'location': 'Perpustakaan - Lantai 2',
      'status': 'Diajukan',
      'statusColor': Color(0xFF475569),
      'statusBg': Color(0xFFF1F5F9),
    },
    {
      'code': 'CC-0231',
      'date': '22 Okt 2026',
      'title': 'Keran wastafel bocor',
      'location': 'Gedung A - Toilet lantai 1',
      'status': 'Selesai',
      'statusColor': Color(0xFF16A34A),
      'statusBg': Color(0xFFDCFCE7),
    },
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF007245);
    const textDark = Color(0xFF111827);
    const borderColor = Color(0xFFE5E7EB);

    // Logika filter sederhana
    final filteredTickets = _tickets.where((ticket) {
      if (_selectedFilter == 1) return ticket['status'] == 'Diproses';
      if (_selectedFilter == 2) return ticket['status'] == 'Selesai';
      return true; // Tampilkan Semua
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Daftar Tiket Saya',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textDark),
        ),
      ),
      body: Column(
        children: [
          // --- TAB FILTER (Semua / Diproses / Selesai) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterChip('Semua (3)', 0, primaryGreen),
                const SizedBox(width: 8),
                _buildFilterChip('Diproses (1)', 1, primaryGreen),
                const SizedBox(width: 8),
                _buildFilterChip('Selesai (1)', 2, primaryGreen),
              ],
            ),
          ),
          const Divider(color: borderColor, height: 16),

          // --- LIST TIKET ---
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: filteredTickets.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = filteredTickets[index];
                return Container(
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
                          Text(item['location'], style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String text, int index, Color activeColor) {
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
}