import 'package:audio_pulse/models/song.dart';
import 'package:flutter/material.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Can't Tell Me Nothing",
      artistName: "Kanye West",
      art: "assets/images/Graduation.jpg",
      audioPath: "assets/audio/audio.mp3",
      albumName: "Graduation",
    ),
    Song(
      songName: "White Ferrari",
      artistName: "Frank Ocean",
      art: "assets/images/Blonde.jpeg",
      audioPath: "assets/audio/audio.mp3",
      albumName: "Blonde",
    ),
    Song(
      songName: "These Demons",
      artistName: "Eminem",
      art: "assets/images/MTBMB.png",
      audioPath: "assets/audio/audio.mp3",
      albumName: "Music To Be Murdered By",
    ),
    Song(
      songName: "Self Care",
      artistName: "Mac Miller",
      art: "assets/images/Swimming.png",
      audioPath: "assets/audio/audio.mp3",
      albumName: "Swimming",
    ),
    Song(
      songName: "2009",
      artistName: "Mac Miller",
      art: "assets/images/Swimming.png",
      audioPath: "assets/audio/audio.mp3",
      albumName: "Swimming",
    )
  ];

  int? _currentSongIndex;

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    notifyListeners();
  }
}
