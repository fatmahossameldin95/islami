import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';

class RadioCard extends StatefulWidget {
  final String name;

  const RadioCard({super.key, required this.name});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isPlaying
                ? "assets/images/sound_wave.png"
                : "assets/images/mosque_bg.png",
          ),
          fit: BoxFit.cover,
        ),
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 35,
                ),
              ),

              IconButton(
                onPressed: () {
                  // mute / volume
                },
                icon: const Icon(Icons.volume_up, size: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
