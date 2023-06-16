class GlobalLocationValues {
  static String name = "";
  static String address = "";

  GlobalLocationValues.setLocationValues({required String nameFromPhone, required String addressFromPhone}) {
    name = nameFromPhone;
    address = addressFromPhone;
  }

  GlobalLocationValues.clearLocationValues() {
    name = "";
    address = "";
  }
}

class GlobalUserValues {
  static String number = '';

  GlobalUserValues.setMobileNumber({required String numberFromPhone}) {
    number = numberFromPhone;
  }
}

class CardItem {
  final String urlImage;
  final String? categoryName;
  final String? restaurantName;
  final String? rating;
  final String? time;
  final String? tags;
  final String? address;
  final String? distance;
  final String? noOfRatings;

  const CardItem({
    required this.urlImage,
    this.categoryName,
    this.restaurantName,
    this.rating,
    this.time,
    this.tags,
    this.address,
    this.distance,
    this.noOfRatings,
  });
}

List<CardItem> searchCategoryItems = const [
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/biryani.png',
    categoryName: 'Biryani',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/cake.png',
    categoryName: 'Cake',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/cholebhature.png',
    categoryName: ' Chole Bhature',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/dessert.png',
    categoryName: 'Dessert',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/icecream.png',
    categoryName: 'Ice Cream',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/idli.png',
    categoryName: 'South Indian',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/northindian.png',
    categoryName: 'North Indian',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pavbhaji.png',
    categoryName: 'Pav Bhaji',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pizza.png',
    categoryName: 'Pizzas',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/rolls.png',
    categoryName: 'Rolls',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/samosas.png',
    categoryName: ' Samosa',
  ),
];

List<CardItem> homeCategoryItems = const [
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pizza.png',
    categoryName: 'Pizzas',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/Burger2.png',
    categoryName: 'Burger',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/icecream.png',
    categoryName: 'Ice Cream',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/chinese.png',
    categoryName: 'Chinese',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/rolls.png',
    categoryName: 'Rolls',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/cholebhature.png',
    categoryName: 'Chole Bhature',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/parathe.png',
    categoryName: 'Paratha',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/samosas.png',
    categoryName: ' Samosa',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/kachori.png',
    categoryName: 'Kachori',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/idli.png',
    categoryName: 'Idli',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/coffee.png',
    categoryName: 'Coffee',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/vada.png',
    categoryName: 'Vada',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/dosa.png',
    categoryName: 'Dosa',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/sandwich.png',
    categoryName: 'Sandwich',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/summerdrinks.png',
    categoryName: 'Summer Specials',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pasta.png',
    categoryName: 'Pasta',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/shakes.png',
    categoryName: 'Shakes',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/biryani.png',
    categoryName: 'Biryani',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pureveg.png',
    categoryName: 'Pure Veg',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pavbhaji.png',
    categoryName: 'Pav Bhaji',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/indiansweets.png',
    categoryName: 'Indian Sweets',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/northindian.png',
    categoryName: 'North Indian',
  ),
];

List<CardItem> homeRestaurantItems = const [
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/1.jpeg',
    restaurantName: 'Kwality Walls Frozen Dessert and Ice Cream Shop',
    rating: '4.3',
    noOfRatings: '1K+',
    time: '19 mins',
    tags: 'Desserts, Ice Cream',
    address: 'Sadul Ganj',
    distance: '4.6 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/2.jpg',
    restaurantName: 'Hotel Sagar',
    rating: '3.6',
    noOfRatings: '500+',
    time: '25 mins',
    tags: 'Pastas, Chinese, Pizzas, Biryani',
    address: 'Samta Nagar',
    distance: '2.2 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/3.jpg',
    restaurantName: 'Shri Khandelwal Misthan Bhandar',
    rating: '4.3',
    noOfRatings: '10K+',
    time: '22 mins',
    tags: 'Sweets, Snacks',
    address: 'Bhutto Ka Choraha',
    distance: '2.7 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/4.jpg',
    restaurantName: 'Bikaner Namkeen Bhandar(Atithi)',
    rating: '3.9',
    noOfRatings: '1k+',
    time: '16 mins',
    tags: 'Pastas, Desserts',
    address: 'Bhutto Ka Choraha',
    distance: '2.7 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/5.jpg',
    restaurantName: 'Punjabi Rasoi',
    rating: '3.5',
    noOfRatings: '1K+',
    time: '24 mins',
    tags: 'North Indian',
    address: 'Kuchilpura',
    distance: '3.0 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/6.jpg',
    restaurantName: 'Lalji (L.J.& Co.)',
    rating: '4.0',
    noOfRatings: '5K+',
    time: '28 mins',
    tags: 'Sweets, South Indian, Chaat, Chinese, Pizzas, Snacks, Bakery, North Indian, Burgers, Ice Cream',
    address: 'Kote Gate',
    distance: '4.5 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/7.jpg',
    restaurantName: 'Amberwalla',
    rating: '3.5',
    noOfRatings: '5K+',
    time: '27 mins',
    tags: 'Shakes, Cakes, Pizzas, North Indian',
    address: 'Rani Bazaar',
    distance: '4.8 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/8.jpg',
    restaurantName: 'Burger Farm',
    rating: '3.9',
    noOfRatings: '100+',
    time: '22 mins',
    tags: 'Burger, Beverages, Snacks',
    address: 'Tilak Nagar',
    distance: '5.9 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/9.jpg',
    restaurantName: 'Lover Over Coffee',
    rating: '3.5',
    noOfRatings: '20+',
    time: '30 mins',
    tags: 'Coffee, Shakes, Sandwich',
    address: 'Central Bikaner',
    distance: '4.3 km',
  ),
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/10.jpeg',
    restaurantName: 'La Pino\'z Pizza',
    rating: '3.9',
    noOfRatings: '2K+',
    time: '26 mins',
    tags: 'Pizzas, Pastas, Italian, Desserts, Beverages',
    address: 'Rani Bazar',
    distance: '5 km',
  ),
];
