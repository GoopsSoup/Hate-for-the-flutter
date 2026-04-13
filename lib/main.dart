import 'package:flutter/material.dart';

void main() {
  runApp(const GameStoreApp());
}

class GameStoreApp extends StatelessWidget {
  const GameStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFFFFF),
          surface: Color(0xFF2A2A2A),
        ),
        fontFamily: 'Roboto',
      ),
      home: const GameStorePage(),
    );
  }
}

class GameStorePage extends StatelessWidget {
  const GameStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const _SearchBar(),

              const SizedBox(height: 24),

              // Today Recommendation Section
              const _SectionTitle(title: 'Today Recommendation'),
              const SizedBox(height: 12),
              const _FeaturedGameCard(),

              const SizedBox(height: 32),

              // Popular Section
              const _SectionTitle(title: 'Popular'),
              const SizedBox(height: 12),
              const _PopularGamesRow(),

              const SizedBox(height: 32),

              // Best Selling Section
              const _SectionTitle(title: 'Best Selling'),
              const SizedBox(height: 12),
              const _BestSellingList(),

              const SizedBox(height: 32),

              // Footer
              const _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Search Bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.search, color: Color(0xFF888888), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Search here...',
                    style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Icon(Icons.person_outline, color: Color(0xFFCCCCCC), size: 22),
          ),
        ],
      ),
    );
  }
}

// ─── Section Title ────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: 40,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFFE53935),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Featured Game Card ───────────────────────────────────────────────────────

class _FeaturedGameCard extends StatelessWidget {
  const _FeaturedGameCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Game Cover Image (Placeholder)
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2C3E50), Color(0xFF1A252F)],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Placeholder image background
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF1A2A3A), Color(0xFF0D1B2A)],
                          ),
                        ),
                      ),
                      // Placeholder icon
                      const Icon(
                        Icons.image_outlined,
                        color: Color(0xFF3A5068),
                        size: 64,
                      ),
                      // Game title overlay
                      Positioned(
                        top: 24,
                        child: Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'LIES ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Ø',
                                    style: TextStyle(
                                      color: Color(0xFFE53935),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'F',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'O V E R T U R E',
                              style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 11,
                                letterSpacing: 6,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Star icon top-right
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.star_border, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Tags row + rating
          Row(
            children: [
              _Tag(label: 'Souls-like'),
              const SizedBox(width: 6),
              _Tag(label: 'Action'),
              const SizedBox(width: 6),
              _Tag(label: 'Dark fantasy'),
              const SizedBox(width: 6),
              _Tag(label: 'Singleplayer'),
              const SizedBox(width: 6),
              const Text('...', style: TextStyle(color: Color(0xFF888888), fontSize: 12)),
              const Spacer(),
              const Text(
                '4.6',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Description
          const Text(
            "You are a puppet created by Geppetto who's caught in a web of lies wit...",
            style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 13, height: 1.4),
          ),

          const SizedBox(height: 14),

          // BUY button
          _BuyButton(),
        ],
      ),
    );
  }
}

// ─── Tag Chip ─────────────────────────────────────────────────────────────────

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 10),
      ),
    );
  }
}

// ─── Buy Button ───────────────────────────────────────────────────────────────

class _BuyButton extends StatelessWidget {
  const _BuyButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text(
        'BUY',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

// ─── Popular Games Row ────────────────────────────────────────────────────────

class _PopularGamesRow extends StatelessWidget {
  const _PopularGamesRow();

  static const List<Map<String, dynamic>> _games = [
    {'gradient': [Color(0xFF1A3A2A), Color(0xFF0D2A1A)], 'label': 'Game 1'},
    {'gradient': [Color(0xFF1A1A3A), Color(0xFF0D0D2A)], 'label': 'Game 2'},
    {'gradient': [Color(0xFF3A1A1A), Color(0xFF2A0D0D)], 'label': 'Game 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _games.length,
        itemBuilder: (context, i) {
          final g = _games[i];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: List<Color>.from(g['gradient'] as List),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.image_outlined, color: Color(0xFF3A5068), size: 40),
                  const SizedBox(height: 6),
                  Text(
                    g['label'] as String,
                    style: const TextStyle(color: Color(0xFF555555), fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Best Selling List ────────────────────────────────────────────────────────

class _BestSellingList extends StatelessWidget {
  const _BestSellingList();

  static const List<Map<String, dynamic>> _games = [
    {
      'title': 'The Last Of Us Part I',
      'desc':
          'In a ravaged civilization, where infected and hardened survivors run rampant, Joel, a weary protagonist, is hired to smuggle 14-yea..',
      'tags': ['Story-Rich', 'Zombies', 'Action-Adventure'],
      'rating': '4.8',
      'gradient': [Color(0xFF3A2010), Color(0xFF1A0D08)],
    },
    {
      'title': 'Helldivers 2',
      'desc':
          'HELLDIVERS™ 2 is a 3rd person squad-based shooter that sees the elite forces of the Helldivers battling to win an intergalactic struggle to rid th...',
      'tags': ['Online Co-Op', 'PvE', 'Multiplayer'],
      'rating': '4.4',
      'gradient': [Color(0xFF1A2A3A), Color(0xFF0D1520)],
    },
    {
      'title': 'Remnant 2',
      'desc':
          'A mix of methodical and frenetic ranged/melee combat returns with cunning enemies and large scale boss battles. Choose specific gea...',
      'tags': ['Souls-Like', 'Action', 'Adventure'],
      'rating': '4.2',
      'gradient': [Color(0xFF2A1A3A), Color(0xFF150D20)],
    },
    {
      'title': 'Sifu',
      'desc':
          'Itching for some more good ol\' Kung Fu action? The free Arenas expansion adds multiple hours of gameplay that will put your Kung Fu to the t...',
      'tags': ['Action', 'Difficult', 'Martial Arts'],
      'rating': '4.6',
      'gradient': [Color(0xFF3A0D0D), Color(0xFF200808)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _games
          .map((g) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _BestSellingItem(game: g),
              ))
          .toList(),
    );
  }
}

class _BestSellingItem extends StatelessWidget {
  final Map<String, dynamic> game;
  const _BestSellingItem({required this.game});

  @override
  Widget build(BuildContext context) {
    final tags = List<String>.from(game['tags'] as List);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover placeholder
          Container(
            width: 90,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: List<Color>.from(game['gradient'] as List),
              ),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, color: Color(0xFF3A3A3A), size: 32),
            ),
          ),

          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Rating
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        game['title'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Description
                Text(
                  game['desc'] as String,
                  style: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),

                const SizedBox(height: 8),

                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    ...tags.map((t) => _Tag(label: t)),
                    const Text('...', style: TextStyle(color: Color(0xFF888888), fontSize: 11)),
                  ],
                ),

                const SizedBox(height: 10),

                // Buy button + Rating
                Row(
                  children: [
                    _BuyButton(),
                    const Spacer(),
                    Text(
                      game['rating'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.white, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Wrap(
        spacing: 20,
        children: const [
          Text('Privacy Policy', style: TextStyle(color: Color(0xFF666666), fontSize: 11)),
          Text('Legal', style: TextStyle(color: Color(0xFF666666), fontSize: 11)),
          Text('Accessibility', style: TextStyle(color: Color(0xFF666666), fontSize: 11)),
          Text('Cookies', style: TextStyle(color: Color(0xFF666666), fontSize: 11)),
        ],
      ),
    );
  }
}