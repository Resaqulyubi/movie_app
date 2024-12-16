import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/// Custom implementation of TV show detail screen with unique UI elements
/// Author: Mochamad Resa Qulyubi
/// Features custom hero animations and flexible genre display
class TvShowDetailScreen extends StatelessWidget {
  final Map<String, dynamic> show;

  const TvShowDetailScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Handle different data structures for genres
    List<String> genres = [];
    if (show['genres'] != null) {
      if (show['genres'] is List) {
        genres = (show['genres'] as List).map((e) => e.toString()).toList();
      } else if (show['genres'] is String) {
        genres = [show['genres'] as String];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(show['name'] ?? show['title'] ?? 'Show Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (show['image'] != null || show['poster_path'] != null)
              Hero(
                tag: 'show-image-${show['id']}',
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    show['image']?['original'] ?? show['poster_path'] ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          show['name'] ?? show['title'] ?? 'Unknown Title',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      if (show['rating']?['average'] != null || show['vote_average'] != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${show['rating']?['average'] ?? show['vote_average'] ?? ''}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (genres.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: genres.map((genre) {
                        return Chip(
                          label: Text(genre),
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                        );
                      }).toList(),
                    ),
                  const SizedBox(height: 16),
                  if (show['schedule'] != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Schedule',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            if (show['schedule']['days'] != null)
                              Text(
                                'Days: ${(show['schedule']['days'] as List).join(', ')}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            if (show['schedule']['time'] != null)
                              Text(
                                'Time: ${show['schedule']['time']}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  if (show['summary'] != null || show['overview'] != null)
                    Html(
                      data: show['summary'] ?? show['overview'] ?? '',
                      style: {
                        "body": Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                          fontSize: FontSize(16),
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      },
                    )
                  else
                    Text(
                      'No summary available.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  const SizedBox(height: 24),
                  if (show['officialSite'] != null)
                    OutlinedButton.icon(
                      onPressed: () {
                        // Add url_launcher functionality here if needed
                      },
                      icon: const Icon(Icons.link),
                      label: const Text('Visit Official Site'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
