import 'package:flutter/material.dart';
import 'main.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  const DashboardPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E3A8A),
              Color(0xFF3B82F6),
              Color(0xFF60A5FA),
              Color(0xFF93C5FD),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Saludo y avatar
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Text(
                        userName.isNotEmpty ? userName[0].toUpperCase() : '',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola, $userName',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Bienvenido a tu banco',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomePage()),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Tarjeta de saldo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saldo disponible',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '€ 2.350,75',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.white.withOpacity(0.7)),
                          const SizedBox(width: 8),
                          const Text(
                            'Cuenta principal',
                            style: TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                // Accesos rápidos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _QuickAction(
                      icon: Icons.send_rounded,
                      label: 'Transferir',
                      color: Colors.blue[100]!,
                      onTap: () {},
                    ),
                    _QuickAction(
                      icon: Icons.add_circle_outline,
                      label: 'Ingresar',
                      color: Colors.green[100]!,
                      onTap: () {},
                    ),
                    _QuickAction(
                      icon: Icons.history,
                      label: 'Movimientos',
                      color: Colors.orange[100]!,
                      onTap: () {},
                    ),
                    _QuickAction(
                      icon: Icons.settings,
                      label: 'Ajustes',
                      color: Colors.purple[100]!,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                // Movimientos recientes
                const Text(
                  'Movimientos recientes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _TransactionItem(
                  icon: Icons.arrow_downward_rounded,
                  color: Colors.green,
                  title: 'Nómina',
                  date: '23 Jun 2024',
                  amount: '+€1.200,00',
                ),
                _TransactionItem(
                  icon: Icons.shopping_cart,
                  color: Colors.red,
                  title: 'Supermercado',
                  date: '22 Jun 2024',
                  amount: '-€54,30',
                ),
                _TransactionItem(
                  icon: Icons.phone_iphone,
                  color: Colors.blue,
                  title: 'Pago móvil',
                  date: '21 Jun 2024',
                  amount: '-€20,00',
                ),
                _TransactionItem(
                  icon: Icons.restaurant,
                  color: Colors.orange,
                  title: 'Restaurante',
                  date: '20 Jun 2024',
                  amount: '-€32,50',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _QuickAction({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF1E3A8A), size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String date;
  final String amount;
  const _TransactionItem({required this.icon, required this.color, required this.title, required this.date, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amount.startsWith('+') ? Colors.greenAccent : Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 