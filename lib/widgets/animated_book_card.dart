import 'package:flutter/material.dart';
import '../models/book.dart';

class AnimatedBookCard extends StatefulWidget {
  final Book book;

  const AnimatedBookCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<AnimatedBookCard> createState() => _AnimatedBookCardState();
}

class _AnimatedBookCardState extends State<AnimatedBookCard>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  bool isInCart = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => _buildDetailsSheet(),
            );
          },
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Book Cover Image using local asset
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.book.coverImagePath,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title, Author, Price
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.book.author,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${widget.book.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  // Cart Button and Rating
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add to Cart Button
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isInCart = !isInCart;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isInCart
                                  ? 'Added to cart!'
                                  : 'Removed from cart!'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: Icon(
                          isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        label: const Text("Add to Cart"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),

                      // Rating
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            ' ${widget.book.rating}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: ListView(
          controller: controller,
          children: [
            // Book cover image using local asset
            Image.asset(
              widget.book.coverImagePath,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Text(
              widget.book.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.book.author,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '\$${widget.book.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.star, color: Colors.amber),
                Text(
                  ' ${widget.book.rating}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  ' (${widget.book.reviews} reviews)',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.book.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}