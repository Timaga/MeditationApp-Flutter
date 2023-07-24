import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/item_model.dart';

class MeditationAppScreen extends StatefulWidget {
  @override
  State<MeditationAppScreen> createState() => _MeditationAppScreenState();
}

class _MeditationAppScreenState extends State<MeditationAppScreen> {
  final List<Item> Items = [
    Item(
        AudioPath: "audios/ocean.mp3",
        ImagePath: "meditation_images/ocean.jpeg",
        name: "Ocean"),
    Item(
        AudioPath: "audios/night.mp3",
        ImagePath: "meditation_images/night.jpeg",
        name: "Night"),
    Item(
        AudioPath: "audios/waterfall.mp3",
        ImagePath: "meditation_images/waterfall.jpeg",
        name: "WaterFall"),
    Item(
        AudioPath: "audios/forest.mp3",
        ImagePath: "meditation_images/forest.jpeg",
        name: "Forest"),
    Item(
        AudioPath: "audios/wind.mp3",
        ImagePath: "meditation_images/wind.jpeg",
        name: "Wind"),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();
  int? playingIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: Items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Items[index].ImagePath),
                ),
              ),
              height: 100,
              child: ListTile(
                title: Text(Items[index].name),
                leading: IconButton(
                  splashColor: Colors.transparent,
                  icon: Items[index].isPlaying
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  onPressed: () {
                    if (Items[index].isPlaying) {
                      audioPlayer.stop();
                    } else {
                      try{
                      audioPlayer.setAsset(Items[index].AudioPath);
                      audioPlayer.play();}
                      catch(error){
                        print(error);
                      }
                    }
                    setState(() {
                      
                      Items[index].isPlaying = !Items[index].isPlaying;
                    });
                  },
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
