import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF007245);
    const textDark = Color(0xFF111827);
    const textGray = Color(0xFF6B7280);
    const borderColor = Color(0xFFE5E7EB);
    const bgCard = Color(0xFFF9FAFB);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textDark),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            // --- HEADER AVATAR & NAMA ---
            Center(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'DP',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Destri Putra M',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: bgCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor),
                    ),
                    child: const Text(
                      'NIM: 2024320064',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textGray),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // --- SECTION 1: DATA AKADEMIK ---
            _buildSectionHeader('Informasi Akademik'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  _buildProfileTile(Icons.school_outlined, 'Program Studi', 'Sistem Informasi'),
                  const Divider(height: 1, color: borderColor),
                  _buildProfileTile(Icons.account_balance_outlined, 'Perguruan Tinggi', 'Bina Insani University'),
                  const Divider(height: 1, color: borderColor),
                  _buildProfileTile(Icons.email_outlined, 'Email Kampus', 'destripm123@gmail.com'),
                  const Divider(height: 1, color: borderColor),
                  _buildProfileTile(Icons.verified_outlined, 'Status Akun', 'Aktif / Mahasiswa', valueColor: primaryGreen),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- SECTION 2: BANTUAN & TENTANG ---
            _buildSectionHeader('Aplikasi & Bantuan'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  _buildActionTile(Icons.headset_mic_outlined, 'Hubungi Layanan Sarpras', () {}),
                  const Divider(height: 1, color: borderColor),
                  _buildActionTile(Icons.shield_outlined, 'Kebijakan Privasi & Ketentuan', () {}),
                  const Divider(height: 1, color: borderColor),
                  _buildActionTile(Icons.info_outline_rounded, 'Versi Aplikasi', () {}, trailingText: 'v1.0.0'),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // --- TOMBOL KELUAR (LOGOUT) ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: const Icon(Icons.logout_rounded, color: Color(0xFFEF4444), size: 18),
                label: const Text(
                  'Keluar dari Akun',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFCA5A5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Header Subjudul
  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }

  // Tile Data Profil
  Widget _buildProfileTile(IconData icon, String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF6B7280)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? const Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  // Tile Tombol Aksi
  Widget _buildActionTile(IconData icon, String label, VoidCallback onTap, {String? trailingText}) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: Icon(icon, size: 18, color: const Color(0xFF6B7280)),
      title: Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF111827))),
      trailing: trailingText != null
          ? Text(trailingText, style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)))
          : const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF9CA3AF)),
    );
  }

  // Dialog Konfirmasi Keluar
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Konfirmasi Keluar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        content: const Text('Apakah Anda yakin ingin keluar dari akun CampusCare?', style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              elevation: 0,
            ),
            child: const Text('Ya, Keluar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}