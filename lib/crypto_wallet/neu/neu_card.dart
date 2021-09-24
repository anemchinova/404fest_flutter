part of neu;

class NeuCard extends StatefulWidget {
  const NeuCard({
    Key? key,
    required this.child,
    this.onTap,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final BoxShape shape;

  @override
  _NeuCardState createState() => _NeuCardState();
}

class _NeuCardState extends State<NeuCard> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Decoration> _decorationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 0.0,
      vsync: this,
    );

    _decorationAnimation = DecorationTween(
      begin: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5)),
          BoxShadow(color: AppColors.accentShadow, blurRadius: 8, offset: Offset(10, 10)),
        ],
        shape: widget.shape,
        color: Colors.white,
        borderRadius: widget.shape != BoxShape.circle ? BorderRadius.circular(30) : null,
        gradient: const LinearGradient(
          colors: [
            AppColors.accentShadow,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      end: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(5, 5)),
          BoxShadow(color: AppColors.accentShadow, blurRadius: 8, offset: Offset(-10, -10)),
        ],
        shape: widget.shape,
        color: Colors.white,
        borderRadius: widget.shape != BoxShape.circle ? BorderRadius.circular(30) : null,
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            AppColors.accentShadow,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ).animate(animationController);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonAnimator(
      animationController: animationController,
      onTap: widget.onTap,
      enabled: widget.onTap != null,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, snapshot) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: _decorationAnimation.value,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
