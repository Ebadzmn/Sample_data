import 'package:flutter/material.dart';
import 'package:sampledata/Movie/data/movie_data.dart';
import 'package:sampledata/Movie/data/movie_data_model.dart';
import 'package:sampledata/Movie/ui/movie_description.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> allMovies = staticMovies.map((map) => Movie.fromMap(map)).toList();
  List<Movie> filteredMovies = [];
  late List<String> categories;
  String query = '';
  String selectedCategory = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredMovies = allMovies;
    categories = ['',...{
      ...allMovies.map((m) => m.category)
    }].toList();
  }

  void updateSearch (String text) {
    setState(() {
      query = text.toLowerCase();
      // filteredMovies = allMovies.where((movie) {
      //   return movie.name.toLowerCase().contains(query);
      // }).toList();
      filterMovies();
    });
  }

  void updateCategory(String? category) {
    if (category == null) return;
    setState(() {
      selectedCategory = category;
      filterMovies();
    });
  }

  void filterMovies() {
    filteredMovies = allMovies.where((movie) {
      final matchName = movie.name.toLowerCase().contains(query);
      final matchCategory = selectedCategory == 'All' || movie.category == selectedCategory;
      return matchName && matchCategory;
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),

      body: Column(
        children: [
          TextField(
            onChanged: updateSearch,
            decoration: InputDecoration(
              labelText: 'Seach Movie Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search)
            ),
          ),
          SizedBox(height: 30,),

          Row(
            children: [
            Text('Category'),
              SizedBox(width: 20,),
              Expanded(child: DropdownButton<String>(value: selectedCategory,isExpanded: true, items: categories.map((category) {
                return DropdownMenuItem( value: category,child: Text(category));
              }).toList(), onChanged:updateCategory ))
            ],
          ),
          Expanded(child: filteredMovies.isEmpty ? Center(
            child: Text('No Movies Found'),
          ) : ListView.builder(itemCount: filteredMovies.length , itemBuilder: (context,index) {
            final movie = filteredMovies[index];
            return Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDescription(movie: movie)));
                },
                child: ListTile(
                  title: Text(movie.name),
                  subtitle: Text(movie.description),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
