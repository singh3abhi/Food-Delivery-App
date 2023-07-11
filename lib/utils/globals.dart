// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const kColor = Color.fromARGB(255, 241, 87, 1);

class MenuItem {
  final bool isVeg;
  final bool isBestseller;
  final String name;
  final String price;
  final double? rating;
  final int? noOfRatings;
  final String urlImage;
  final String description;
  const MenuItem({
    required this.isVeg,
    required this.isBestseller,
    required this.name,
    required this.price,
    this.rating,
    this.noOfRatings,
    required this.urlImage,
    required this.description,
  });
}

class SubCategoryItem {
  final String subCategoryName;
  final List<MenuItem>? subMenu;
  const SubCategoryItem({
    required this.subCategoryName,
    this.subMenu,
  });
}

class CategoryItem {
  final String categoryName;
  final List<MenuItem>? menu;
  final List<SubCategoryItem>? subCategoryList;
  const CategoryItem({
    required this.categoryName,
    this.subCategoryList,
    this.menu,
  });
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
  final List<CategoryItem>? categoryList;

  const CardItem({
    this.categoryList,
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

List<CategoryItem> customCategoryList = const [
  CategoryItem(
    categoryName: 'Recommended',
    menu: [
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Onions & Paneer Pizza',
        price: '₹139',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/1.jpeg',
        description: 'A delectable combination of freshly cooked onions & paneer with our in house sauce. [Fat-21.2 per 100 g, Protein-20.3 per 100 g, Carbohydrate-24.1 per 100 g, Sugar-2.9 per 100 g, Calories-368.4 k.cal]Nutritional information per 100g',
        rating: 3.8,
        noOfRatings: 121,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Tomatoes Pizza',
        price: '₹79',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/2.jpeg',
        description: 'Thinly cut fresh tomatoes on a cheesy base with in house sauce. [Fat-6.9 per 100 g, Protein-5.1 per 100 g, Carbohydrate-29.8 per 100 g, Sugar-4 per 100 g, Calories-201.7 k.cal]Nutritional information per 100g',
        rating: 4.2,
        noOfRatings: 194,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Onions Pizza',
        price: '₹89',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/3.jpeg',
        description: 'Onions on a cheesy base with in house sauce. [Fat-7 per 100 g, Protein-12.2 per 100 g, Carbohydrate-50.8 per 100 g, Sugar-7 per 100 g, Calories-315 k.cal]Nutritional information per 100g',
        rating: 4.1,
        noOfRatings: 192,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Capsicum, Paneer & Red Paprika Pizza',
        price: '₹139',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/4.jpeg',
        description: 'Flavorful trio of Juicy Paneer, Crisp Capsicum with Spicy Red Paprika. [Fat-10.2 per 100 g, Protein-16.4 per 100 g, Carbohydrate-29.5 per 100 g, Sugar-3.2per 100 g, Calories-275.4 k.cal]Nutritional information per 100g',
        rating: 4.0,
        noOfRatings: 198,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Margherita Pizza',
        price: '₹145',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/5.jpeg',
        description: '',
        rating: 3.8,
        noOfRatings: 85,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Americano White Sauce Pasta Veg',
        price: '₹195',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/6.jpeg',
        description: 'A blend of American Flavours in your Favorite Pasta Onion, capsicum, sweet corn, mushroom, olives with cheese. [Fat-10.5 per 100 g, Protein-3.9 per 100 g, Carbohydrate-9.2 per 100 g, Sugar-4.2 per 100 g, Calories-146.9 k.cal] Nutritional information per 100g',
        rating: 3.9,
        noOfRatings: 17,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Paneer Tikka Butter Masala Pizza',
        price: '₹275',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/7.jpeg',
        description: 'An indian Speciality on a La Pinoz Pizza. Exotic Paneer Tikka, Onion, Capsicum & Red Paprika. [Fat-12.7 per 100 g, Protein-13.4 per 100 g, Carbohydrate-24.6 per 100 g, Sugar-0 per 100 g, Calories-266.2 k.cal]Nutritional information per 100g',
        rating: 4.0,
        noOfRatings: 46,
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicken Tikka & Chicken Salami Pizza',
        price: '₹145',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/8.jpeg',
        description: 'Classic Combination of Chicken Tikka & Chicken Salami. [Fat-12.8 per 100 g, Protein-30.6 per 100 g, Carbohydrate-37.6 per 100 g, Sugar-1.6 per 100 g, Calories-388 k.cal]Nutritional information per 100g',
        rating: 2.8,
        noOfRatings: 8,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Garden Delight Pizza',
        price: '₹195',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/9.jpeg',
        description: 'A classic veg pizza that combines the zing and freshness of onions, tomatoes and capsicum. [Fat-7.2 per 100 g, Protein-9.8 per 100 g, Carbohydrate-31.4 per 100 g, Sugar-0 per 100 g, Calories-230 k.cal]Nutritional information per 100g',
        rating: 3.9,
        noOfRatings: 48,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Lovers Bite Pizza',
        price: '₹139',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/10.jpeg',
        description: 'A wholesome combination of tossed mushrooms, olives and juicy sweet corn. [Fat-9 per 100 g, Protein-12.4 per 100 g, Carbohydrate-32.2 per 100 g, Sugar-0 per 100 g, Calories-260.1 k.cal]Nutritional information per 100g',
        rating: 4.9,
        noOfRatings: 8,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Paneer Tikka Butter Masala & Red Paprika Taco\'s',
        price: '₹139',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/11.jpeg',
        description: 'Truly Delicous! Taco Stuffed with Paneer Tikka Butter Masala & Red Paprika',
        rating: 3.7,
        noOfRatings: 44,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Oreo Shake',
        price: '₹109',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/12.jpeg',
        description: 'Oreo Shake',
        rating: 4.1,
        noOfRatings: 21,
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Bbq Chicken & Cheese Quesadillas',
        price: '₹169',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/13.jpeg',
        description: '[3 Pcs] Soft Shell Tortilla filled with BBq chicken & cheese Quesadillas. [Fat-9.6 per 100 g, Protein-13.8 per 100 g, Carbohydrate-26.2 per 100 g, Sugar-4.6 per 100 g, Calories-246.4 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicken Tikka, Jalapenos & Cheese Quesadillas',
        price: '₹169',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/14.jpeg',
        description: '[3 Pcs] Soft Shell Tortilla filled with Chicken Tikka, Jalapenos & Cheese. [Fat-19.2 per 100 g, Protein-20.19 per 100 g, Carbohydrate-16.6 per 100 g, Sugar-1.6 per 100 g, Calories-320 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicken Tikka & Chicken Salami Taco\'s',
        price: '₹169',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/15.jpeg',
        description: 'Honestly Tempting! Crispy Taco Stuffed with Chicken Tikka & Salami & Creamy Sauce',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Quesadilla Pack Of 4 (non - Veg)',
        price: '₹139',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/16.jpeg',
        description: 'Bbq Chicken & Cheese, Chicken Tikka, Jalapenos & Cheese, Mutton Keema, Jalapenos & Cheese, Salami,Smoke Chicken & Cheese',
        rating: 3.8,
        noOfRatings: 10,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Classic Pizzas Pack Of 4 - Veg.',
        price: '₹409',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/17.jpeg',
        description: 'Onions Pizza + Tomatoes Pizza + Caspsicum Pizza + Sweet Corn Pizza',
        rating: 4.5,
        noOfRatings: 14,
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Mexicana Red Sauce Pasta Non-veg',
        price: '₹225',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Recommended/18.jpeg',
        description: 'Exotic Red Sauce With Onion, Capsicum, Mushroom, Olives, Cheese. Chicken Bbq & Chicken Salami. [Fat-8.6 per 100 g, Protein-12.2 per 100 g, Carbohydrate-26.9 per 100 g, Sugar-3.1 per 100 g, Calories-233.8 k.cal]Nutritional information per 100g',
      ),
    ],
  ),
  CategoryItem(
    categoryName: 'Personal Slice Veg Pizza.',
    menu: [
      MenuItem(
        isVeg: true,
        isBestseller: true,
        name: 'Margherita Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹140',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/1.jpeg',
        description: 'A classic cheesy Margherita. Cant go wrong. [Fat-14.3 per 100 g, Protein-12.6 per 100 g, Carbohydrate-39.2 per 100 g, Sugar-0 per 100 g, Calories-336 K.cal] Nutritional information per 100g',
        rating: 4.5,
        noOfRatings: 8,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Makhani Do Pyaza (personal Giant Slice (22.5 Cm))',
        price: '₹165',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/2.jpeg',
        description: 'Makhani Gravy, Onion & Cheese',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'My Mac (personal Giant Slice (22.5 Cm))',
        price: '₹165',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/3.jpeg',
        description: 'A perfect blend of Cheesey Macroni, Swirl of Jalapenos Dip & Cheese',
        rating: 4.2,
        noOfRatings: 5,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Onion Twist (personal Giant Slice (22.5 Cm))',
        price: '₹165',
        urlImage: '',
        description: 'Twisted combination of Onion & Cheese',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Sweet Corns Delight (personal Giant Slice (22.5 Cm))',
        price: '₹165',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/5.jpeg',
        description: 'A combination of juicy Sweet Corns & Cheese',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Country Side Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/6.jpeg',
        description: 'A country side mood goes well with capsicum, Jalapeno & Olives. [Fat-12.3 per 100 g, Protein-12.3 per 100 g, Carbohydrate-33.3 per 100 g, Sugar-0 per 100 g, Calories-293.7 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Garden Delight Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/7.jpeg',
        description: 'A classic veg pizza that combines the zing and freshness of onions, tomatoes and capsicum. [Fat-7.2 per 100 g, Protein-9.8 per 100g, Carbohydrate-31.4 per 100 g, Sugar-0 per 100 g, Calories-230 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Lovers Bite Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/8.jpeg',
        description: 'A wholesome combination of tossed mushrooms, olives and juicy sweet corn. [Fat-9 per 100 g, Protein-12.4 per 100 g, Carbohydrate-32.2 per 100 g, Sugar-0 per 100 g, Calories-260.1 k.cal]Nutritional information per 100g',
        rating: 4.0,
        noOfRatings: 6,
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Spring Fling Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/9.jpeg',
        description: 'Quintessentially veg with capsicum, sweet corn and flavoured chunks of paneer. [Fat-12.1 per 100 g, Protein-10.1 per 100 g, Carbohydrate-34 per 100 g, Sugar-0 per 100 g, Calories-285.2 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Burn To Hell Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/10.jpeg',
        description: 'A fiery and lethal combination of hot & garlic dip, jalapenos, mushrooms, olives and capsicum. [Fat-8.4 per 100 g, Protein-13.1 per 100 g, Carbohydrate-43.1 per 100 g, Sugar-2.6 per 100 g, Calories-300.5 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Cheezy-7 Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/11.jpeg',
        description: 'An Exotic Combination of White Mozzarilla, Cream White Cheese, Cheddar, Monterey Jack, Cream Orange Cheese, Colby, Orange Cheddar. [Fat-12.4, Protein-10.3, Carbohydrate-32.2, Sugar-2.1, Calories-281.8]',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Farm Villa Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/12.jpeg',
        description: 'The freshness of capsicum, tomatoes, with the flavour of paneer and red paprika topped with a korma dip. [Fat-10.9 per 100 g, Protein-12.7 per 100 g, Carbohydrate-34.9 per 100 g, Sugar-0 per 100 g, Calories-288.9 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Garden Special Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/13.jpeg',
        description: 'A country side mood goes well with capsicum, Jalapeno & Olives. [Fat-12.3 per 100 g, Protein-12.3 per 100 g, Carbohydrate-33.3 per 100 g, Sugar-0 per 100 g, Calories-293.7 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Macaroni Special Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/14.jpeg',
        description: 'A special fusion Cheesy mac pizza with Onions,Olives,Sweet Corns and Mushrooms. [Fat-17.4 per 100 g, Protein-10.9 per 100 g, Carbohydrate-33.4 per 100 g, Sugar-0 per 100 g, Calories-333.6 k/cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Paneer Tikka Butter Masala Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/15.jpeg',
        description: 'An indian Speciality on a La Pinoz Pizza. Exotic Paneer Tikka, Onion, Capsicum & Red Paprika. [Fat-12.7 per 100 g, Protein-13.4 per 100 g, Carbohydrate-24.6 per 100 g, Sugar-0 per 100 g, Calories-266.2 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Veg.hawaiian Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/16.jpeg',
        description: 'Nothing says Hawaiian like pineapple, paneer, and sweet corn with extra cheese. [Fat-20.3 per 100 g, Protein-10.9 per 100 g, Carbohydrate-28.6 per 100 g, Sugar-0 per 100 g, Calories-340.9 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Veg Tamer Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹275',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/17.jpeg',
        description: 'All the Veg Toppings with Extra Cheese. [Fat-10.5 per 100 g, Protein-12 per 100 g, Carbohydrate-32.9 per 100 g , Sugar-3.2 per 100 g, Calories-274 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'African Peri Peri Veg Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/18.jpeg',
        description: 'A crowd favourite. Paneer, Mushroom, Sweet Corns,Onion & Red Paprika topped with our in house Peri Peri Dip. [Fat-9.4 per 100 g, Protein-12.1 per 100 g, Carbohydrate-27.6 per 100 g, Sugar-2.5 per 100 g, Calories-243.5 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Cheese Lover Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/19.jpeg',
        description: 'Nothing says cheesy like the cheese lovers pizza accompanied with a cheese and jalapeno dip. [Fat-11.3 per 100 g, Protein-8.7 per 100 g, Carbohydrate-33.4 per 100 g, Sugar-2 per 100 g, Calories-270 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Cheesy Macaroni Veg Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/20.jpeg',
        description: 'Paneer, Onions, Capsicum, Olives, Baby Corn With Loads Of Cheese',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'English Retreat Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/21.jpeg',
        description: 'Olives,Red Paprika, Tomatoes, Paneer, Capsicum, Cheese, Jalapeno Dip. An English special. [Fat-11.9 per 100 g, Protein-11.1 per 100 g, Carbohydrate-37.1 per 100 g, Sugar-3.6 per 100 g, Calories-300.3 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Garlic-to-pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/22.jpeg',
        description: 'Hot & Garlic Dip with onions, Capsicum, Paneer, Mushroom, Jalapenos. [Fat-12 per 100 g, Protein-14.8 per 100 g, Carbohydrate-24.9 per 100 g, Sugar-2.2 per 100 g, Calories-266.7 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Hot Passion Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/23.jpeg',
        description: 'Hot passion on a Pizza. Jalapenos, Mushrooms, Red Paprika, Fresh Tomato With Cheese & Jalapeno Dip. [Fat-6.5 per 100 g, Protein-6.1 per 100 g, Carbohydrate-45 per 100 g, Sugar-0 per 100 g, Calories-263.2 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Korma Special Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/24.jpeg',
        description: 'Need some Indian Zing to your pizza? Top it up with Onion,Capsicum,Tomato,Red Paprika,Paneer,Mushroom & Korma Dip. [Fat-9.9 per 100 g, Protein-8 per 100 g, Carbohydrate-40.3 per 100 g, Sugar-3.1 per 100 g, Calories-282.3 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'La Pino\'z Paneer Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/25.jpeg',
        description: 'A La Pinoz special. Onion, Capsicum, Paneer, Sweet Corn & Olives With Cheese Dip. [Fat-8.4 per 100 g, Protein-11.8 per 100 g, Carbohydrate-34.4 per 100 g, Sugar-2 per 100 g, Calories-260.8 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Las Vegas Treat Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/26.jpeg',
        description: 'Mushrooms, Jalapenos, Baby Corn, Capsicum, Tomatoes With Peri Peri Dip. [Fat-10.4 per 100 g, Protein-6.7 per 100 g, Carbohydrate-43.1 per 100 g, Sugar-3.6 per 100 g, Calories-292.3 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Peri Peri Veg Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceVegPizza/27.jpeg',
        description: 'Milder, but just as tasty. Onion, Capsicum, Mushroom, Paneer, Olives With Peri Peri Dip. [Fat-6.1 per 100 g, Protein-13.9 per 100 g, Carbohydrate-33.8 per 100 g, Sugar-0 per 100 g, Calories-246.1 k.cal]Nutritional information per 100g',
      ),
    ],
  ),
  CategoryItem(
    categoryName: 'Personal Slice Non Veg Pizza.',
    menu: [
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Super BBQ (personal Giant Slice (22.5 Cm))',
        price: '₹165',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/1.jpeg',
        description: 'A classic pizza with onions,BBQ Chicken & Cheese. [Fat-7 per 100 g, Protein-10 per 100 g, Carbohydrate-43.5 per 100 g, Sugar-6.2 per 100 g, Calories-277.2 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Exotic Tikka Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/2.jpeg',
        description: 'Classic Combination of Onions & Chicken Tikka. [Fat-10.1 per 100 g, Protein-13 per 100 g, Carbohydrate-30.4 per 100 g, Sugar-1.8 per 100 g, Calories-264.2 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Hawaiian Special (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/3.jpeg',
        description: 'Taste of hot & savoury Pineapple,Salami & Cheese. [Fat-4.6 per 100 g, Protein-8 per 100 g, Carbohydrate-33.7 per 100 g, Sugar-2.5 per 100 g, Calories-207.8 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Korma Delight (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/4.jpeg',
        description: 'A pizza with Indian twist of Onions,Chicken Seekh Kabab & Korma Dip. [Fat-14 per 100 g, Protein-7.4 per 100 g, Carbohydrate-22.1 per 100 g, Sugar-1.9 per 100 g, Calories-244.1k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Seekh Special (personal Giant Slice (22.5 Cm))',
        price: '₹190',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/5.jpeg',
        description: 'Blend of delicious Chicken Seekh Kabab, juicy Sweet Corns & Cheese. [Fat-7.4 per 100 g, Protein-12.6 per 100 g, Carbohydrate-37.4 per 100 g, Sugar-6.2 per 100 g, Calories-267 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicago Delight Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/6.jpeg',
        description: 'A Chicken Feast Pizza that has Chicken Tikka, Chicken Salami & Onions. [Fat-5.8 per 100 g, Protein-15.6 per 100 g, Carbohydrate-33 per 100 g, Sugar-4 per 100 g, Calories-246.9 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicken De-light Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/7.jpeg',
        description: 'A Special Trip to Chicken Salami, Chicken Seekh & Mutton Keema. [Fat-6.2 per 100 g, Protein-10.8 per 100 g, Carbohydrate-42.2 per 100 g, Sugar-4 per 100 g, Calories-268.1 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Tandoori Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/8.jpeg',
        description: 'Our take on Tandoori Chicken! Pizza Infused with Onion,Capsicum, Chicken Tikka & Korma Dip. [Fat-5.9 per 100 g, Protein-10 per 100 g, Carbohydrate-60.8 per 100 g, Sugar-2.9 per 100 g, Calories-336.5 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Texas Bbq\'ed Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹255',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/9.jpeg',
        description: 'A Special Fusion of Onion,Capsicum & BBQ Chicken. [Fat-5.1 per 100 g, Protein-12.9 per 100 g, Carbohydrate-40.3 per 100 g, Sugar-1.8 per 100 g, Calories-258.3 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Hot Tandoori Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/10.jpeg',
        description: 'Tandoor it up with Chicken Tikka, Chicken Seekh Kebab, Jalapenos & red paprika. [Fat-5.7 per 100 g, Protein-9.9 per 100 g, Carbohydrate-30.6 per 100 g, Sugar-2.8 per 100 g, Calories-213.2 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Indian Chicken Special Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/11.jpeg',
        description: 'Our Indian Special Pizza Infused with Chicken Seekh Kebab,Chicken Tikka,Chicken Salami,Onions & Cheese Dip. [Fat-9.8 per 100 g, Protein-12.9 per 100 g, Carbohydrate-35.2 per 100 g, Sugar-2.9 per 100 g, Calories-280.6 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Korma Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/12.jpeg',
        description: 'Need some Indian Zing to your pizza? Top it up with Bbq Chicken,Sausages,Capsicum,Red Paprika & Korma Dip. [Fat-8 per 100 g, Protein-9.9 per 100 g, Carbohydrate-27.2 per 100 g, Sugar-0 per 100 gm, Calories-220.4 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'La Pino\'z Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/13.jpeg',
        description: 'A Tri Fecta of Chicken. Chicken Tikka, BBQ Chicken & Smoked Chicken. [Fat-7.9 per 100 g, Protein-14.6 per 100 g, Carbohydrate-32.5 per 100 g, Sugar-2 per 100 g, Calories-259.1 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Mixed Grill Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/14.jpeg',
        description: 'A Special Mutton Feast with Mutton Keema,Chicken Tikka,Onions,Peri Peri Dip. [Fat-10 per 100 g, Protein-9.5 per 100 g, Carbohydrate-29.9 per 100 g, Sugar-3.9 per 100 g, Calories-248.1 cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Non-veg Hawaiian Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹285',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/15.jpeg',
        description: 'Nothing says Hawaiian like Double Chicken Salami,Smoked Chicken,Pineapple & Extra Cheese. [Fat-6.9 per 100 g, Protein-3.6 per 100 g, Carbohydrate-14.9 per 100 g, Sugar-2.5 per 100 g, Calories-135.8 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Non-veg Tamer Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹295',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/16.jpeg',
        description: 'All the Non-Veg. Toppings with Extra Cheese. [Fat-6.72 per 100 g, Protein-10.4 per 100 g, Carbohydrate-32.6 per 100 g, Sugar-0.6 per 100 g, Calories-232.5 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'California Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/17.jpeg',
        description: 'A Special Fusion of Smoked Chicken,Chicken Sheekh,Chicken BBQ,Chicken Salami With Extra Cheese. [Fat-8.4 per 100 g, Protein-11.8 per 100 g, Carbohydrate-23.7 per 100 g, Sugar-2 per 100 g, Calories-217.6 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Cheesy Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/18.jpeg',
        description: 'When Cheese Meets Chicken! Onions,Olives,Chicken Bbq,Smoked Chicken,Chicken Salami & Cheesy Dip. [Fat-6.1 per 100 g, Protein-10.2 per 100 g, Carbohydrate-25.7 per 100 g, Sugar-3 per 100 g, Calories-198.5 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Cheesy Macaroni Non-veg Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/19.jpeg',
        description: 'A Flavour Bomb of Chicken Tikka,Salami,Smoked Chicken With Loads Of Cheese. [Fat-11.7 per 100 g, Protein-12.3 per 100 g, Carbohydrate-30.4 per 100 g, Sugar-3.5 per 100 g, Calories-276.1 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Chicken Tikka Lababdar Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/20.jpeg',
        description: 'A tangy Indian twist. Chicken TIkka, BBQ Chicken & mutton keema with a kadahi dip. [Fat-7.4 per 100 g, Protein-8.1 per 100 g, Carbohydrate-23.6 per 100 g, Sugar-1.8 per 100 g, Calories-193.4 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Fire-e-chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/21.jpeg',
        description: 'A spicy concoction of hot and garlic dip, Onion, Capsicum, Jalapenos with Chicken TIkka, Chicken Seekh and BBQ chicken. [Fat-6.9 per 100 g, Protein-14.8 per 100 g, Carbohydrate-25.6 per 100 g, Sugar-2.8 per 100 g, Calories-223.7 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Meat Blast Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/22.jpeg',
        description: 'An overload of meat with chicken tikka, double mutton keema, Jalapenos, Red paprika & extra cheese. [Fat-8.3 per 100 g, Protein-10.1 per 100 g, Carbohydrate-28.7 per 100 g, Sugar-4.1 per 100 g, Calories-230 k.cal] Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Peri Peri - Chicken Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/23.jpeg',
        description: 'Spice it Up with Bbq Chicken,Chicken Sausages,Onion,Red Paprika,Smoked Chicken,Chicken Salami & Peri Peri Dip. [Fat-9.1 per 100 g, Protein-14.7 per 100 g, Carbohydrate-25.2 per 100 g, Sugar-5 per 100 g, Calories-241.5 k.cal]Nutritional information per 100g',
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Spanish Sizzles Pizza (personal Giant Slice (22.5 Cm))',
        price: '₹325',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/PersonalSliceNonVegPizza/24.jpeg',
        description: 'An exotic combination of chicken tikka, chicken seekh kebab, chicken salami, BBQ chicken, Capsicum, Jalapenos Dip. [Fat-7.2 per 100 g, Protein-9.8 per 100 g, Carbohydrate-24.1 per 100 g, Sugar-2 per 100 g, Calories-200.4 k.cal]Nutritional information per 100g',
      ),
    ],
  ),
  CategoryItem(
    categoryName: 'Buy 2 Pizza @ 699',
    subCategoryList: [
      SubCategoryItem(
        subCategoryName: 'Super Saver Deal: 2 Medium Veg Pizza @ 649',
        subMenu: [
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: '2 Medium Pizza Starting At Rs 649',
            price: '₹649',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Buy2Pizza/Super%20Saver%20Deal%20%202%20Medium%20Veg%20Pizza%20%40%20649/1.jpeg',
            description: 'Choose any 2 of your Veg Medium Pizza',
            rating: 3.5,
            noOfRatings: 6,
          )
        ],
      ),
      SubCategoryItem(
        subCategoryName: 'Super Saver Deal: 2 Medium Non Veg Pizza @ 649',
        subMenu: [
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: '2 Medium Non-veg Pizza @ 649',
            price: '₹649',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/Buy2Pizza/Super%20Saver%20Deal%20%202%20Medium%20Non%20Veg%20Pizza%20%40%20649/1.jpeg',
            description: 'Choose any 2 of your Non Veg Medium Pizza',
          )
        ],
      ),
    ],
  ),
  CategoryItem(
    categoryName: 'Quesadilla-fantastic Four',
    menu: [
      MenuItem(
        isVeg: true,
        isBestseller: false,
        name: 'Quesadilla Pack Of 4 (veg)',
        price: '₹259',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/QuesadillaFantasticFour/1.jpeg',
        description: 'Cheese & Cheese, Paneer, Sweet corn & Cheese, Mushroom, Olives & Cheese, Sweet Corn, Jalapenos & Cheese',
        rating: 4.4,
        noOfRatings: 9,
      ),
      MenuItem(
        isVeg: false,
        isBestseller: false,
        name: 'Quesadilla Pack Of 4 (non - Veg)',
        price: '₹299',
        urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/QuesadillaFantasticFour/2.jpeg',
        description: 'Bbq Chicken & Cheese, Chicken Tikka, Jalapenos & Cheese, Mutton Keema, Jalapenos & Cheese, Salami,Smoke Chicken & Cheese',
        rating: 3.8,
        noOfRatings: 10,
      ),
    ],
  ),
  CategoryItem(
    categoryName: 'Classic Pizzas',
    subCategoryList: [
      SubCategoryItem(
        subCategoryName: 'Classic Pizzas - Veg',
        subMenu: [
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Tomatoes Pizza',
            price: '₹79',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/1.jpeg',
            description: 'Thinly cut fresh tomatoes on a cheesy base with in house sauce. [Fat-6.9 per 100 g, Protein-5.1 per 100 g, Carbohydrate-29.8 per 100 g, Sugar-4 per 100 g, Calories-201.7 k.cal]Nutritional information per 100g',
            rating: 4.2,
            noOfRatings: 194,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Onions Pizza',
            price: '₹89',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/2.jpeg',
            description: 'Onions on a cheesy base with in house sauce. [Fat-7 per 100 g, Protein-12.2 per 100 g, Carbohydrate-50.8 per 100 g, Sugar-7 per 100 g, Calories-315 k.cal]Nutritional information per 100g',
            rating: 4.1,
            noOfRatings: 192,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Sweet Corns Pizza',
            price: '₹109',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/3.jpeg',
            description: 'Sweet and juicy golden corn with our in house sauce. [Fat-5 per 100 g, Protein-10.1 per 100 g, Carbohydrate-50.2 per 100 g, Sugar-6 per 100 g, Calories-286.2 k.cal]Nutritional information per 100g',
            rating: 4.1,
            noOfRatings: 168,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Capsicum Pizza',
            price: '₹109',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/4.jpeg',
            description: 'Fresh and crispy capsicum cooked to perfection. [Fat-4.1 per 100 g, Protein-6.9 per 100 g, Carbohydrate-28.9 per 100 g, Sugar-3.2 per 100 g, Calories-180.1k.cal]Nutritional information per 100g',
            rating: 4.1,
            noOfRatings: 28,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Pesto Veg',
            price: '₹129',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/5.jpeg',
            description: 'Capsicum+Sweet Corn+Pesto Basil Dip',
            rating: 3.7,
            noOfRatings: 3,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Spicy Veg',
            price: '₹129',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/6.jpeg',
            description: 'Capsicum+Sweet Corn+Chilli Garlic Sauce',
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Cheesy',
            price: '₹135',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/7.jpeg',
            description: 'Loaded with Cheese',
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Korma Pyaza',
            price: '₹135',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/8.jpeg',
            description: 'Onion+Capsicum+Sweet Corn+Korma Dip',
            rating: 4.3,
            noOfRatings: 3,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Loaded Pesto',
            price: '₹135',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/9.jpeg',
            description: 'Sweet Corn+Mushrooms+Pesto Basil Dip',
            rating: 3.4,
            noOfRatings: 5,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Onions & Capsicum Pizza',
            price: '₹129',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/10.jpeg',
            description: 'A delectable combination of freshly cooked onions & capsicum with our in house sauce. [Fat-5.7 per 100 g, Protein-7.4 per 100 g, Carbohydrate-10.8 per 100 g, Sugar-3.5 per 100 g, Calories-124.1 k.cal]Nutritional information per 100g',
            rating: 4.3,
            noOfRatings: 55,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Onions & Paneer Pizza',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/11.jpeg',
            description: 'A delectable combination of freshly cooked onions & paneer with our in house sauce. [Fat-21.2 per 100 g, Protein-20.3 per 100 g, Carbohydrate-24.1 per 100 g, Sugar-2.9 per 100 g, Calories-368.4 k.cal]Nutritional information per 100g',
            rating: 3.8,
            noOfRatings: 121,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Capsicum & Paneer Pizza',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/12.jpeg',
            description: 'A delectable combination of freshly cooked capsicum & paneer with our in house sauce. [Fat-7.6 per 100 g, Protein-7.3 per 100 g, Carbohydrate-50.1 per 100 g, Sugar-3.3 per 100 g, Calories-298 k.call]Nutritional information per 100g',
            rating: 4.2,
            noOfRatings: 20,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: false,
            name: 'Jalapenos & Olives Pizza',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/13.jpeg',
            description: 'Remarkable Blend of Jalapenos and Black Olives. [Fat-8.6 per 100 g, Protein-8.7 per 100 g, Carbohydrate-25.2 per 100 g, Sugar-2 per 100 g, Calories-213 k.cal]Nutritional information per 100g',
            rating: 4.3,
            noOfRatings: 7,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Capsicum, Paneer & Red Paprika Pizza',
            price: '₹145',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/14.jpeg',
            description: 'Flavorful trio of Juicy Paneer, Crisp Capsicum with Spicy Red Paprika. [Fat-10.2 per 100 g, Protein-16.4 per 100 g, Carbohydrate-29.5 per 100 g, Sugar-3.2per 100 g, Calories-275.4 k.cal]Nutritional information per 100g',
            rating: 4.0,
            noOfRatings: 198,
          ),
          MenuItem(
            isVeg: true,
            isBestseller: true,
            name: 'Jalapenos, Sweet Corns & Paneer Pizza',
            price: '₹149',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Veg/15.jpeg',
            description: 'Appetizing Combination of Juicy Paneer, Sweet Corn and Jalapeno in our in House Sauce. [Fat-9.8 per 100 g, Protein-15.1 per 100 g, Carbohydrate-38.2 per 100 g, Sugar-4.9 per 100 g, Calories-301 k.cal]Nutritional information per 100g',
            rating: 3.8,
            noOfRatings: 57,
          ),
        ],
      ),
      SubCategoryItem(
        subCategoryName: 'Classic Pizzas - Non-Veg',
        subMenu: [
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Bbq Chicken Pizza',
            price: '₹125',
            urlImage: '',
            description: 'BBQ chicken on a pizza base with loads of cheese & in house BBQ Sauce. [Fat-9.7 per 100 g, Protein-15.7 per 100 g, Carbohydrate-25.6 per 100 g, Sugar-4.2 per 100 g, Calories-252.5 k.cal]Nutritional information per 100g',
            rating: 4.6,
            noOfRatings: 14,
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Pesto Non-veg',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/2.jpeg',
            description: 'Sweet Corn+Chicken Salami+Pesto Basil Dip',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Spicy Non-veg',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/3.jpeg',
            description: 'Sweet Corn+Bbq Chicken+Chilli Garlic Sauce',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Capsicum & Chicken Tikka Pizza',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/4.jpeg',
            description: 'Crispy Capsicum with Delicious Chicken in a Fresh Pan Crust. [Fat-7.2 per 100 g, Protein-8.3 per 100 g, Carbohydrate-26.2 per 100 g, Sugar-1.7 per 100 g, Calories-202.8 k.cal]Nutritional information per 100g',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Korma Non-veg',
            price: '₹139',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/5.jpeg',
            description: 'Onion+Chicken Seekh+Chicken Salami+Korma Dip',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Chicken Tikka & Chicken Salami Pizza',
            price: '₹145',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/6.jpeg',
            description: 'Classic Combination of Chicken Tikka & Chicken Salami. [Fat-12.8 per 100 g, Protein-30.6 per 100 g, Carbohydrate-37.6 per 100 g, Sugar-1.6 per 100 g, Calories-388 k.cal]Nutritional information per 100g',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Chicken Seekh & Chicken Salami Pizza',
            price: '₹145',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/7.jpeg',
            description: 'Smokey Chicken Sheekh & Chicken Salami Topped on Fresh Pan Crust Pizza. [Fat-10.6 per 100 g, Protein-17.4 per 100 g, Carbohydrate-25.2 per 100 g, Sugar-3.2 per 100 g, Calories-265.8 k.cal]Nutritional information per 100g',
          ),
          MenuItem(
            isVeg: false,
            isBestseller: false,
            name: 'Keema & Onion Pizza',
            price: '₹159',
            urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/MenuImages/ClassicPizzas/Classic%20Pizzas%20-%20Non-Veg/8.jpeg',
            description: 'Perfect Blend of Keema & Onion Prepared in our in House Sauce. [Fat-14 per 100 g, Protein-11.7 per 100 g, Carbohydrate-36 per 100 g, Sugar-1.4 per 100 g, Calories-316.8 k.cal]Nutritional information per 100g',
          ),
        ],
      ),
    ],
  ),
];

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

List<CardItem> homeRestaurantItems = [
  CardItem(
    urlImage: 'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/restaurantImages/1.jpeg',
    restaurantName: 'Kwality Walls Frozen Dessert and Ice Cream Shop',
    rating: '4.3',
    noOfRatings: '1K+',
    time: '19 mins',
    tags: 'Desserts, Ice Cream',
    address: 'Sadul Ganj',
    distance: '4.6 km',
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
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
    categoryList: customCategoryList,
  ),
];

class FilterCardItem {
  final String text;
  final String? image;
  final double? size;

  const FilterCardItem({required this.text, this.image, this.size});
}

List<FilterCardItem> filterItems = const [
  FilterCardItem(text: 'Filter', image: 'icons/filter.png', size: 18),
  FilterCardItem(text: 'Sort by', image: 'icons/arrowdown.png', size: 13),
  FilterCardItem(text: 'Fast Delivery'),
  FilterCardItem(text: 'Cuisines', image: 'icons/arrowdown.png', size: 13),
  FilterCardItem(text: 'New on Swiggy'),
  FilterCardItem(text: 'Ratings 4.0+'),
  FilterCardItem(text: 'Pure Veg'),
  FilterCardItem(text: 'Rs. 300-Rs. 600'),
  FilterCardItem(text: 'Less than Rs.300'),
];

class SettingCardItem {
  final String title1;
  final String title2;
  final String imagePath;

  const SettingCardItem({required this.title1, required this.title2, required this.imagePath});
}

List<SettingCardItem> settingItems = const [
  SettingCardItem(title1: 'My Account', title2: 'Favourites, Hidden restaurants & Settings', imagePath: 'icons/arrowdown.png'),
  SettingCardItem(title1: 'Addresses', title2: 'Share, Edit & Add New Addresses', imagePath: 'icons/arrowdown.png'),
  SettingCardItem(title1: 'Payments & Refunds', title2: 'Refund Status & Payment Modes', imagePath: 'icons/arrowdown.png'),
  SettingCardItem(title1: 'Swiggy Money', title2: 'View Account Balance & Transcations History', imagePath: 'icons/arrowdown.png'),
  SettingCardItem(title1: 'Redeem 3rd-Party Coupon', title2: 'Avail corporate or third-party discounts on Swiggy One', imagePath: 'icons/arrowdown.png'),
  SettingCardItem(title1: 'Help', title2: 'FAQs & Links', imagePath: 'icons/arrowdown.png'),
];

class OffersCardItem {
  final String title1;
  final String title2;
  final String title3;
  final String? imagePath;

  const OffersCardItem({
    required this.title1,
    required this.title2,
    required this.title3,
    this.imagePath,
  });
}

List<OffersCardItem> offerItems = const [
  OffersCardItem(title1: '20% off upto ₹100', title2: 'USE RUPAY100 ', title3: ' ABOVE ₹129', imagePath: 'icons/rupay.png'),
  OffersCardItem(title1: '20% off upto ₹150', title2: 'USE ICICIFEST ', title3: ' ABOVE ₹600', imagePath: 'icons/icic.png'),
  OffersCardItem(title1: '15% off upto ₹80', title2: 'USE JUMBO ', title3: ' ABOVE ₹400'),
  OffersCardItem(title1: '20% off upto ₹200', title2: 'USE INDUSIND20 ', title3: ' ABOVE ₹600', imagePath: 'icons/indusind.png'),
  OffersCardItem(title1: '15% off upto ₹300', title2: 'USE CITIFOODIE ', title3: ' ABOVE ₹1200', imagePath: 'icons/citi.png'),
];
