import 'package:flutter/material.dart';

class Sample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, index) => ListTile(
                  title: Text("Index: $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: Opacity(
                        opacity: shrinkOffset / expandedHeight,
                        child: Text(
                          "MySliverAppBar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            // opacity: 1,
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child:Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}