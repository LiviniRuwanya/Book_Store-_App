class Book {
  final String title;
  final String author;
  final double price;
  final String coverImagePath;
  final String description;
  final double rating;
  final int reviews;

  const Book({
    required this.title,
    required this.author,
    required this.price,
    required this.coverImagePath,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}

final List<Book> sampleBooks = [
  Book(
    title: 'The Book Of Lost Names ',
    author: 'Kristin Harmel',
    price: 24.99,
    coverImagePath: 'assets/images/TheBookOfLostNames.jpg',
    description: 'Inspired by an astonishing true story from World War II, a young woman with a talent for forgery helps hundreds of Jewish children flee the Nazis in this unforgettable historical novel from the New York Times bestselling author of the “epic and heart-wrenching World War II tale” (Alyson Noel, #1 New York Times bestselling author) The Winemaker’s Wife.',
    rating: 4.5,
    reviews: 2547,
  ),
  Book(
    title: "Harry Potter and the Philosopher's Stone",
    author: '	J. K. Rowling',
    price: 29.99,
    coverImagePath: 'assets/images/HarryPotter.jpg',
    description: "The book is about 11 year old Harry Potter, who receives a letter saying that he is invited to attend Hogwarts, school of witchcraft and wizardry. He then learns that a powerful wizard and his minions are after the sorcerer's stone that will make this evil wizard immortal and undefeatable.",
    rating: 4.8,
    reviews: 1832,
  ),
  Book(
    title: 'How I Met My Monster',
    author: 'Amanda Noll and Howard McWilliam',
    price: 19.99,
    coverImagePath: 'assets/images/HowIMetMyMonster.jpg',
    description: 'The story follows Ethan as goofy monsters emerge from under the bed and compete to become his official monster by scaring him into staying in bed',
    rating: 4.7,
    reviews: 3654,
  ),
];