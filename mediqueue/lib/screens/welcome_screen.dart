import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool joinedQueue = false;
  int queuePosition = 15;
  int estimatedWait = 25;
  bool showQueueDetails = false;

  void toggleQueueStatus() {
    setState(() {
      joinedQueue = !joinedQueue;
      showQueueDetails = false;
    });
  }

  void toggleDetails() {
    if (joinedQueue) {
      setState(() {
        showQueueDetails = !showQueueDetails;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isTablet = width > 600;
        final isDesktop = width > 900;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.medical_services_outlined),
                SizedBox(width: 8),
                Text(
                  'MediQueue',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF0F7FF), Color(0xFFE6F3FF), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop
                          ? 48
                          : isTablet
                          ? 32
                          : 16,
                      vertical: 24,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: joinedQueue
                          ? queueActiveLayout(isTablet, isDesktop)
                          : welcomeLayout(isTablet, isDesktop),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ================= WELCOME LAYOUT =================

  Widget welcomeLayout(bool isTablet, bool isDesktop) {
    return Card(
      key: const ValueKey('welcome'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.blue.shade100),
      ),
      elevation: 0,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            isDesktop
                ? 48
                : isTablet
                ? 36
                : 24,
          ),
          child: Column(
            children: [
              buildHeroIcon(Colors.blue),
              const SizedBox(height: 24),
              Text(
                'Welcome to MediQueue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop
                      ? 36
                      : isTablet
                      ? 30
                      : 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Skip the waiting room hassle. Join the digital queue and get notified when it’s your turn.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 16 : 14,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 32),
              buildBenefitsGrid(isTablet, isDesktop),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: toggleQueueStatus,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Join Queue Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              buildStatsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ================= QUEUE ACTIVE LAYOUT =================

  Widget queueActiveLayout(bool isTablet, bool isDesktop) {
    return Card(
      key: const ValueKey('queue'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.green.shade100),
      ),
      elevation: 0,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            isDesktop
                ? 48
                : isTablet
                ? 36
                : 24,
          ),
          child: Column(
            children: [
              buildHeroIcon(Colors.green),
              const SizedBox(height: 24),
              Text(
                "You're in the Queue!",
                style: TextStyle(
                  fontSize: isDesktop
                      ? 34
                      : isTablet
                      ? 28
                      : 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.green.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "We'll notify you when it's your turn",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 32),
              buildQueueStats(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: toggleDetails,
                      child: Text(
                        showQueueDetails ? 'Hide Details' : 'View Details',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: toggleQueueStatus,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade50,
                        foregroundColor: Colors.red.shade700,
                        elevation: 0,
                      ),
                      child: const Text('Leave Queue'),
                    ),
                  ),
                ],
              ),
              if (showQueueDetails) ...[
                const SizedBox(height: 24),
                buildDetailsCard(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ================= REUSABLE WIDGETS =================

  Widget buildHeroIcon(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.6)]),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.medical_services, size: 48, color: Colors.white),
    );
  }

  Widget buildBenefitsGrid(bool isTablet, bool isDesktop) {
    final benefits = [
      ('No Waiting', Icons.timer_off),
      ('Live Updates', Icons.notifications_active),
      ('QR Check-in', Icons.qr_code_scanner),
      ('Live Tracking', Icons.analytics),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: benefits.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 4 : 2,
        childAspectRatio: isDesktop
            ? 1.4
            : isTablet
            ? 1.6
            : 1.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (_, i) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(benefits[i].$2, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                benefits[i].$1,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildStatsSection() {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      alignment: WrapAlignment.spaceAround,
      children: const [
        _StatItem('20 mins', 'Avg Wait'),
        _StatItem('128', 'Patients'),
        _StatItem('95%', 'Accuracy'),
      ],
    );
  }

  Widget buildQueueStats() {
    return Row(
      children: [
        Expanded(child: _QueueBox('Position', '#$queuePosition')),
        const SizedBox(width: 16),
        Expanded(child: _QueueBox('Wait', '$estimatedWait min')),
      ],
    );
  }

  Widget buildDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Doctor: Dr. Sarah Johnson'),
          Text('Department: General Medicine'),
          Text('Room: 3B'),
        ],
      ),
    );
  }
}

// ================= SMALL WIDGETS =================

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _QueueBox extends StatelessWidget {
  final String title;
  final String value;

  const _QueueBox(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          Text(title),
        ],
      ),
    );
  }
}
