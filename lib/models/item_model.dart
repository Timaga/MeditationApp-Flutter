
class Item{

  final String name;

  final String ImagePath;

  final String AudioPath;

   bool isPlaying;

  Item({required this.AudioPath,required this.ImagePath,required this.name,this.isPlaying = false});
}