part of neu;

class NeuIconButton extends StatelessWidget {
  const NeuIconButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      child: Padding(
        padding: padding,
        child: child,
      ),
      shape: BoxShape.circle,
      onTap: onTap,
    );
  }
}
