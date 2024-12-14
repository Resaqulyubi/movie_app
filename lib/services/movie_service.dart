import 'dart:convert';
import 'package:http/http.dart' as http;

/// Custom implementation of TVMaze API integration
/// Author: Mochamad Resa Qulyubi
/// This service provides a unique approach to fetching and transforming TV show data
class MovieService {
  final String baseUrl = 'https://api.tvmaze.com';

  /// Custom implementation of show data fetching with specific data transformation
  /// Returns a list of shows with normalized data structure
  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/shows'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map<Map<String, dynamic>>((show) {
          return {
            'title': show['name'] ?? 'No Title',
            'overview': show['summary']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'No description',
            'poster_path': show['image']?['medium'] ?? '',
            'vote_average': show['rating']?['average'] ?? 0.0,
            'genres': (show['genres'] as List<dynamic>?)?.join(', ') ?? '',
            'status': show['status'] ?? 'Unknown',
          };
        }).toList();
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (e) {
      throw Exception('Error fetching shows: $e');
    }
  }

  Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search/shows?q=$query'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map<Map<String, dynamic>>((item) {
          final show = item['show'];
          return {
            'title': show['name'] ?? 'No Title',
            'overview': show['summary']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'No description',
            'poster_path': show['image']?['medium'] ?? '',
            'vote_average': show['rating']?['average'] ?? 0.0,
            'genres': (show['genres'] as List<dynamic>?)?.join(', ') ?? '',
            'status': show['status'] ?? 'Unknown',
          };
        }).toList();
      } else {
        throw Exception('Failed to search shows');
      }
    } catch (e) {
      throw Exception('Error searching shows: $e');
    }
  }
}
