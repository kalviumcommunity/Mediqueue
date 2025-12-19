import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool joinedQueue = false;
  int _queuePosition = 15;
  int _estimatedWait = 25;
  bool _showQueueDetails = false;

  void _toggleQueueStatus() {
    setState(() {
      joinedQueue = !joinedQueue;
      if (!joinedQueue) {
        _showQueueDetails = false;
      }
    });
  }

  void _toggleQueueDetails() {
    if (joinedQueue) {
      setState(() {
        _showQueueDetails = !_showQueueDetails;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services_outlined, size: 28),
            SizedBox(width: 10),
            Text(
              'MediQueue',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0F7FF), Color(0xFFE6F3FF), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            isDesktop
                ? 48
                : isTablet
                ? 32
                : 20,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: joinedQueue
                    ? _queueActiveLayout(isTablet, isDesktop)
                    : _welcomeLayout(isTablet, isDesktop),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🌟 Welcome Layout (Not in queue)
  Widget _welcomeLayout(bool isTablet, bool isDesktop) {
    return Card(
      key: ValueKey('welcome'),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.blue.shade100, width: 1),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(
          isDesktop
              ? 48
              : isTablet
              ? 36
              : 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated Icon
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: isDesktop
                  ? 140
                  : isTablet
                  ? 120
                  : 100,
              height: isDesktop
                  ? 140
                  : isTablet
                  ? 120
                  : 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.medical_services,
                size: isDesktop
                    ? 70
                    : isTablet
                    ? 60
                    : 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: isDesktop
                  ? 40
                  : isTablet
                  ? 32
                  : 24,
            ),

            // Title
            Text(
              'Welcome to MediQueue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop
                    ? 36
                    : isTablet
                    ? 30
                    : 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A237E),
                height: 1.2,
              ),
            ),
            SizedBox(height: 16),

            // Description
            Text(
              'Skip the waiting room hassle. Join the digital queue and get notified when it\'s your turn.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop
                    ? 18
                    : isTablet
                    ? 16
                    : 15,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
            SizedBox(
              height: isDesktop
                  ? 48
                  : isTablet
                  ? 40
                  : 32,
            ),

            // Benefits Grid
            _buildBenefitsGrid(isTablet, isDesktop),
            SizedBox(
              height: isDesktop
                  ? 48
                  : isTablet
                  ? 40
                  : 32,
            ),

            // Join Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _toggleQueueStatus,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isDesktop
                        ? 20
                        : isTablet
                        ? 18
                        : 16,
                  ),
                  backgroundColor: Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward, size: 22),
                    SizedBox(width: 12),
                    Text(
                      'Join Queue Now',
                      style: TextStyle(
                        fontSize: isDesktop
                            ? 20
                            : isTablet
                            ? 18
                            : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Quick Stats
            SizedBox(height: 32),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('Avg. Wait', '20 mins', Icons.access_time),
                  _buildStatItem('Today', '128 patients', Icons.people),
                  _buildStatItem('Accuracy', '95%', Icons.verified),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📊 Benefits Grid
  Widget _buildBenefitsGrid(bool isTablet, bool isDesktop) {
    final benefits = [
      {
        'icon': Icons.timer_off,
        'title': 'No Waiting',
        'desc': 'Wait from anywhere',
      },
      {
        'icon': Icons.notifications_active,
        'title': 'Live Updates',
        'desc': 'Real-time notifications',
      },
      {
        'icon': Icons.qr_code_scanner,
        'title': 'QR Check-in',
        'desc': 'Quick registration',
      },
      {
        'icon': Icons.analytics,
        'title': 'Live Tracking',
        'desc': 'Track your position',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop
            ? 4
            : isTablet
            ? 2
            : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 1.2 : 1.5,
      ),
      itemCount: benefits.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade100.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                benefits[index]['icon'] as IconData,
                size: 32,
                color: Color(0xFF2196F3),
              ),
              SizedBox(height: 12),
              Text(
                benefits[index]['title'] as String,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                benefits[index]['desc'] as String,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  // 📱 Queue Active Layout
  Widget _queueActiveLayout(bool isTablet, bool isDesktop) {
    return Card(
      key: ValueKey('queue'),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.green.shade100, width: 1),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(
          isDesktop
              ? 48
              : isTablet
              ? 36
              : 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              width: isDesktop
                  ? 140
                  : isTablet
                  ? 120
                  : 100,
              height: isDesktop
                  ? 140
                  : isTablet
                  ? 120
                  : 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: isDesktop
                    ? 70
                    : isTablet
                    ? 60
                    : 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: isDesktop
                  ? 40
                  : isTablet
                  ? 32
                  : 24,
            ),

            // Success Title
            Text(
              'You\'re in the Queue!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop
                    ? 36
                    : isTablet
                    ? 30
                    : 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2E7D32),
                height: 1.2,
              ),
            ),
            SizedBox(height: 8),

            // Subtitle
            Text(
              'We\'ll notify you when it\'s your turn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop
                    ? 18
                    : isTablet
                    ? 16
                    : 15,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              height: isDesktop
                  ? 48
                  : isTablet
                  ? 40
                  : 32,
            ),

            // Queue Stats
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Position
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQueueStat(
                        'Your Position',
                        '#$_queuePosition',
                        Icons.emoji_people,
                        Colors.blue,
                      ),
                      _buildQueueStat(
                        'Est. Wait Time',
                        '$_estimatedWait min',
                        Icons.access_time,
                        Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Progress Bar
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Queue Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${((_queuePosition / 50) * 100).toInt()}% complete',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _queuePosition / 50,
                          minHeight: 12,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _toggleQueueDetails,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.blue.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _showQueueDetails
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: Colors.blue.shade700,
                        ),
                        SizedBox(width: 8),
                        Text(
                          _showQueueDetails ? 'Hide Details' : 'View Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _toggleQueueStatus,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.red.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Leave Queue',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Expandable Details
            if (_showQueueDetails) ...[
              SizedBox(height: 24),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Queue Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildDetailRow('Doctor', 'Dr. Sarah Johnson'),
                    _buildDetailRow('Department', 'General Medicine'),
                    _buildDetailRow('Room', 'Consultation Room 3B'),
                    _buildDetailRow(
                      'Token',
                      'MEDQ-${DateTime.now().millisecond}',
                    ),
                    _buildDetailRow(
                      'Joined',
                      '${TimeOfDay.now().format(context)}',
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // 📊 Stat Item Widget
  Widget _buildStatItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.blue.shade700),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.blue.shade900,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  // 📊 Queue Stat Widget
  Widget _buildQueueStat(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  // 📝 Detail Row Widget
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
