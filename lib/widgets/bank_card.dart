import 'package:flutter/material.dart';
import 'package:custombank/models/account_card.dart';

class BankCard extends StatefulWidget {
  final AccountCard account;
  final Color primaryColor;
  final Color secondaryColor;
  final VoidCallback onTap;
  final bool isCredit;
  final bool isLoading; // Add this field

  const BankCard({
    Key? key,
    required this.account,
    required this.primaryColor,
    required this.secondaryColor,
    required this.onTap,
    this.isCredit = false,
    this.isLoading = false, // Add this parameter
  }) : super(key: key);

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      _isFlipped = !_isFlipped;
      if (_isFlipped) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }


  String _generateExpiryDate() {
    final now = DateTime.now();
    final expiry = DateTime(now.year + 4, now.month);
    return '${expiry.month.toString().padLeft(2, '0')}/${expiry.year.toString().substring(2)}';
  }

  Widget _buildFrontCard() {
    return Container(
      height: 200,  // Add explicit height
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.isCredit
              ? [
                  widget.secondaryColor,
                  widget.secondaryColor.withOpacity(0.8),
                ]
              : [
                  widget.primaryColor,
                  Color.lerp(widget.primaryColor, Colors.white, 0.2) ??
                      widget.primaryColor,
                ],
        ),
        boxShadow: [
          BoxShadow(
            color: widget.primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.account.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              // Replace Image.asset with this temporary solution
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    widget.isCredit ? 'VISA' : 'MC',
                    style: TextStyle(
                      color: widget.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            widget.account.virtualCardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'VALID THRU',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 10,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    _generateExpiryDate(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (widget.isCredit)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'CREDIT',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      height: 200,  // Add explicit height
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.primaryColor.withOpacity(0.9),
            widget.primaryColor,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) { // Change isLoading to widget.isLoading
      return _buildShimmerEffect();
    }
    
    return GestureDetector(
      onTap: _toggleCard,
      onLongPress: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(3.14159 * _animation.value),
            alignment: Alignment.center,
            child: _animation.value < 0.5 ? _buildFrontCard() : _buildBackCard(),
          );
        },
      ),
    );
  }
}
Widget _buildShimmerEffect() {
    return Container(
      height: 200,  // Add explicit height
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }