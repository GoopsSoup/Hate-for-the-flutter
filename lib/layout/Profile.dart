import 'package:flutter/material.dart';
import 'package:flutter_last_app/layout/MyGame.dart';
import 'package:flutter_last_app/layout/Wishlist.dart';
import 'package:flutter_last_app/layout/Friend.dart';
import 'package:flutter_last_app/layout/Home.dart';
import 'package:flutter_last_app/layout/Auth.dart';
// ─────────────────────────────────────────────
//  COLORS  (change here to retheme everything)
// ─────────────────────────────────────────────
const kBg         = Color(0xFF0A0A0A);
const kCard       = Color(0xFF141414);
const kRed        = Color(0xFFFF3B30);
const kGreen      = Color(0xFF34C759);
const kDarkCircle = Color(0xFF1C1C1E);

// ─────────────────────────────────────────────
//  PROFILE PAGE
// ─────────────────────────────────────────────
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double>   _fadeIn;
  late final Animation<Offset>   _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeIn  = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideUp = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));

  void _onLogout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
      (route) => false, 
    );
  }

  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeIn,
          child: SlideTransition(
            position: _slideUp,
            child: CustomScrollView(
              slivers: [
                _buildTopBar(),
                _buildAvatar(),
                _buildLibrarySection(),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                _buildAccountSection(),
                const SliverToBoxAdapter(child: SizedBox(height: 28)),
                _buildLogoutButton(),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Top bar ──────────────────────────────────
  Widget _buildTopBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            IconButton(
              onPressed: () => _goTo(const Home()),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            const Spacer(),
            const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            _IconBtn(icon: Icons.more_horiz_rounded, onTap: () {}),
          ],
        ),
      ),
    );
  }

  // ── Avatar + stats ───────────────────────────
  Widget _buildAvatar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Gradient ring
                Container(
                  width: 110, height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const SweepGradient(colors: [
                      Color(0xFFFF3B30), Color(0xFFFF9500),
                      Color(0xFF34C759), Color(0xFF007AFF),
                      Color(0xFFFF3B30),
                    ]),
                    boxShadow: [
                      BoxShadow(color: kRed.withOpacity(0.35), blurRadius: 24, spreadRadius: 2),
                    ],
                  ),
                ),
                // Inner circle with letter
                Positioned(
                  top: 3, left: 3,
                  child: Container(
                    width: 104, height: 104,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: kDarkCircle),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                // Edit button
                Positioned(
                  bottom: 0, right: -4,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 32, height: 32,
                      decoration: BoxDecoration(
                        color: kRed,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBg, width: 2.5),
                        boxShadow: [BoxShadow(color: kRed.withOpacity(0.5), blurRadius: 10)],
                      ),
                      child: const Icon(Icons.edit_rounded, size: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
            const Text(
              'usernameiscoolhaha',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'Level 42 · 1,284 hrs played',
              style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 13),
            ),
            const SizedBox(height: 20),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StatChip(label: 'Games',    value: '38'),
                _verticalDivider(),
                _StatChip(label: 'Friends',  value: '12'),
                _verticalDivider(),
                _StatChip(label: 'Wishlist', value: '7'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── Library section ──────────────────────────
  Widget _buildLibrarySection() {
    return SliverToBoxAdapter(
      child: _Section(
        title: 'Library',
        children: [
          _MenuTile(
            icon: Icons.sports_esports_rounded,
            label: 'My Games',
            trailing: '38',
            trailingColor: kGreen,
            onTap: () => _goTo(const MyGame()),
          ),
          _MenuTile(
            icon: Icons.group_rounded,
            label: 'Friends',
            trailing: '12 online',
            trailingColor: kGreen,
            onTap: () => _goTo(const Friend()),
          ),
          _MenuTile(
            icon: Icons.bookmark_rounded,
            label: 'Wishlist',
            trailing: '7',
            onTap: () => _goTo(const Wishlist()),
            showDivider: false,
          ),
        ],
      ),
    );
  }

  // ── Account section ──────────────────────────
  Widget _buildAccountSection() {
    return SliverToBoxAdapter(
      child: _Section(
        title: 'Account',
        children: [
          _MenuTile(
            icon: Icons.mail_outline_rounded,
            label: 'myacc****@email.com',
            onTap: () {},
          ),
          _MenuTile(
            icon: Icons.lock_outline_rounded,
            label: '••••••••••••••',
            labelStyle: const TextStyle(color: Colors.white70, fontSize: 18, letterSpacing: 2),
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }

  // ── Logout button ────────────────────────────
  Widget _buildLogoutButton() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _LogoutButton(onTap: _onLogout), // ← calls _onLogout above
      ),
    );
  }

  // ── Small helper ─────────────────────────────
  Widget _verticalDivider() => Container(
    width: 1, height: 28,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white12,
  );
}

// ─────────────────────────────────────────────
//  REUSABLE WIDGETS
// ─────────────────────────────────────────────

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38, height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white70, size: 18),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 12)),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 4),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.35),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.06)),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatefulWidget {
  final IconData     icon;
  final String       label;
  final TextStyle?   labelStyle;
  final String?      trailing;
  final Color?       trailingColor;
  final VoidCallback onTap;
  final bool         showDivider;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.labelStyle,
    this.trailing,
    this.trailingColor,
    this.showDivider = true,
  });

  @override
  State<_MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<_MenuTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:   (_) => setState(() => _pressed = true),
      onTapUp:     (_) { setState(() => _pressed = false); widget.onTap(); },
      onTapCancel: ()  => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        decoration: BoxDecoration(
          color: _pressed ? Colors.white.withOpacity(0.05) : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Row(
                children: [
                  // Icon box
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(
                      color: kRed.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.icon, color: kRed, size: 18),
                  ),
                  const SizedBox(width: 14),

                  // Label
                  Expanded(
                    child: Text(
                      widget.label,
                      style: widget.labelStyle ??
                          const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // Optional trailing count/text
                  if (widget.trailing != null) ...[
                    Text(
                      widget.trailing!,
                      style: TextStyle(
                        color: widget.trailingColor ?? Colors.white.withOpacity(0.4),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],

                  Icon(Icons.chevron_right_rounded, color: Colors.white.withOpacity(0.25), size: 20),
                ],
              ),
            ),
            if (widget.showDivider)
              Divider(height: 1, thickness: 1, indent: 68, color: Colors.white.withOpacity(0.06)),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatefulWidget {
  final VoidCallback onTap;
  const _LogoutButton({required this.onTap});

  @override
  State<_LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<_LogoutButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:   (_) => setState(() => _pressed = true),
      onTapUp:     (_) { setState(() => _pressed = false); widget.onTap(); },
      onTapCancel: ()  => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        height: 54,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _pressed
                ? [const Color(0xFFCC2E25), const Color(0xFFCC2E25)]
                : [kRed, const Color(0xFFFF6B35)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _pressed
              ? []
              : [BoxShadow(color: kRed.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 6))],
        ),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout_rounded, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}