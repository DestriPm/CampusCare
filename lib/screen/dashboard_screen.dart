import 'package:flutter/material.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF007245);
    const textDark = Color(0xFF111827);
    const textGray = Color(0xFF6B7280);
    const borderColor = Color(0xFFE5E7EB);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            // Avatar 'DP'
            Container(
              height: 42,
              width: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'DP',
                  style: TextStyle(
                    color: primaryGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Destri Putra M',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'NIM 2024320064',
                    style: TextStyle(
                      fontSize: 10,
                      color: textGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: textGray, size: 22),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // --- GREETING ---
            const Text(
              'Halo, Destri Putra',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textDark,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Pantau laporan, jaga kenyamanan kampus.',
              style: TextStyle(fontSize: 13, color: textGray),
            ),

            const SizedBox(height: 20),

            // --- 3 STAT CARDS ---
            Row(
              children: [
                _buildStatCard(
                  label: 'Total Tiket',
                  value: '3',
                  dotColor: const Color(0xFF6B7280),
                  borderColor: borderColor,
                ),
                const SizedBox(width: 10),
                _buildStatCard(
                  label: 'Diproses',
                  value: '1',
                  dotColor: const Color(0xFFD97706),
                  borderColor: borderColor,
                ),
                const SizedBox(width: 10),
                _buildStatCard(
                  label: 'Selesai',
                  value: '1',
                  dotColor: const Color(0xFF16A34A),
                  borderColor: borderColor,
                ),
              ],
            ),

            const SizedBox(height: 18),

            // --- BUTTON BUAT LAPORAN ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  '+ Buat Laporan',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // --- SECTION HEADER ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Laporan terbaru',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                Text(
                  '3 laporan',
                  style: TextStyle(fontSize: 12, color: textGray),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // --- LIST CARD TIKET LAPORAN ---
            _buildReportCard(
              ticketCode: 'CC-0248',
              date: '25 Okt 2026',
              status: 'Diproses',
              statusColor: const Color(0xFFD97706),
              statusBg: const Color(0xFFFEF3C7),
              title: 'AC ruang kelas tidak dingin',
              location: 'Gedung B - Ruang 204',
              borderColor: borderColor,
            ),
            _buildReportCard(
              ticketCode: 'CC-0247',
              date: '24 Okt 2026',
              status: 'Diajukan',
              statusColor: const Color(0xFF475569),
              statusBg: const Color(0xFFF1F5F9),
              title: 'Lampu koridor mati',
              location: 'Perpustakaan - Lantai 2',
              borderColor: borderColor,
            ),
            _buildReportCard(
              ticketCode: 'CC-0231',
              date: '22 Okt 2026',
              status: 'Selesai',
              statusColor: const Color(0xFF16A34A),
              statusBg: const Color(0xFFDCFCE7),
              title: 'Keran wastafel bocor',
              location: 'Gedung A - Toilet lantai 1',
              borderColor: borderColor,
            ),

            const SizedBox(height: 16),

            // --- FOOTER HELPDESK CARD ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: const [
                  Icon(Icons.help_outline_rounded, size: 16, color: primaryGreen),
                  SizedBox(width: 8),
                  Text(
                    'Butuh bantuan?',
                    style: TextStyle(fontSize: 12, color: textDark),
                  ),
                  Spacer(),
                  Text(
                    'Hubungi helpdesk',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget Pembantu: Kartu Statistik
  static Widget _buildStatCard({
    required String label,
    required String value,
    required Color dotColor,
    required Color borderColor,
  }) {
    return Expanded(
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
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF4B5563),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Pembantu: Kartu Tiket
  static Widget _buildReportCard({
    required String ticketCode,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required String title,
    required String location,
    required Color borderColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              Text(
                '$ticketCode · $date',
                style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ),
              const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF9CA3AF)),
            ],
          ),
        ],
      ),
    );
  }
}