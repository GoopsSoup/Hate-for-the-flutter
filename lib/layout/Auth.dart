import 'package:flutter/material.dart';
import 'package:flutter_last_app/layout/Home.dart';


const _green = Color(0xFF4CAF50);


class _Field extends StatefulWidget {
  const _Field({required this.hint, this.isPassword = false});
  final String hint;
  final bool isPassword;
  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) => TextField(
        obscureText: widget.isPassword && _obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: const Color(0xFF1A1A1A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[800]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[800]!),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
              : null,
        ),
      );
}



class _TermsRow extends StatelessWidget {
  const _TermsRow();
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: _green, size: 20),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'I agree to Terms & Service bla bla bla bla bla bla bla bl bla',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      );
}

class _GreenButton extends StatelessWidget {
  const _GreenButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
              (route) => false,
            );
          },
          child: Text(label, style: const TextStyle(fontSize: 16, color: Colors.white)),
        ),
      );
}

Widget _label(String text) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );

// ── Sign In Page ─────────────────────────────────────────────────────────────

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                )
              : null,
          title: const Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: Colors.grey[800]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _label('Name'),
              const _Field(hint: 'Username. . .'),
              const SizedBox(height: 16),
              _label('Password'),
              const _Field(hint: '**************', isPassword: true),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage())),
                child: const Text("Don't have an account?",
                    style: TextStyle(color: _green, decoration: TextDecoration.underline)),
              ),
              const Spacer(),
              const _TermsRow(),
              const SizedBox(height: 16),
              _GreenButton(label: 'Sign In', onPressed: () {}),
            ],
          ),
        ),
      );
}


// ── Sign Up Page ─────────────────────────────────────────────────────────────

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: Colors.grey[800]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _label('Name'),
              const _Field(hint: 'Username. . .'),
              const SizedBox(height: 16),
              _label('Email Account'),
              const _Field(hint: 'aku@email.com'),
              const SizedBox(height: 16),
              _label('Password'),
              const _Field(hint: '**************', isPassword: true),
              const SizedBox(height: 16),
              _label('Date of birth'),
              Row(
                children: ['Year', 'Month', 'Day'].map((e) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[800]!),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 18),
                          const SizedBox(width: 4),
                          Text(e, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                )).toList(),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text('Already have an account?',
                    style: TextStyle(color: _green, decoration: TextDecoration.underline)),
              ),
              const Spacer(),
              const _TermsRow(),
              const SizedBox(height: 16),
              _GreenButton(label: 'Sign Up', onPressed: () {}),
            ],
          ),
        ),
      );
}