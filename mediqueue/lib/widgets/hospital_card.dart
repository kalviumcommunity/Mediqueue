import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String name;
  final String distance;
  final String department;
  final String rating;
  final String waitTime;
  final VoidCallback onOpen;

  const HospitalCard({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.name,
    required this.distance,
    required this.department,
    required this.rating,
    required this.waitTime,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          // 🏥 ICON
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),

          const SizedBox(width: 14),

          // 📄 DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  'Department: $department',
                  style: const TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 6),

                // ⭐ Rating + ⏱ Time
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: 14),
                    const Icon(Icons.timer,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(waitTime,
                        style: const TextStyle(fontSize: 13)),
                  ],
                ),

                const SizedBox(height: 6),

                // ➕ EXTRA DETAILS (ADDED)
                Row(
                  children: const [
                    Icon(Icons.people,
                        size: 14, color: Colors.blue),
                    SizedBox(width: 4),
                    Text('25+ Doctors',
                        style: TextStyle(fontSize: 12)),
                    SizedBox(width: 12),
                    Icon(Icons.bed,
                        size: 14, color: Colors.green),
                    SizedBox(width: 4),
                    Text('120 Beds',
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          // 🔵 OPEN BUTTON
          ElevatedButton(
            onPressed: onOpen,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
