import 'package:flutter/material.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, String>> movies = [
    {
      'title': 'Companion',
      'subtitle': 'FIND SOMEONE MADE JUST FOR YOU',
      'imdb': '6.8/10',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsj0ezIY42temPWd-of8e6gwkjYDqdqopFOg&s', // Placeholder image
    },
    {
      'title': 'Armor',
      'subtitle': 'A NEW ADVENTURE AWAITS',
      'imdb': '7.5/10',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF1QPzpt3U-jYLjNDy69hSRmg-MNcqGWkDkQ&s', // Placeholder image
    },
    {
      'title': 'The Journey',
      'subtitle': 'EXPLORE THE UNKNOWN',
      'imdb': '7.0/10',
      'image': 'https://m.media-amazon.com/images/I/61CRq2R6i4L._AC_SL1024_.jpg', // Placeholder image
    },
    {
      'title': 'The Journey',
      'subtitle': 'EXPLORE THE UNKNOWN',
      'imdb': '7.0/10',
      'image': 'https://m.media-amazon.com/images/I/61CRq2R6i4L._AC_SL1024_.jpg', // Placeholder image
    },
    {
      'title': 'The Journey',
      'subtitle': 'EXPLORE THE UNKNOWN',
      'imdb': '7.0/10',
      'image': 'https://m.media-amazon.com/images/I/61CRq2R6i4L._AC_SL1024_.jpg', // Placeholder image
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0033), // Dark purple background
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: _buildMovieSlider(),
            ),
            _buildThumbnailRow(),
            const SizedBox(height: 10),
            _buildPageIndicator(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white70),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.mic, color: Colors.white70),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.notifications, color: Colors.white70),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMovieSlider() {
    return PageView.builder(
      controller: _pageController,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: NetworkImage(movie['image']!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  movie['subtitle']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  movie['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'IMDb',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      movie['imdb']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('Watch Now for ${movie['title']}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8A2BE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                      child: const Text(
                        'Watch Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    _buildActionButton(Icons.download, () {
                      print('Download ${movie['title']}');
                    }),
                    const SizedBox(width: 15),
                    _buildActionButton(Icons.share, () {
                      print('Share ${movie['title']}');
                    }),
                    const SizedBox(width: 15),
                    _buildActionButton(Icons.bookmark, () {
                      print('Bookmark ${movie['title']}');
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(movies.length, (index) {
        final bool isSelected = _currentPage == index;
        return Container(
          width: 35.0,
          height: 5.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: isSelected
                ? Colors.deepPurple
                : Colors.deepPurple.withOpacity(0.11 + 0.1 * (index % 4)),
          ),
        );
      }),
    );
  }

  Widget _buildThumbnailRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                width: 80,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(movie['image']!),
                    fit: BoxFit.cover,
                  ),
                  border: _currentPage == index
                      ? Border.all(color: Colors.deepPurpleAccent, width: 3)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}