import 'package:flutter/material.dart';

class GenresTabContent extends StatelessWidget {
  const GenresTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for genres and books
    final genres = {
      'Science Fiction': [
        'Dune',
        'Neuromancer',
        'Ender’s Game',
        'The Left Hand of Darkness',
        'Snow Crash',
        'Foundation',
        'Hyperion',
        'The Martian',
        'Brave New World',
        'The War of the Worlds'
      ],
      'Fantasy': [
        'The Hobbit',
        'Harry Potter and the Sorcerer’s Stone',
        'A Game of Thrones',
        'The Name of the Wind',
        'Mistborn: The Final Empire',
        'The Lies of Locke Lamora',
        'The Way of Kings',
        'The Golden Compass',
        'American Gods',
        'Eragon'
      ],
      'Mystery/Thriller': [
        'The Girl with the Dragon Tattoo',
        'Gone Girl',
        'The Da Vinci Code',
        'Big Little Lies',
        'Sharp Objects',
        'The Silent Patient',
        'In the Woods',
        'The Girl on the Train',
        'And Then There Were None',
        'Shutter Island'
      ],
      'Historical Fiction': [
        'The Book Thief',
        'All the Light We Cannot See',
        'The Nightingale',
        'Wolf Hall',
        'The Pillars of the Earth',
        'The Help',
        'Outlander',
        'The Other Boleyn Girl',
        'Memoirs of a Geisha',
        'Atonement'
      ],
      'Romance': [
        'Pride and Prejudice',
        'The Notebook',
        'Outlander',
        'Me Before You',
        'The Time Traveler’s Wife',
        'The Rosie Project',
        'Red, White & Royal Blue',
        'A Walk to Remember',
        'Jane Eyre',
        'Anna Karenina'
      ],
      'Horror': [
        'The Shining',
        'Dracula',
        'The Haunting of Hill House',
        'It',
        'The Exorcist',
        'Bird Box',
        'World War Z',
        'The Silence of the Lambs',
        'Pet Sematary',
        'The Amityville Horror'
      ],
      'Non-Fiction': [
        'Sapiens: A Brief History of Humankind',
        'Educated',
        'Becoming',
        'The Immortal Life of Henrietta Lacks',
        'Born a Crime',
        'The Wright Brothers',
        'Into the Wild',
        'The Glass Castle',
        'Unbroken',
        'Quiet: The Power of Introverts'
      ],
      'Biography/Autobiography': [
        'Steve Jobs',
        'The Diary of a Young Girl',
        'Long Walk to Freedom',
        'I Am Malala',
        'The Story of My Life',
        'Open',
        'Bossypants',
        'The Autobiography of Malcolm X',
        'When Breath Becomes Air',
        'Becoming'
      ],
      'Young Adult (YA)': [
        'The Hunger Games',
        'The Fault in Our Stars',
        'Divergent',
        'Twilight',
        'The Maze Runner',
        'The Perks of Being a Wallflower',
        'To All the Boys I\'ve Loved Before',
        'Thirteen Reasons Why',
        'City of Bones',
        'Eleanor & Park'
      ],
      'Self-Help': [
        'The Power of Now',
        'Atomic Habits',
        'The Subtle Art of Not Giving a F*ck',
        'How to Win Friends and Influence People',
        'You Are a Badass',
        'Think and Grow Rich',
        'The 7 Habits of Highly Effective People',
        'The Four Agreements',
        'Man’s Search for Meaning',
        'The Power of Habit'
      ],
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: genres.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Genre Title
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Horizontal Book List
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle book selection
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Book Cover
                              Container(
                                height: 200,
                                width: 150,
                                color:
                                    Colors.grey, // Placeholder for book cover
                                child: const Center(
                                    child: Icon(Icons.book, size: 50)),
                              ),
                              const SizedBox(height: 8),
                              // Book Title
                              Text(
                                entry.value[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32), // Space between sections
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
