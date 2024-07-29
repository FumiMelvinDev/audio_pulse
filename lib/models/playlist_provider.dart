import 'package:audio_pulse/models/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Can't Tell Me Nothing",
      artistName: "Kanye West",
      art: "assets/images/Graduation.jpg",
      audioPath: "audio/audio.mp3",
      albumName: "Graduation",
    ),
    Song(
      songName: "White Ferrari",
      artistName: "Frank Ocean",
      art: "assets/images/Blonde.jpeg",
      audioPath: "audio/audio.mp3",
      albumName: "Blonde",
    ),
    Song(
      songName: "These Demons",
      artistName: "Eminem",
      art: "assets/images/MTBMB.png",
      audioPath: "audio/audio.mp3",
      albumName: "Music To Be Murdered By",
    ),
    Song(
      songName: "Self Care",
      artistName: "Mac Miller",
      art: "assets/images/Swimming.png",
      audioPath: "audio/audio.mp3",
      albumName: "Swimming",
    ),
    Song(
      songName: "2009",
      artistName: "Mac Miller",
      art: "assets/images/Swimming.png",
      audioPath: "audio/audio.mp3",
      albumName: "Swimming",
    )
  ];

  int? _currentSongIndex;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider() {
    listenToDuration();
  }

  bool _isPlaying = false;

  void playSong() async {
    final path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));

    _isPlaying = true;
    notifyListeners();
  }

  void pauseSong() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resumeSong() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isPlaying) {
      pauseSong();
    } else {
      resumeSong();
    }

    notifyListeners();
  }

  void seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void nextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  void previousSong() {
    if (_currentDuration.inSeconds > 3) {
      seekTo(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      nextSong();
    });
  }

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      playSong();
    }

    notifyListeners();
  }
}
