import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/vector_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          // Use Center as layout has unconstrained width (loose constraints),
          // together with SizedBox to specify the max width (tight constraints)
          // See this thread for more info:
          // https://twitter.com/biz84/status/1445400059894542337
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              // child: TwitterEmbedCard(),
              child: TwitterMain(),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterMain extends StatelessWidget {
  const TwitterMain({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/andrea-avatar.png"),
            ),
            Padding(padding: EdgeInsets.all(5), child: TwitterProfile()),
          ],
        ),
        const Text(
          "Did you know?\n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change. \n\nBut there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇",
          style: TextStyle(fontSize: 18),
        ),
        const Image(image: AssetImage("assets/media-query-banner.jpg")),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "10:21 AM - Jun 20, 2023",
              style: TextStyle(color: CupertinoColors.inactiveGray),
            ),
            VectorIcon(asset: SvgAsset.info),
          ],
        ),
        Column(
          spacing: 20,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            const Row(
              spacing: 20,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    VectorIcon(asset: SvgAsset.heartRed),
                    Text("997"),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    VectorIcon(asset: SvgAsset.comment),
                    Text("Reply"),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    VectorIcon(asset: SvgAsset.link),
                    Text("Copy link")
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    print('yea');
                  },
                  child: const Text(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      'Read 12 replies')),
            ),
          ],
        )
      ],
    );
  }
}

class TwitterProfile extends StatelessWidget {
  const TwitterProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 5,
          children: [
            Text('Andrea Brizzotto'),
            VectorIcon(asset: SvgAsset.heartBlue, height: 20,),
            VectorIcon(asset: SvgAsset.verified, height: 20,),
          ],
        ),
        Row(
          children: [
            Text(
              "@biz84 - ",
              style: TextStyle(color: CupertinoColors.inactiveGray),
            ),
            Text("follow", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Delete this and implement the desired layout
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Use the icons below to build the completed layout',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: SvgAsset.values
              .map((asset) => VectorIcon(
                    asset: asset,
                    height: 50,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
