import 'package:flutter/material.dart';
import 'Pay.dart';

// ── Data ─────────────────────────────────────────────────────────────────────

const _tags = [
  'Souls-like', 'Action', 'RPG', 'Story-rich',
  'Singleplayer', 'Choices-matter', 'Difficult',
  'Steampunk', 'Dark fantasy',
];

const _features = [
  (
    title: 'A DARKLY ELEGANT AND CRUEL WORLD',
    body: 'Unearth the secrets of the city of Krat – a place soaked in the style of '
        'the Belle Epoque era which once thrived due to its puppet industry and now '
        'sees its streets covered in blood.',
  ),
  (
    title: 'BATTLE WITH TWISTED INSTRUMENTS',
    body: 'Develop a unique combat style to counter vicious enemies and terrain by '
        'weaving together dynamic weapon combinations, utilizing the Legion Arms, '
        'and activating new abilities.',
  ),
  (
    title: "WHAT'S IN A LIE?",
    body: 'There will be times when you will be confronted with choices where you can '
        'give comfort to others in sorrow or despair by lying…or you can choose to '
        'tell the truth.\n\nCarve your own path.',
  ),
  (
    title: 'A CLASSIC REIMAGINED',
    body: 'Experience the beloved fairy tale of Pinocchio reinterpreted as a dark, '
        'grim narrative that allows players to discover the secrets and symbols '
        'hidden within the world of Lies of P.',
  ),
];

const _minReqs = [
  'Requires a 64-bit processor and operating system',
  'OS: Windows 10 64bit',
  'PROCESSOR: AMD Ryzen 3 1200 / Intel Core i3-6300',
  'MEMORY: 8 GB RAM',
  'GRAPHICS: AMD Radeon RX 560 4GB / NVIDIA GeForce GTX 960 4GB',
  'DIRECTX: Version 12',
  'STORAGE: 50 GB available space',
];

const _recReqs = [
  'Requires a 64-bit processor and operating system',
  'OS: Windows 10 64bit',
  'PROCESSOR: AMD Ryzen 3 1200 / Intel Core i3-6300',
  'MEMORY: 16 GB RAM',
  'GRAPHICS: AMD Radeon RX 6500 XT 4GB / NVIDIA GeForce GTX 1660 6GB',
  'DIRECTX: Version 12',
  'STORAGE: 50 GB available space',
];

final _bodyStyle = TextStyle(
  color: Colors.white.withOpacity(0.7),
  fontSize: 13.5,
  height: 1.65,
);

// ── Entry point (no MaterialApp) ─────────────────────────────────────────────

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  bool _wishlisted = false;
  late final AnimationController _ac;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fade = CurvedAnimation(parent: _ac, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ac, curve: Curves.easeOutCubic));
    _ac.forward();
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _HeroBanner()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: _tags.map((t) => _Tag(label: t)).toList(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, color: Color(0xFFFFCC00), size: 16),
                          const SizedBox(width: 4),
                          const Text('4.6',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                          const SizedBox(width: 4),
                          Text('(2.4k reviews)',
                              style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    children: [
                      Expanded(child: _BuyButton()),
                      const SizedBox(width: 10),
                      _WishlistButton(
                        active: _wishlisted,
                        onTap: () => setState(() => _wishlisted = !_wishlisted),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 28)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(title: 'About this game'),
                      const SizedBox(height: 10),
                      Text(
                        'You are a puppet created by Geppetto who\'s caught in a web of '
                        'lies with unimaginable monsters and untrustworthy figures '
                        'standing between you and the events that have befallen the '
                        'world of Lies of P.',
                        style: _bodyStyle,
                      ),
                      const SizedBox(height: 16),
                      _PlaceholderImage(label: 'Gameplay Screenshot', height: 180),
                      const SizedBox(height: 16),
                      Text(
                        'You are awakened by a mysterious voice that guides you through '
                        'the plagued city of Krat – a once lively place that has been '
                        'poisoned by madness and bloodlust. In our soulslike, you must '
                        'adapt yourself and your weapons to face untold horrors, '
                        'untangle the unfathomable secrets of the city\'s elites and '
                        'choose whether to confront predicaments with the truth or '
                        'weave lies to overcome them on the journey to find yourself.',
                        style: _bodyStyle,
                      ),
                      const SizedBox(height: 16),
                      _PlaceholderImage(label: 'Boss Battle', height: 180),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: _features
                        .map((f) => _FeatureTile(title: f.title, body: f.body))
                        .toList(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 28)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(title: 'System Requirements'),
                      const SizedBox(height: 14),
                      _ReqCard(heading: 'Minimum', items: _minReqs),
                      const SizedBox(height: 12),
                      _ReqCard(heading: 'Recommended', items: _recReqs),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 28, 16, 12),
                  child: Text(
                    '© NEOWIZ All rights reserved.',
                    style: TextStyle(color: Colors.white.withOpacity(0.28), fontSize: 11),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Wrap(
                    spacing: 16,
                    children: ['Privacy Policy', 'Legal', 'Accessibility', 'Cookies']
                        .map((s) => Text(s,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.35),
                                fontSize: 11,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white.withOpacity(0.25))))
                        .toList(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Hero Banner ───────────────────────────────────────────────────────────────

class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _PlaceholderImage(label: 'Game Cover Art', height: 240, radius: 0),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF0A0A0A).withOpacity(0.7),
                  const Color(0xFF0A0A0A),
                ],
                stops: const [0.5, 0.82, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0, left: 0, right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Lies Of P',
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Placeholder Image ─────────────────────────────────────────────────────────

class _PlaceholderImage extends StatelessWidget {
  final String label;
  final double height;
  final double radius;

  const _PlaceholderImage({required this.label, required this.height, this.radius = 12});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E1E2E), Color(0xFF2A1A2E), Color(0xFF0D1B2A)],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(painter: _GridPainter(), size: Size.infinite),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, color: Colors.white.withOpacity(0.2), size: 36),
                const SizedBox(height: 8),
                Text(label,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.25),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..strokeWidth = 0.5;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Tag ───────────────────────────────────────────────────────────────────────

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(label,
          style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w500)),
    );
  }
}

// ── Buy Button ────────────────────────────────────────────────────────────────

class _BuyButton extends StatefulWidget {
  const _BuyButton();

  @override
  State<_BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<_BuyButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 110),
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _pressed
                ? [const Color(0xFFCC2E25), const Color(0xFFCC2E25)]
                : [const Color(0xFFFF3B30), const Color(0xFFFF6B35)],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _pressed
              ? []
              : [BoxShadow(color: const Color(0xFFFF3B30).withOpacity(0.38), blurRadius: 16, offset: const Offset(0, 5))],
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const Payment()
              ),
            );
          }, 
          child: Text('Buy',),
        ),
      ),
    );
  }
}
// style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.3
// ── Wishlist Button ───────────────────────────────────────────────────────────

class _WishlistButton extends StatelessWidget {
  final bool active;
  final VoidCallback onTap;
  const _WishlistButton({required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: active ? const Color(0xFFFF3B30).withOpacity(0.18) : Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: active ? const Color(0xFFFF3B30).withOpacity(0.5) : Colors.white.withOpacity(0.12),
          ),
        ),
        child: Icon(
          active ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
          color: active ? const Color(0xFFFF3B30) : Colors.white54,
          size: 22,
        ),
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.2)),
        const SizedBox(height: 6),
        Container(
          width: 32, height: 2.5,
          decoration: BoxDecoration(color: const Color(0xFFFF3B30), borderRadius: BorderRadius.circular(2)),
        ),
      ],
    );
  }
}

// ── Feature Tile ──────────────────────────────────────────────────────────────

class _FeatureTile extends StatelessWidget {
  final String title;
  final String body;
  const _FeatureTile({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3, height: 14,
            margin: const EdgeInsets.only(top: 3, right: 10),
            decoration: BoxDecoration(color: const Color(0xFFFF3B30), borderRadius: BorderRadius.circular(2)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.4)),
                const SizedBox(height: 4),
                Text(body, style: _bodyStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Requirements Card ─────────────────────────────────────────────────────────

class _ReqCard extends StatelessWidget {
  final String heading;
  final List<String> items;
  const _ReqCard({required this.heading, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
          const SizedBox(height: 10),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 8),
                      child: Container(
                        width: 4, height: 4,
                        decoration: const BoxDecoration(color: Color(0xFFFF3B30), shape: BoxShape.circle),
                      ),
                    ),
                    Expanded(
                      child: Text(item,
                          style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 12, height: 1.5)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}