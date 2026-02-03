import 'package:flutter/material.dart';

class CertificateTile extends StatelessWidget {
  const CertificateTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: const [
          Icon(Icons.school, color: Colors.blue),
          SizedBox(width: 12),
          Expanded(child: Text("UI/UX Certificate")),
          Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}
