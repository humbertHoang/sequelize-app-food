/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Margherita Pizza', 'margherita.jpg', 12.99, 'Classic pizza with tomato, mozzarella, and basil', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Chicken Tacos', 'chicken_tacos.jpg', 8.99, 'Three soft corn tortillas with grilled chicken', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Cheeseburger', 'cheeseburger.jpg', 9.99, 'Beef patty with cheese, lettuce, and tomato', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Chocolate Cake', 'chocolate_cake.jpg', 5.99, 'Rich and decadent chocolate cake', 4),
(5, 'Soda', 'soda.jpg', 2.5, 'Fizzy and refreshing', 5),
(6, 'Lasagna', 'lasagna.jpg', 14.99, 'Homemade lasagna with layers of meat and cheese', 1),
(7, 'Burrito Bowl', 'burrito_bowl.jpg', 10.99, 'Your choice of meat, rice, beans, and toppings', 2),
(8, 'Double Cheeseburger', 'double_cheeseburger.jpg', 12.99, 'Two beef patties with cheese and toppings', 3),
(9, 'Ice Cream Sundae', 'ice_cream_sundae.jpg', 7.99, 'Vanilla ice cream with your choice of toppings', 4),
(10, 'Iced Coffee', 'iced_coffee.jpg', 3.5, 'Cold and refreshing iced coffee', 5),
(11, 'Pho with Beef', 'pho_beef.jpg', 11.99, 'Traditional Vietnamese noodle soup with beef', 6),
(12, 'California Roll', 'california_roll.jpg', 9.99, 'Sushi roll with crab, avocado, and cucumber', 7),
(13, 'Orange Chicken', 'orange_chicken.jpg', 10.99, 'Crispy chicken in a sweet and tangy orange sauce', 8),
(14, 'Chicken Tikka Masala', 'chicken_tikka_masala.jpg', 13.99, 'Chicken in a creamy tomato-based curry', 9),
(15, 'Caesar Salad', 'caesar_salad.jpg', 8.99, 'Romaine lettuce with Caesar dressing and croutons', 10),
(16, 'Pancakes', 'pancakes.jpg', 7.99, 'Fluffy pancakes with syrup and butter', 11),
(17, 'Spaghetti Carbonara', 'spaghetti_carbonara.jpg', 13.99, 'Spaghetti with egg, cheese, pancetta, and black pepper', 1),
(18, 'Taco Salad', 'taco_salad.jpg', 9.99, 'Lettuce, meat, cheese, and toppings in a crispy tortilla bowl', 2),
(19, 'Fries', 'fries.jpg', 3.99, 'Crispy golden french fries', 3),
(20, 'Brownie', 'brownie.jpg', 4.99, 'Fudgy chocolate brownie', 4),
(21, 'Lemonade', 'lemonade.jpg', 2.99, 'Sweet and tart lemonade', 5),
(22, 'Spring Rolls', 'spring_rolls.jpg', 6.99, 'Fresh rice paper rolls with vegetables and shrimp or tofu', 6),
(23, 'Sashimi Platter', 'sashimi_platter.jpg', 18.99, 'Assortment of fresh raw fish', 7),
(24, 'Kung Pao Chicken', 'kung_pao_chicken.jpg', 11.99, 'Spicy stir-fried chicken with peanuts and vegetables', 8),
(25, 'Saag Paneer', 'saag_paneer.jpg', 12.99, 'Spinach and cheese curry', 9),
(26, 'Greek Salad', 'greek_salad.jpg', 9.99, 'Tomatoes, cucumbers, olives, feta cheese, and vinaigrette', 10),
(27, 'Omelette', 'omelette.jpg', 8.99, 'Customizable omelette with your choice of fillings', 11);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Fast Food');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Dessert'),
(5, 'Beverage'),
(6, 'Vietnamese'),
(7, 'Japanese'),
(8, 'Chinese'),
(9, 'Indian'),
(10, 'Salads'),
(11, 'Breakfast');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 1, '2023-10-26');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 1, 2, '2023-10-27');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 4, 2, '2023-10-25');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(5, 5, 3, '2023-10-25'),
(6, 6, 4, '2023-10-26'),
(7, 7, 5, '2023-10-26'),
(8, 8, 6, '2023-10-26'),
(9, 9, 7, '2023-10-27'),
(10, 10, 8, '2023-10-27'),
(11, 11, 9, '2023-10-27'),
(12, 12, 1, '2023-10-28'),
(13, 13, 2, '2023-10-28'),
(14, 4, 3, '2023-10-28'),
(15, 5, 4, '2023-10-28'),
(16, 6, 5, '2023-10-29'),
(17, 7, 6, '2023-10-29'),
(18, 8, 7, '2023-10-29'),
(19, 9, 8, '2023-10-29'),
(20, 10, 9, '2023-10-30'),
(21, 11, 1, '2023-10-30'),
(22, 12, 2, '2023-10-30'),
(23, 13, 3, '2023-10-30'),
(24, 4, 4, '2023-10-31'),
(25, 5, 5, '2023-10-31'),
(26, 6, 6, '2023-10-31'),
(27, 7, 7, '2023-10-31'),
(28, 8, 8, '2023-10-31'),
(29, 9, 9, '2023-10-31'),
(30, 10, 1, '2023-10-31'),
(31, 11, 2, '2023-10-31'),
(32, 12, 3, '2023-10-31'),
(33, 13, 4, '2023-10-31'),
(34, 3, 1, '2025-01-11');

INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORDER-123', '1');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 2, 3, 'ORDER-456', '2');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 1, 3, 1, 'ORDER-789', '3,4');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 6, 1, 'ORDER-100', '5'),
(5, 5, 11, 2, 'ORDER-101', '13'),
(6, 6, 15, 1, 'ORDER-102', '17'),
(7, 7, 20, 3, 'ORDER-103', '22'),
(8, 8, 4, 1, 'ORDER-104', '9'),
(9, 9, 9, 2, 'ORDER-105', '10,11'),
(10, 10, 14, 1, 'ORDER-106', '16'),
(11, 11, 18, 2, 'ORDER-107', '20'),
(12, 12, 23, 1, 'ORDER-108', '25,26'),
(13, 13, 27, 2, 'ORDER-109', '30'),
(14, 4, 1, 1, 'ORDER-110', '1'),
(15, 5, 7, 3, 'ORDER-111', '2'),
(16, 6, 12, 2, 'ORDER-112', NULL),
(17, 7, 16, 1, 'ORDER-113', '18'),
(18, 8, 21, 4, 'ORDER-114', '23'),
(19, 9, 3, 2, 'ORDER-115', '8'),
(20, 10, 8, 1, 'ORDER-116', NULL),
(21, 11, 13, 3, 'ORDER-117', '15'),
(22, 12, 17, 2, 'ORDER-118', '19'),
(23, 13, 22, 1, 'ORDER-119', '24'),
(24, 4, 26, 2, 'ORDER-120', '29'),
(25, 5, 5, 3, 'ORDER-121', NULL),
(26, 6, 10, 1, 'ORDER-122', NULL),
(27, 7, 19, 2, 'ORDER-123', '21'),
(28, 8, 24, 1, 'ORDER-124', '27'),
(29, 9, 2, 4, 'ORDER-125', '6,7'),
(30, 10, 15, 2, 'ORDER-126', '17'),
(31, 11, 4, 1, 'ORDER-127', '4'),
(32, 12, 9, 3, 'ORDER-128', '12'),
(33, 13, 14, 2, 'ORDER-129', '16'),
(34, 1, 4, 2, 'ORDER-130', NULL);

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 4, '2025-01-11');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 1, 4, '2023-10-25');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 2, 3, '2023-10-26');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 4, 4, '2023-10-25'),
(5, 5, 5, 5, '2023-10-25'),
(6, 6, 6, 3, '2023-10-25'),
(7, 7, 7, 2, '2023-10-26'),
(8, 8, 8, 4, '2023-10-26'),
(9, 9, 9, 5, '2023-10-26'),
(10, 10, 1, 3, '2023-10-26'),
(11, 11, 2, 4, '2023-10-27'),
(12, 12, 3, 5, '2023-10-27'),
(13, 13, 4, 2, '2023-10-27'),
(14, 4, 5, 3, '2023-10-27'),
(15, 5, 6, 4, '2023-10-27'),
(16, 6, 7, 5, '2023-10-28'),
(17, 7, 8, 1, '2023-10-28'),
(18, 8, 9, 2, '2023-10-28'),
(19, 9, 1, 3, '2023-10-28'),
(20, 10, 2, 4, '2023-10-28'),
(21, 11, 3, 5, '2023-10-29'),
(22, 12, 4, 4, '2023-10-29'),
(23, 13, 5, 3, '2023-10-29'),
(24, 4, 6, 2, '2023-10-29'),
(25, 5, 7, 1, '2023-10-29'),
(26, 6, 8, 4, '2023-10-30'),
(27, 7, 9, 5, '2023-10-30'),
(28, 8, 1, 4, '2023-10-30'),
(29, 9, 2, 3, '2023-10-30'),
(30, 10, 3, 2, '2023-10-30'),
(31, 11, 4, 1, '2023-10-30'),
(32, 12, 5, 4, '2023-10-31'),
(33, 13, 6, 5, '2023-10-31'),
(34, 14, 6, 5, '2025-01-11');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'The Italian Place', 'italian_place.jpg', 'Authentic Italian cuisine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'Taco Fiesta', 'taco_fiesta.jpg', 'Best tacos in town!');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Burger Joint', 'burger_joint.jpg', 'Juicy burgers and crispy fries');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(4, 'Pho 99', 'pho99.jpg', 'Authentic Vietnamese pho and other dishes'),
(5, 'Sushi House', 'sushi_house.jpg', 'Fresh sushi and Japanese cuisine'),
(6, 'Panda Express', 'panda_express.jpg', 'American Chinese food'),
(7, 'Curry Up Now', 'curry_up_now.jpg', 'Indian street food with a modern twist'),
(8, 'Salad Bowl', 'salad_bowl.jpg', 'Create your own healthy salads'),
(9, 'The Breakfast Club', 'breakfast_club.jpg', 'Classic breakfast and brunch options'),
(10, 'Hello Chicken', 'hello-chicken.png', 'District 7');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.5, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Guacamole', 2, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Bacon', 1, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Ice Cream Scoop', 1, 4),
(5, 'Avocado', 1.5, 1),
(6, 'Sour Cream', 0.75, 2),
(7, 'Jalapenos', 0.5, 2),
(8, 'Onion Rings', 2.5, 3),
(9, 'Whipped Cream', 0.75, 4),
(10, 'Hot Fudge', 1, 9),
(11, 'Caramel Sauce', 1, 9),
(12, 'Strawberries', 1.5, 9),
(13, 'Sriracha', 0.5, 11),
(14, 'Soy Sauce', 0.25, 12),
(15, 'Chili Sauce', 0.5, 13),
(16, 'Extra Naan', 1.5, 14),
(17, 'Dressing', 0.75, 15),
(18, 'Maple Syrup', 0.5, 16),
(19, 'Mushrooms', 1, 17),
(20, 'Pico de Gallo', 1, 18),
(21, 'Ketchup', 0.25, 19),
(22, 'Chocolate Sauce', 1, 20),
(23, 'Lime Wedge', 0.25, 21),
(24, 'Hoisin Sauce', 0.5, 22),
(25, 'Wasabi', 0.5, 23),
(26, 'Ginger', 0.5, 23),
(27, 'Sweet Chili Sauce', 0.5, 24),
(28, 'Raita', 1, 25),
(29, 'Extra Feta', 1.5, 26),
(30, 'Cheese', 1, 27);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@email.com', 'password123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane.smith@email.com', 'securepass');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Peter Jones', 'peter.jones@email.com', 'p@$$wOrd');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Alice Johnson', 'alice.j@email.com', 'pass123'),
(5, 'Bob Williams', 'bob.w@email.com', 'secret'),
(6, 'Charlie Brown', 'charlie.b@email.com', 'brownie'),
(7, 'David Lee', 'david.l@email.com', 'davidlee1'),
(8, 'Emily Davis', 'emily.d@email.com', 'emilypass'),
(9, 'Frank Miller', 'frank.m@email.com', 'millerf'),
(10, 'Grace Wilson', 'grace.w@email.com', 'gracewil'),
(11, 'Henry Martinez', 'henry.m@email.com', 'henry123'),
(12, 'Isabella Garcia', 'isabella.g@email.com', 'bellapass'),
(13, 'Jack Rodriguez', 'jack.r@email.com', 'jackrod'),
(14, 'Inactive User', 'inactive@email.com', 'inactivepass');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;