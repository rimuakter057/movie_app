import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets_path.dart';

class LiveShortsView extends StatefulWidget {
  @override
  State<LiveShortsView> createState() => _LiveShortsViewState();
}

class _LiveShortsViewState extends State<LiveShortsView> {
  final List<String> comments = [
    "Wow, you guys are having fun, aren't you? 😍",
    "I'm missing this big time! 😭",
    "Oh, is that Sarah? Where did you guys meet?",
    "Lovely like a summer picnic 🍓"
  ];

  final TextEditingController _controller = TextEditingController();

  void _addComment(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      comments.insert(0, text);
    });
    _controller.clear();
  }

  void _sendHeart() {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 120,
        right: 16,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: -150),
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, value),
              child: Opacity(
                opacity: 1 - (value / -150),
                child: Icon(Icons.favorite, color: Colors.redAccent, size: 30),
              ),
            );
          },
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(Duration(seconds: 2), () => entry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (simulate video)
          Positioned.fill(
            child: Image.asset(
            AssetsPath.liveImage1,
              fit: BoxFit.cover,
            ),
          ),

          // Top bar
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(   AssetsPath.liveImage1,),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Emily Eden", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text("Live", style: TextStyle(color: Colors.redAccent)),
                  ],
                )
              ],
            ),
          ),

          // Comments
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                reverse: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            comments[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Bottom bar
          Positioned(
            bottom: 20,
            left: 12,
            right: 12,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(color: Colors.white60),
                        border: InputBorder.none,
                      ),
                      onSubmitted: _addComment,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.pinkAccent),
                  onPressed: _sendHeart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}