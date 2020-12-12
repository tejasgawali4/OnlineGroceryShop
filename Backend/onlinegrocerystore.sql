-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 12:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinegrocerystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2018-05-25 05:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `bnimg` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `bnimg`) VALUES
(5, 'banner5.jpg'),
(11, 'banner1.jpg'),
(12, 'banner2.jpg'),
(13, 'banner3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categry` varchar(100) NOT NULL,
  `catedes` varchar(100) NOT NULL,
  `cateimg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categry`, `catedes`, `cateimg`) VALUES
(15, 'Personal Care', 'Upto 22% Off', '1580064256.png'),
(16, 'Household', 'Upto 36% Off', '69.jpg'),
(17, 'Biscuits Snacks', 'Upto 14% Off', '5.jpg'),
(19, 'Beverages', 'Upto 9% Off', '6.jpg'),
(20, 'Baby care', 'Upto 22% Off', '7.jpg'),
(21, 'Pet care', 'Upto 29% Off', '70.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `couponcode` varchar(55) NOT NULL,
  `rate` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `couponcode`, `rate`) VALUES
(1, 'ZIS10', '10'),
(2, 'DIWALI50', '50');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryareas`
--

CREATE TABLE `deliveryareas` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveryareas`
--

INSERT INTO `deliveryareas` (`id`, `city`) VALUES
(2, 'Delhi'),
(3, 'Noida'),
(4, 'Gurgoan'),
(5, 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryboy`
--

CREATE TABLE `deliveryboy` (
  `id` int(11) NOT NULL,
  `dname` varchar(100) NOT NULL,
  `dmobile` varchar(100) NOT NULL,
  `dusername` varchar(100) NOT NULL,
  `dpassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveryboy`
--

INSERT INTO `deliveryboy` (`id`, `dname`, `dmobile`, `dusername`, `dpassword`) VALUES
(1, 'John', '9876543210', 'john@grocery', '123456'),
(8, 'Joseph', '9999999999', 'joseph@grocery', '12345'),
(9, 'mark', '222222222222', 'markita', '123456'),
(10, 'demo', '9864654656', 'demo', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fmsg` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `fmsg`) VALUES
(6, 'Testing feedback'),
(7, 'One again feedback '),
(8, 'Tests');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(50) NOT NULL,
  `mrp` varchar(50) NOT NULL,
  `quantity` varchar(11) NOT NULL,
  `quantitytype` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `homepage` varchar(10) NOT NULL DEFAULT 'NO',
  `offer` varchar(50) NOT NULL DEFAULT 'NO',
  `instock` varchar(50) NOT NULL DEFAULT 'YES'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `description`, `price`, `mrp`, `quantity`, `quantitytype`, `image`, `homepage`, `offer`, `instock`) VALUES
(22, 'Aashirvaad Chakki Atta', '14', 'Made with superior quality wheat Prepares soft and delicious roti Rich source of Fibre Consists of heavier in feel quality flour                              ', '32', '35', '10', 'Kg', 'aa.jpg', 'YES', 'YES', 'NO'),
(23, 'Aashirvaad Multigrain Atta', '14', 'AASHIRVAAD Atta with Multigrains gives you the wholesome goodness of six different grains – wheat, soya, channa, oat, maize and psyllium husk. These ingredients infuse proteins, vitamins, minerals and fibre into your diet. So you and your family stay active, healthy and energetic, everyday.', '23', '29', '5', 'Kg', 'as.jpg', 'YES', 'YES', 'YES'),
(24, 'Aashirvaad Select Atta', '14', 'Our experts hand-pick Sharbati wheat grains which are consistent in size and blessed with a golden sheen, that makes AASHIRVAAD Select Atta, truly Select. Which is why rotis made from Aashirvaad Select Atta have a delightful aroma and stay softer for longer.', '23', '26', '5', 'Kg', 'asd.jpg', 'YES', 'YES', 'YES'),
(26, 'Fortune Besan', '14', 'Made with 100 percent pure chana dal and advanced grinding technology, Fortune Besan retains nutrients and aroma of the pulses over time. Furthermore, this besan is untouched by hands and comes with a Purafresh Promise of 100 percent purity and great taste.', '12', '15', '1', 'Kg', 'dfd.jpg', 'YES', 'NO', 'YES'),
(27, 'Tata Sampann Besan', '14', 'Besan is a good source of thiamin and vitamin B-6. Thiamin is required for the conversion of food to energy where as Vitamin B-6 is essential for combining of the red blood cells and neurotransmitter serotonin, which generates mood and appetite. Besan is gluten-free flour used in the preparation of several sweet and savoury snacks. The super-fine flour prepared from pure chana dal, has an earthy aroma and binding nature that makes it a key ingredient in the batter used for preparing onion pakodas, traditional potato and vegetable bhajiyas, and some sweet dishes.', '13', '15', '500', 'Gm', 'aaaa.jpg', 'YES', 'NO', 'YES'),
(30, 'Mamy Poko Medium Pants', '19', 'India’s driest pants let your baby\'s skin be dry and breathe easy with the airy, soft comfort offered by the Pampers pants. While other ordinary pants seem dry from outside, Pampers pants with magic gel and larger absorbency zone keeps your baby dry from the inside for up to 12 hours.        ', '429', '500', '40', 'Pcs', 'mamy-poko-medium-pants-40.jpg', 'NO', 'NO', 'YES'),
(31, 'Nyle Damage Repair Hair Shampoo', '15', 'Sometimes the scent of seasonal hand wash is all we need to rouse our holiday spirits. Available in an array of festive fragrances, our naturally derived gel hand wash will leave your hands soft, clean and ready to be tucked into a pair of fair isle mittens. It really is the most wonderful time of the year.', '9', '12', '800', 'Ml', 'nyle-damage-repair-hair-shampoo.jpg', 'YES', 'NO', 'YES'),
(32, 'Himalya Total Care Medium Pants', '20', 'Powered by natural antirash shield: Indian aloe and yashad bhasma (zinc oxide) (that prevent risk of diaper rash) soft easy-to-fit design offers care and comfort to your baby, silky soft inner layer for soft and sensitive skin breathable fabric ensures proper air circulation and leak-proof soft elastic edges prevent leakage super absorbent polymer (sap) layer: rapidly absorbs multiple wettings and provides maximum protection from dampness wetness indicator: turns green to show when baby wets the diaper keeps skin dry so that baby gets an undisturbed and restful sleep.', '650', '700', '54', 'Pcs', 'himalya-total-care-medium-pants-54.jpg', 'YES', 'NO', 'YES'),
(33, 'Nyle Shampoo Dryness Hydration', '15', 'Sometimes the scent of seasonal hand wash is all we need to rouse our holiday spirits. Available in an array of festive fragrances, our naturally derived gel hand wash will leave your hands soft, clean and ready to be tucked into a pair of fair isle mittens. It really is the most wonderful time of the year.', '6', '8', '800', 'Ml', 'nyle-shampoo-dryness-hydration.jpg', 'YES', 'NO', 'YES'),
(34, 'Dove Baby Wipes Rich Moisture', '20', 'If you like baby wipes that leave your baby’s skin perfectly clean, as well as moisturized, these Baby Dove baby wipes remove impurities whilst moisturizing instantly. With a dermatologically and pediatrically tested, hypoallergenic and alcohol-free formula, there’s no need to look for special newborn baby wipes ­– Baby Dove Rich Moisture Baby Care Wipes are gentle as water and suitable and safe for your littlest little one as they are created with no parabens, no dyes and no phthalates. And with an easy-to-use pack that stays fresh once opened, you can easily pull individual baby wipes to get to the action quickly and effectively. Buy Now!', '82', '85', '50', 'Pcs', 'dove-baby-wipes-rich-moisture.jpg', 'NO', 'NO', 'YES'),
(35, 'Head & Shoulder Anti Hairfall Shampoo', '15', 'Sometimes the scent of seasonal hand wash is all we need to rouse our holiday spirits. Available in an array of festive fragrances, our naturally derived gel hand wash will leave your hands soft, clean and ready to be tucked into a pair of fair isle mittens. It really is the most wonderful time of the year.', '8', '10', '650', 'Ml', 'head--shoulder-anti-hairfall-shampoo.jpg', 'NO', 'NO', 'YES'),
(37, 'So fit soya Milk vanila', '19', 'While we work to ensure that product information is correct, on occasion manufacturers may alter their ingredient lists. Actual product packaging and materials may contain more and/or different information than that shown on our web site. We recommend that you do not solely rely on the information presented and that you always read labels, warnings, and directions before using or consuming a product. For additional information about a product, please contact the manufacturer.', '125', '130', '1', 'Ltr', 'so-fit-soya-milk-vanila-1l.jpg', 'YES', 'NO', 'YES'),
(38, 'Hersheys Milk Shake Chocolate	', '19', 'Hershey India is present across multiple food and beverage categories with its iconic brands. The Hershey’s brand brings happiness with its delicious products ranging from Hershey’s syrup, Hershey’s milk booster, Hershey’s spreads, Hershey’s milk shake and Hershey’s cocoa powder. With Hershey’s syrup, you can stir up happiness every day and add a delicious twist to your everyday recipes with its range of flavors like chocolate, strawberry and caramel.', '33', '35', '200', 'Ml', 'hersheys-milk-shake-cookies-n-creme-200ml.jpg', 'YES', 'NO', 'YES'),
(40, 'Cadbury Bournvita Chocolate Health Drink Jar', '19', 'While we work to ensure that product information is correct, on occasion manufacturers may alter their ingredient lists. Actual product packaging and materials may contain more and/or different information than that shown on our web site. We recommend that you do not solely rely on the information presented and that you always read labels, warnings, and directions before using or consuming a product. For additional information about a product, please contact the manufacturer.\r\n                ', '103', '105', '200', 'Gm', 'cadbury-bournvita-chocolate-health-drink-jar-200gm.jpg', 'NO', 'NO', 'YES'),
(41, 'Pedigree Chicken & Veg Adult Food', '21', 'PEDIGREE complete and balanced dog food for adult dogs is a wholesome meal packed with essential nutrients vital to the healthy growth of your pet. PEDIGREE, with the goodness of cereals, chicken, meat, and the nutrients blend into a tasty and healthy treat for your furry friend.', '570', '600', '3', 'Kg', '31jax5d5fgl._ac_ul320_ml3_.jpg', 'NO', 'NO', 'YES'),
(42, 'Pedigree Jumbone', '21', 'Pedigree jumbone with chicken and rice complementary pet food for adult dogs..', '124', '160', '200', 'Gm', 'pedigree-jumbone-200.jpg', 'NO', 'NO', 'YES'),
(43, 'Drools Dog Food Adult', '21', '          Drools Chicken and Egg Adult Dry Dog Food offers a complete and balanced nutritional diet for your dog. We use Real Chicken which is our #1 ingredient, making our food rich in protein which helps in maintaining lean muscles for top body condition of your dog. It boosts digestive ability and strengthens immune system to keep them active and healthy all day long. All the raw materials used are thoroughly checked to maintain the quality and safety of our food.                  ', '2050', '2200', '20', 'Gm', 'drools-dog-food-adult-20kg.jpg', 'NO', 'NO', 'YES'),
(44, 'Pedigree Dog Biscuit Milk & Chicken', '21', 'PEDIGREE Chicken & Milk for Puppy is a wholesome meal, packed with essential nutrients vital to the healthy growth of your pet. The natural goodness of cereals, chicken, meat, soybean, carrots, peas & milk blend into a tasty treat for your little one.', '155', '200', '500', 'Gm', 'pedigree-dog-biscuit-milk--chicken-500.jpg', 'YES', 'NO', 'YES'),
(45, 'Drools Dog Food Chicken & Egg', '21', 'Drools Chicken and Egg Adult Dry Dog Food offers a complete and balanced nutritional diet for your dog. We use Real Chicken which is our #1 ingredient, making our food rich in protein which helps in maintaining lean muscles for top body condition of your dog. It boosts digestive ability and strengthens immune system to keep them active and healthy all day long. All the raw materials used are thoroughly checked to maintain the quality and safety of our food.\r\n\r\n  ', '150', '160', '180', 'Gm', 'drools-dog-food-chicken--egg--3kg.jpg', 'YES', 'NO', 'YES'),
(46, 'Pampers Diaper Medium', '20', 'This diaper is infused with baby lotion, which moisturizes and nourishes your baby\'s skin and protects it from diaper rash, roughness and irritation. With an outer layer of cotton like softness, this baby diaper provides intense care to your baby\'s sensitive skin and protects it effectively from friction rash and redness. Featuring pant style design, these Pamper diapers are easy to put on your baby and change, which comes as a great help to mothers.    ', '1299', '1400', '90', 'Pcs', 'pampers-diaper-medium-90.jpg', 'NO', 'NO', 'YES'),
(47, 'Amul Lassi Edge	', '19', 'Amul Lassi Rose Edge Tetra Pack, 250 ml', '19', '23', '250', 'Ml', 'amul-lassi-edge-250ml.jpg', 'NO', 'NO', 'YES'),
(48, 'Amul Kool Kesar Drink', '19', 'Amul Kool Kesar is refreshing milk with taste of Saffron (Kesar). It is an easy to use delicious drink that refreshes you immediately with goodness of milk. Available in easy to use Tetrapak, Glass Bottles, Pet Bottles and Cans.', '19', '24', '180', 'Ml', 'amul-kool-kesar-drink-180ml.jpg', 'NO', 'NO', 'YES'),
(49, 'Kissan Dip Sauce', '19', 'Kissan Sauce is made from 100% real tomatoes. It serves as an excellent dip/accompaniment with all Indian and western snacks. Has the right colour, tanginess and consistency which makes it a perfect dip!', '23', '29', '1', 'Kg', 'dip-sauce-1kh.jpg', 'YES', 'NO', 'YES'),
(50, 'Kissan Tomato Ketchup', '19', 'Relish the taste of ripe tomatoes with Kissan Tomato Ketchup in which hand picked high quality tomatoes make the great taste to this sauce. With its smooth texture, the sauce is easily to spread, use and serve alongside food. It is packed using the latest technology to seal the freshness of its natural ingredients. Its every drop offers a burst of taste to make your taste buds come alive. You can let your imagination and creativity run wild with this sauce and your snacks! Make meals fun for your family, friends and yourself with this delicious Kissan Tomato Ketchup, buy this bottle right away!', '21', '26', '200', 'Gm', 'kissan-200.jpg', 'YES', 'NO', 'YES'),
(51, 'Unibic Biscuits Choco Nut', '17', 'Loved equally by adults and children, these cookies are well-known for their rich chocolaty taste and nutty flavor. Rich choconut cookies Contains chocolate and crunchy nuts Zero percent cholestrol Trans fat Free', '6', '8', '75', 'Gm', 'choconut-cookies.jpg', 'NO', 'NO', 'YES'),
(52, 'Lays Cream & Onion Chips', '17', 'Lay\'s is the brand name for a number of potato chip varieties, as well as the name of the company that founded the chip brand in the U.S. It has also been called Frito-Lay with Fritos. Lay\'s has been owned by PepsiCo through Frito-Lay since 1965', '19', '23', '52', 'Gm', 'lays-cream--onion-chips.jpg', 'NO', 'NO', 'YES'),
(53, 'Lays Maxx Chips', '17', 'Lay\'s is the brand name for a number of potato chip varieties, as well as the name of the company that founded the chip brand in the U.S. It has also been called Frito-Lay with Fritos. Lay\'s has been owned by PepsiCo through Frito-Lay since 1965', '4', '8', '58', 'Gm', 'lays-max-chips-sizzling-barbeque.jpg', 'NO', 'NO', 'YES'),
(54, 'Surf excelMatic', '16', 'Washing Powder Will Fight Tough Stains for You. Shop Ariel™ Today! Get Rid of Tough Stains. Excellent Cleaning. Learn About Our Products. Get Cleaner Clothes. Removes Tough Stains. A Lasting Fresh Scent. Impeccable Cleaning.', '32', '35', '1', 'Kg', 'surf-excelmatic-detergent-powder-front-loaded-1kg.jpg', 'NO', 'NO', 'YES'),
(55, 'Surf excel quick', '16', 'Washing Powder Will Fight Tough Stains for You. Shop Ariel™ Today! Get Rid of Tough Stains. Excellent Cleaning. Learn About Our Products. Get Cleaner Clothes. Removes Tough Stains. A Lasting Fresh Scent. Impeccable Cleaning.', '15', '20', '2', 'Kg', 'surf-excel-quick-wash-detergent-powder-2kg.jpg', 'NO', 'NO', 'YES'),
(56, 'Hit Flying Insect Killer', '16', '', '23', '25', '625', 'Ml', 'hit-flying-insect-killer-spray-625ml.jpeg', 'NO', 'NO', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `cmobile` varchar(50) NOT NULL,
  `cmsg` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `cname`, `cmobile`, `cmsg`) VALUES
(9, 'Aniket', '7032909455', 'Hello'),
(10, 'Abc', '8787545455', 'Bsjsbsbsbs'),
(11, 'James Bell', '9898899999', 'THis message sent by James Bell from Contact us menu of Grocery app'),
(12, 'Sam', '98609870878', 'Testing');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `title`, `description`) VALUES
(2, '10% off on Flat', '10% off on Flat Price of Masala'),
(3, 'godaddy coupons', '10'),
(14, '5% off on all milk items', 'Get 5% off on all milk items'),
(15, 'Offer', 'buy 2 get 1 free');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `city` varchar(50) NOT NULL,
  `area` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `status` varchar(50) DEFAULT 'Received',
  `total` varchar(50) NOT NULL,
  `shipping` varchar(50) NOT NULL,
  `paymenttype` varchar(50) NOT NULL,
  `payid` varchar(100) NOT NULL,
  `coupon` varchar(50) NOT NULL,
  `couponprice` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `dtype` varchar(50) NOT NULL,
  `dcode` varchar(50) NOT NULL,
  `driverid` varchar(50) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `user_id`, `fname`, `mobile`, `city`, `area`, `address`, `status`, `total`, `shipping`, `paymenttype`, `payid`, `coupon`, `couponprice`, `lat`, `lng`, `dtype`, `dcode`, `driverid`, `ordertime`) VALUES
(3, '1', 'Ajay', '7696355852', 'vcbdf', 'dgdfg', 'Amritsar', 'On Way', '429', '5', 'COD', '', 'NO', '50', '31.470741099999998', '74.95593649999999', '5PM-7PM', '4466', '1', '2020-04-12 10:02:06'),
(4, '1', 'Ajay', '7696355852', 'sdfsd', 'sdfs', 'Amritsar', 'Preparing', '602', '2', 'COD', '', 'NO', '', '', '', '5PM-7PM', '8061', '1', '2020-04-12 20:07:50'),
(5, '1', 'Ajay', '7696355852', 'DFFSDF', 'SFDSF', 'Amritsar', 'On Way', '602', '2', 'COD', '', 'NO', '', '31.470741099999998', '74.95593649999999', '5PM-7PM', '3755', '1', '2020-04-13 09:23:26'),
(6, '1', 'Ajay', '7696355852', 'sdasd', 'sdsad', 'Amritsar', 'Received', '74', '30', 'COD', '', 'NO', '0', '31.470741099999998', '74.95593649999999', '5PM-7PM', '5504', '1', '2020-04-13 17:39:48'),
(7, '1', 'Ajay', '7696355852', 'Amritsar', 'Amritsar', 'Tarn Taran Sahib, Bachre, Tarn Taran Sahib, Tarn Taran, Punjab, 143401, India, IN', 'Delivered', '165', '10', 'COD', '', 'NO', '0', '31.4623065', '74.9454486', '5PM-7PM', '1614', '', '2020-04-14 07:29:44'),
(8, '3', 'Prabhakar', '7075360360', 'Hyd', 'Hyd', '71-337/2, 2nd Zone, Mandamarri, Adilabad, Telangana, 504231, India, IN', 'Preparing', '226', '10', 'COD', '', 'ZIS10', '10', '18.9773712', '79.4849771', '5PM-7PM', '8275', '1', '2020-04-14 08:27:28'),
(9, '3', 'Prabhakar', '7075360360', 'Hyd', 'Hyd', '71-337/2, 2nd Zone, Mandamarri, Adilabad, Telangana, 504231, India, IN', 'Cancelled', '126', '30', 'COD', '', 'NO', '0', '18.9773712', '79.4849771', '8AM-10AM', '9138', '1', '2020-04-14 08:59:05'),
(10, '4', 'Sriyantha', '0777183981', 'hendala', 'Wattala', '100/18, Hendala Road, Nayakakanda, Wattala, Gampaha, Western Province, Sri Lanka, LK', 'Confirmed', '266', '10', 'COD', '', 'NO', '0', '6.9932902', '79.8786895', '8AM-10AM', '6248', '', '2020-04-14 10:30:10'),
(11, '7', 'Tu', '0987654321', 'Ko', 'Gyy', 'Unnamed Road, Unnamed Road, Kestopur, Kolkata, Kolkata, West Bengal, 700059, India, IN', 'Delivered', '125', '10', 'COD', '', 'ZIS10', '10', '22.5933795', '88.453372', '8AM-10AM', '1535', '1', '2020-04-14 10:56:57'),
(12, '7', 'Tu', '0987654321', 'Kolkata', 'Tumi', 'Unnamed Road, Unnamed Road, Kestopur, Kolkata, Kolkata, West Bengal, 700059, India, IN', 'Preparing', '118', '10', 'COD', '', 'NO', '0', '22.5933795', '88.453372', '5PM-7PM', '7499', '1', '2020-04-14 11:23:46'),
(13, '7', 'Hjj', '0987654321', 'Vhh', 'Guu', 'Unnamed Road, Unnamed Road, Kestopur, Kolkata, Kolkata, West Bengal, 700059, India, IN', 'Confirmed', '43', '20', 'COD', '', 'NO', '0', '22.5933795', '88.453372', '12AM-2PM', '8456', '1', '2020-04-14 11:25:25'),
(14, '16', 'Sjdjdjdj', '9876543210', 'Golaghat', 'Fjfjfk', 'Fjfjcjc', 'Received', '147', '10', 'COD', '', 'DIWALI50', '50', '', '', '12AM-2PM', '', '', '2020-04-14 12:33:53'),
(15, '1', 'Ajay', '7696355852', '?stanbul', 'Ünalan ', '11, 11, Maslak Sokak, Ünalan, Üsküdar, ?stanbul, 34700, Türkiye, TR', 'Confirmed', '300', '0', 'COD', '', 'NO', '0', '41.0035818', '29.0671713', '8AM-10AM', '', '', '2020-04-14 14:15:23'),
(16, '18', 'Kook', '8638456764', 'Rangia', 'Guwahati', '4, Rangia, Kamrup, Assam, 781354, India, IN', 'On Way', '732', '0', 'COD', '', 'NO', '0', '26.4369412', '91.6249286', '8AM-10AM', '2455', '', '2020-04-14 16:03:01'),
(17, '21', 'ashraf ', '9747624668', 'Hhh', 'Hhhhh', 'Al Beshairiya Street, Al Beshairiya Street, Al Hitmi, Doha, Doha, Qatar, QA', 'Delivered', '1290', '0', 'COD', '', 'ZIS10', '10', '25.2860863', '51.5466427', '8AM-10AM', '', '', '2020-04-14 17:18:19'),
(18, '21', 'ashraf ', '9747624668', 'Doha', 'Hu', 'Al Loulou Street, Al Loulou Street, Al Hitmi, Doha, Doha, Qatar, QA', 'On Way', '397', '0', 'COD', '', 'DIWALI50', '50', '25.2861493', '51.5466301', '5PM-7PM', '', '', '2020-04-14 18:23:49'),
(19, '1', 'Ajay', '7696355852', 'Yangon', 'YN', 'U Chit Maung Road, U Chit Maung Road, Yangon, Yangon (West), Yangon Region, Myanmar (Burma), MM', 'Delivered', '646', '0', 'COD', '', 'DIWALI50', '50', '16.8216164', '96.1628834', '8AM-10AM', '4905', '1', '2020-04-14 18:27:41'),
(20, '1', 'Ajay', '7696355852', 'Jdjw', 'Jwjw', 'Amritsar', 'On Way', '181', '10', 'COD', '', 'NO', '0', '', '', '8AM-10AM', '4048', '1', '2020-04-14 18:38:37'),
(21, '7', 'Tu', '0987654321', 'Kolkata', 'Town', 'Halder Para Road, Halder Para Road, Kolkata, Kolkata, West Bengal, 700059, India, IN', 'Cancelled', '25', '20', 'COD', '', 'ZIS10', '10', '22.5962283', '88.4505331', '12AM-2PM', '6156', '', '2020-04-14 18:40:43'),
(22, '1', 'Ajay', '7696355852', 'Xxxxxx', 'Cxxxxxx', 'Sitara Theatre Road, Sitara Theatre Road, Veerabhadra Nagar, Sangareddy, Medak, Telangana, 502001, ?????, IN', 'Received', '32', '20', 'COD', '', 'NO', '0', '17.6199233', '78.0820877', '12AM-2PM', '', '', '2020-04-14 18:50:43'),
(23, '1', 'Ajay', '7696355852', 'Xxxxc', 'Xxxx', 'Sitara Theatre Road, Sitara Theatre Road, Veerabhadra Nagar, Sangareddy, Medak, Telangana, 502001, ?????, IN', 'Confirmed', '148', '10', 'COD', '', 'NO', '0', '17.6199233', '78.0820877', '12AM-2PM', '2951', '1', '2020-04-14 18:51:32'),
(24, '23', 'Yildo', '5555555', '?stanbul ', '?nno', '53D, 53D, Naz?m Hikmet Bulvar?, Ye?ilkent Mh., Esenyurt, ?stanbul, 34515, Türkiye, TR', 'Delivered', '2095', '0', 'COD', '', 'NO', '0', '41.0207386', '28.6580909', '12AM-2PM', '5719', '1', '2020-04-14 18:58:31'),
(25, '1', 'Mem', '7696355852', 'Sitara theater road ', 'Sangareddy road ', 'Amritsar', 'On Way', '38', '20', 'COD', '', 'NO', '0', '', '', '8AM-10AM', '3776', '1', '2020-04-14 19:02:58'),
(26, '1', 'Ajay', '7696355852', 'Aaaaaaaaa', 'Aaaaaa', 'Aaaaaaaaa\n\n', 'Received', '75', '20', 'COD', '', 'NO', '0', '17.6198816', '78.0820315', '8AM-10AM', '', '', '2020-04-14 19:12:20'),
(27, '23', 'Yildo', '5555555', 'Hhk', 'Jubvu', 'Esenyurt\n', 'Delivered', '23', '20', 'COD', '', 'ZIS10', '10', '41.020753', '28.6581026', '5PM-7PM', '9927', '1', '2020-04-14 19:12:49'),
(28, '23', 'Yildo', '5555555', '?nnovia ', 'K 15 d 116', '53D, 53D, Naz?m Hikmet Bulvar?, Ye?ilkent Mh., Esenyurt, ?stanbul, 34515, Türkiye, TR', 'Delivered', '52', '20', 'COD', '', 'NO', '0', '41.0207448', '28.6581038', '12AM-2PM', '2955', '1', '2020-04-14 19:40:57'),
(29, '23', 'Yildo', '5555555', '?n', '115', '53D, 53D, Naz?m Hikmet Bulvar?, Ye?ilkent Mh., Esenyurt, ?stanbul, 34515, Türkiye, TR', 'Delivered', '901', '0', 'COD', '', 'yildo', '5', '41.0207381', '28.6580261', '5PM-7PM', '2591', '2', '2020-04-14 20:25:05'),
(30, '1', 'Ajay', '7696355852', '5yhhu', 'Yjjjj', 'Amritsar', 'Received', '28', '20', 'COD', '', 'yildo', '5', '', '', '12AM-2PM', '', '', '2020-04-14 20:29:01'),
(31, '25', 'Tapas', '9007206290', 'Kolkata', 'kolkata', '85, 85, Rabindra Sarani, North Dumdum, Kolkata, North 24 Parganas, West Bengal, 700065, India, IN', 'On Way', '1537', '0', 'COD', '', 'NO', '0', '22.6532847', '88.4178281', '8AM-10AM', '', '', '2020-04-14 21:35:12'),
(32, '26', 'Roberto', '596654125', '5ta Avenida Las Americas', 'San Marcos', 'Avenida Las Americas', 'On Way', '165', '10', 'COD', '', 'NO', '0', '14.9659813', '-91.7759469', '12AM-2PM', '5594', '1', '2020-04-14 22:22:52'),
(33, '26', 'Roberto', '596654125', 'San Marcos', 'San Marcos', '1030, 1030, 6a Calle, San Pedro Sacatepequez, San Pedro Sacatepequez, San Marcos, Guatemala, GT', 'Preparing', '80', '20', 'COD', '', 'NO', '0', '14.9659862', '-91.775956', '12AM-2PM', '4346', '1', '2020-04-14 22:39:18'),
(34, '10', 'Sriy', '0777183981', 'Wattaka', 'Hendala', 'Wattala, Wattala, Gampaha, Western Province, Sri Lanka, LK', 'Delivered', '300', '0', 'COD', '', 'NO', '0', '6.995614', '79.8832307', '8AM-10AM', '7374', '3', '2020-04-15 02:59:05'),
(35, '28', 'rebbb', '081222121760', 'Garut', 'dfsdgasz', 'garut', 'Received', '78', '20', 'COD', '', 'ZIS10', '10', '0', '0', '12AM-2PM', '', '', '2020-04-15 03:16:28'),
(36, '13', 'HMTN HERATH', '0767705019', 'Kurunegala ', 'Udadigana ', 'Udadigana mawatha ,kurunegala ', 'Delivered', '165', '10', 'COD', '', 'NO', '0', '', '', '5PM-7PM', '5152', '3', '2020-04-15 03:40:54'),
(37, '29', 'Siraj', '9562330123', 'Padinhatummuri', 'Malappuram ', 'UTEC Road, UTEC Road, Padinhattummuri, Malappuram, Kerala, 676506, India, IN', 'On Way', '305', '0', 'COD', '', 'NO', '0', '11.0625284', '76.1082564', '12AM-2PM', '6803', '2', '2020-04-15 05:42:23'),
(38, '17', 'Biki', '7578023311', 'Assam', 'Assam', 'Goreswar-Andharighat Road, Goreswar-Andharighat Road, No.5 Goreswar, Darrang, Assam, 781366, India, IN', 'Received', '465', '0', 'COD', '', 'NO', '0', '26.5279005', '91.7340998', '5PM-7PM', '', '', '2020-04-15 05:48:03'),
(39, '31', 'Michael Andrew', '59661414', 'San Marcos', 'San Pedro Sacatepequez', '1030, 1030, 6a Calle, San Pedro Sacatepequez, San Pedro Sacatepequez, San Marcos, Guatemala, GT', 'Delivered', '356', '0', 'COD', '', 'NO', '0', '14.9659814', '-91.7759695', '5PM-7PM', '4479', '4', '2020-04-15 06:06:39'),
(40, '21', 'ashraf ', '9747624668', 'Kkchi', 'Aaaa', 'Hgffg', 'Received', '43', '20', 'COD', '', 'NO', '0', '', '', '12AM-2PM', '', '', '2020-04-15 06:17:24'),
(41, '31', 'Michael Andrew', '59661414', 'San Marcos', 'San Marcos', '1017, 1017, 4tacalle, San Pedro Sacatepequez, San Pedro Sacatepequez, San Marcos, Guatemala, GT', 'On Way', '248', '0', 'COD', '', 'NO', '0', '14.9668881', '-91.7750306', '12AM-2PM', '8845', '4', '2020-04-15 06:27:36'),
(42, '32', 'Chathuranga', '07776194702', 'Nugegoda ', 'Colombo ', 'Sri Lanka', 'Confirmed', '174', '10', 'COD', '', 'NO', '0', '6.86654', '79.9212384', '8AM-10AM', '6778', '4', '2020-04-15 06:29:46'),
(43, '33', 'Dhdjd', '7012040418', 'Alap', 'Dgjjbff', 'Kallumala - Akkanattukara - Aranootymangalm Road, Kallumala - Akkanattukara - Aranootymangalm Road, Arunoottimangalam, Mavelikara, Alappuzha, Kerala, 690110, India, IN', 'Received', '160', '10', 'COD', '', 'NO', '0', '9.2388944', '76.5645368', '12AM-2PM', '', '', '2020-04-15 08:04:01'),
(44, '1', 'Ajay', '7696355852', 'Delhi', 'Near Masjid', 'Govindpuri, Ma Anandmayee Marg, Kalkaji, New Delhi, South East Delhi, Delhi, 110019, India, IN', 'Received', '110', '10', 'COD', '', 'NO', '0', '28.5444845', '77.2644017', '12AM-2PM', '', '', '2020-04-15 09:14:21'),
(45, '1', 'Ajay', '7696355852', 'Hyderabadi', 'Hyderabad', '144, Gachibowli, Hyderabad, Ranga Reddy, Telangana, 500032, India, IN', 'Cancelled', '62', '20', 'COD', '', 'DIWALI50', '50', '17.4416991', '78.3564936', '12AM-2PM', '', '', '2020-04-15 09:18:52'),
(46, '27', 'Mezozer', '0123456789', 'Ofis', 'Test', '5, 5, Park ?çi Yolu, Ye?ilköy, Bak?rköy, ?stanbul, 34149, Türkiye, TR', 'Confirmed', '888', '0', 'COD', '', 'NO', '0', '40.9573199', '28.8180255', '5PM-7PM', '1834', '1', '2020-04-15 10:09:54'),
(47, '1', 'Ajay', '7696355852', 'Hhhh', 'Hjdjd', 'Unnamed Road, Unnamed Road, Khan Dangkor, Phnom Penh, Dangkor, Phnom Penh, Cambodia, KH', 'Preparing', '59', '20', 'COD', '', 'NO', '0', '11.517035', '104.8878314', '8AM-10AM', '', '', '2020-04-15 10:38:21'),
(48, '34', 'Arun', '9447551606', 'Trivandrum', 'Kollam,', '16, 16, 14 A Street, Al Raffa, Dubai, Dubai, United Arab Emirates, AE', 'Delivered', '297', '0', 'COD', '', 'DIWALI50', '50', '25.2577953', '55.2878551', '8AM-10AM', '1461', '5', '2020-04-15 11:18:22'),
(49, '1', 'Ajay', '7696355852', '?stanbul', 'Üsk?dar', '25A, 25A, Akasya Avm, Ac?badem Mh., Üsküdar, ?stanbul, 34660, Türkiye, TR', 'Delivered', '43', '20', 'COD', '', 'NO', '0', '41.0008408', '29.055016', '8AM-10AM', '', '', '2020-04-15 11:30:51'),
(50, '32', 'Chathuranga', '07776194702', 'Colombo', 'Colombo ', 'Sri Lanka', 'Delivered', '197', '10', 'COD', '', 'NO', '0', '6.86654', '79.9212384', '12AM-2PM', '4116', '5', '2020-04-15 12:21:53'),
(51, '1', 'Ajay', '7696355852', '?stanbul ', '?stanbul', '25A, 25A, Akasya Avm, Ac?badem Mh., Üsküdar, ?stanbul, 34660, Türkiye, TR', 'On Way', '43', '20', 'COD', '', 'NO', '0', '41.0008369', '29.0550042', '8AM-10AM', '6001', '7', '2020-04-15 13:35:53'),
(52, '1', 'Ajay', '7696355852', '?stanbul ', '?stanbul', '25A, 25A, Akasya Avm, Ac?badem Mh., Üsküdar, ?stanbul, 34660, Türkiye, TR', 'On Way', '26', '20', 'COD', '', 'NO', '0', '41.0008406', '29.0550162', '12AM-2PM', '9098', '5', '2020-04-15 13:43:11'),
(53, '1', 'Hisham', '212661458708', 'Fes', 'Saada', 'Rue Essaousane, Rue Essaousane, Ville Nouvelle, Fes, Wilaya de Fes, Fez-Meknès, 30050, Maroc, MA', 'Preparing', '728', '0', 'COD', '', 'ZIS10', '10', '34.0229538', '-5.0038288', '8AM-10AM', '9355', '5', '2020-04-15 14:32:34'),
(54, '1', 'aniket', '7696355852', 'Gachibowli', 'Hyd', '144, Gachibowli, Hyderabad, Ranga Reddy, Telangana, 500032, India, IN', 'Confirmed', '42', '20', 'COD', '', '10Off', '10', '17.4417151', '78.356458', '5PM-7PM', '3019', '5', '2020-04-15 14:45:29'),
(55, '38', 'Reda', '123456', 'Tanger', 'Casa', 'Rue Mourabitine, Rue Mourabitine, Casablanca, Anfa, Casablanca-Settat, Morocco, MA', 'Delivered', '10', '0', 'COD', '', 'NO', '0', '33.6076551', '-7.6157465', '8AM-10AM', '3764', '', '2020-04-15 16:52:08'),
(56, '36', 'Aniket', '7032909455', 'Hyderabad', 'Hyderabad', '144, Gachibowli, Hyderabad, Ranga Reddy, Telangana, 500032, India, IN', 'Received', '100', '20', 'COD', '', 'NO', '0', '17.441688', '78.3564818', '5PM-7PM', '', '', '2020-04-15 17:24:45'),
(57, '1', 'Ajay', '7696355852', 'Manjeri', 'mutoppalam', 'Muttipalam Upper Bus Stop, State Highway 71, Muttipalam Upper, Manjeri, Malappuram, Kerala, 676509, India, IN', 'Confirmed', '41', '20', 'COD', '', 'NO', '0', '11.0980292', '76.1202581', '12AM-2PM', '', '', '2020-04-15 17:45:29'),
(58, '1', 'Ajay', '7696355852', 'gahah', 'vaha', 'Amritsar', 'Delivered', '29', '20', 'COD', '', 'NO', '0', '', '', '5PM-7PM', '9960', '1', '2020-04-15 18:54:53'),
(59, '1', 'Ajay', '7696355852', 'Panama', 'Panama', '50, 50, 85th Street Transverse, Manhattan, New York, New York County, New York, 10128, Estados Unidos, US', 'Delivered', '98', '20', 'COD', '', 'NO', '0', '40.782613', '-73.96528', '12AM-2PM', '6064', '1', '2020-04-16 01:18:17'),
(60, '1', 'Ajay', '7696355852', 'Hyd', 'Hyd', '5-32-6, Gajularamaram Road, Jeedimetla, Hyderabad, Ranga Reddy, Telangana, 500055, India, IN', 'Delivered', '74', '20', 'COD', '', 'ZIS10', '10', '17.52041337545961', '78.43291872180998', '8AM-10AM', '9749', '7', '2020-04-16 07:26:17'),
(61, '42', 'Raku', '7008658538', 'Shirur', 'Shirur', 'Nagar - Pune Road, Nagar - Pune Road, Shirur, Pune, Maharashtra, 412210, India, IN', 'Delivered', '49', '20', 'COD', '', 'NO', '0', '18.8255044', '74.3768912', '5PM-7PM', '2216', '1', '2020-04-16 07:32:30'),
(62, '1', 'Sam', '7696355852', 'Hyderabad ', 'Hyd', '5-32-6, Gajularamaram Road, Jeedimetla, Hyderabad, Ranga Reddy, Telangana, 500055, India, IN', 'Delivered', '204', '0', 'COD', '', 'NO', '0', '17.520420374348763', '78.43288678675889', '12AM-2PM', '8838', '7', '2020-04-16 08:00:56'),
(63, '1', 'Sam', '7696355852', 'Hyd', 'Hyd', '5-32-6, Gajularamaram Road, Jeedimetla, Hyderabad, Ranga Reddy, Telangana, 500055, India, IN', 'Delivered', '160', '10', 'COD', '', 'NO', '0', '17.520420374348763', '78.43288678675889', '5PM-7PM', '4469', '8', '2020-04-16 08:12:19'),
(64, '1', 'Ajay', '7696355852', 'Hyd', 'Hyd', '5-32-6, Gajularamaram Road, Jeedimetla, Hyderabad, Ranga Reddy, Telangana, 500055, India, IN', 'Delivered', '715', '0', 'COD', '', 'NO', '0', '17.520388732664284', '78.43288326635957', '12AM-2PM', '8580', '8', '2020-04-16 08:58:13'),
(65, '44', 'Test', '0684251385', 'Aga', 'Zer', 'Morocco, Agadir, Province d\'Agadir-Ida-Ou Tanane, Souss Massa, 80000, Morocco, MA', 'Received', '103', '20', 'COD', '', 'NO', '0', '30.4262405', '-9.5680182', '12AM-2PM', '', '', '2020-04-16 09:18:00'),
(66, '36', 'Aniket', '7032909455', 'Hsjsj', 'Skejd', '144, Gachibowli, Hyderabad, Ranga Reddy, Telangana, 500032, India, IN', 'Received', '144', '10', 'COD', '', 'DIWALI50', '50', '17.4417129', '78.3564652', '5PM-7PM', '', '', '2020-04-16 09:33:47'),
(67, '45', 'Pagal', '8585963476', 'Jwjw', 'Sshhw', '457/27, 457/27, Gali Number 7, Sector 7, Gurugram, Gurgaon, Haryana, 122001, India, IN', 'Delivered', '16', '20', 'COD', '', 'DIWALI50', '50', '28.460103', '77.016371', '12AM-2PM', '2945', '1', '2020-04-16 09:48:10'),
(68, '48', 'Uos', '55555', '?????-?????????', '??', '55555', 'Received', '170', '10', 'COD', '', 'NO', '0', '', '', '12AM-2PM', '', '', '2020-04-16 11:26:03'),
(69, '1', 'Ajay', '7696355852', 'Mumbai', 'Mumbai', 'Mumbai', 'On Way', '6', '20', 'COD', '', 'DIWALI50', '50', '19.0264036', '73.0423511', '12AM-2PM', '', '', '2020-04-16 11:44:58'),
(70, '1', 'Ajay', '7696355852', 'Johannesburg', 'Meadowlands ', 'Sterretjie Street, Sterretjie Street, Wilgespruit 190-Iq, Roodepoort, City of Johannesburg Metropolitan Municipality, Gauteng, 1724, South Africa, ZA', 'Delivered', '261', '0', 'COD', '', 'DIWALI50', '50', '-26.1056778', '27.8893184', '12AM-2PM', '9390', '1', '2020-04-16 11:45:15'),
(71, '29', 'Siraj', '9562330123', 'Malappuram ', 'Malappuram ', 'UTEC Road, UTEC Road, Padinhattummuri, Malappuram, Kerala, 676506, India, IN', 'On Way', '52', '20', 'COD', '', 'NO', '0', '11.0615943', '76.1104311', '5PM-7PM', '', '', '2020-04-16 11:53:06'),
(72, '1', 'Ajay', '7696355852', 'Phuthaditjhaba', 'Bluegumbosch ', 'Phuthaditjhaba-N, Phuthaditjhaba-N, Phuthaditjhaba, Thabo Mofutsanyane, Free State, 9869, South Africa, ZA', 'On Way', '43', '20', 'COD', '', 'NO', '0', '-28.4895896', '28.8518518', '8AM-10AM', '', '', '2020-04-16 12:39:56'),
(73, '1', 'Ajay', '7696355852', 'Per', 'Per', '4th Main, SP Naidu Layout, 4th Main, SP Naidu Layout, Dooravani Nagar, Bengaluru, Bangalore Urban, Karnataka, 560016, India, IN', 'Received', '26', '20', 'COD', '', 'NO', '0', '13.0073945', '77.6680493', '12AM-2PM', '', '', '2020-04-16 13:39:38'),
(74, '49', 'Yogesh', '9979496245', 'Bhuj', 'Madhapar', 'Unnamed Road, Unnamed Road, Madhapar, Bhuj, Kutch, Gujarat, 370020, India, IN', 'Preparing', '-12', '20', 'COD', '', 'DIWALI50', '50', '23.23112232', '69.71119217', '12AM-2PM', '1961', '8', '2020-04-16 13:45:01'),
(75, '50', 'Fjvf', '7008086190', 'Rgg', 'Rff', 'M-58, Basanti Nagar, Rourkela, Sundargarh, Odisha, 769012, India, IN', 'Confirmed', '52', '20', 'COD', '', 'NO', '0', '22.2340345', '84.8369051', '5PM-7PM', '', '', '2020-04-16 13:56:53'),
(76, '1', 'Ajay', '7696355852', 'Ranchi', 'Namkum', 'Sahera Road, Sahera Road, Pindarkom, Ranchi, Jharkhand, 834010, India, IN', 'Delivered', '16', '20', 'COD', '', 'DIWALI50', '50', '23.2888793', '85.3861132', '12AM-2PM', '1766', '1', '2020-04-16 14:16:50'),
(77, '1', 'Ajay', '7696355852', 'Kalkaji', 'Lotus', '153, Kalkaji, New Delhi, South East Delhi, Delhi, 110019, India, IN', 'Delivered', '34', '20', 'COD', '', 'DIWALI50', '50', '28.5425412', '77.2647409', '8AM-10AM', '', '', '2020-04-16 14:17:11'),
(78, '1', 'Ajay', '7696355852', 'Jodhpur ', 'Pal', '262, Pal Road, Bhadu Market, Jodhpur, Jodhpur, Rajasthan, 342001, India, IN', 'On Way', '240', '0', 'COD', '', 'NO', '0', '26.2437642', '72.9661718', '5PM-7PM', '5166', '9', '2020-04-16 16:20:10'),
(79, '1', 'Ajay', '7696355852', 'Ranchi', 'Jharkhand ', 'Pundag Road, Pundag Road, Argora, Ranchi, Ranchi, Jharkhand, 834002, India, IN', 'Delivered', '72', '20', 'COD', '', 'DIWALI50', '50', '23.3497032', '85.289978', '12AM-2PM', '2449', '1', '2020-04-16 17:40:43'),
(80, '1', 'Ajay', '7696355852', 'New delhi', 'Jungpura', 'Ami Chand Khand, 106, Kalkaji, New Delhi, South East Delhi, Delhi, 110019, India, IN', 'Received', '56', '20', 'COD', '', 'ZIS10', '10', '28.5425013', '77.2644905', '5PM-7PM', '', '', '2020-04-16 17:40:45'),
(81, '1', 'My Mumbai', '7696355852', 'Mumbai', 'Surat', 'Amritsar', 'Preparing', '61', '20', 'COD', '', 'NO', '0', '', '', '5PM-7PM', '', '', '2020-04-16 17:48:06'),
(82, '1', 'Ajay', '7696355852', 'test', 'test', 'test', 'Preparing', '2', '20', 'COD', '', 'DIWALI50', '50', '', '', '8AM-10AM', '', '', '2020-04-16 18:16:33'),
(83, '52', 'yazan', '00962790717150', 'amman ', 'ibn uday', 'Ibn Uday, Ibn Uday, Badr, Amman, Amman Governorate, Jordan, JO', 'Received', '98', '20', 'COD', '', 'NO', '0', '31.9226536', '35.8811582', '8AM-10AM', '', '', '2020-04-16 19:09:50'),
(84, '1', 'Ajay', '7696355852', 'Baner', 'Dhud', '38/79, 38/79, Internal Rd, Baner, Pune, Pune, Maharashtra, 411045, India, IN', 'Received', '1119', '0', 'COD', '', 'NO', '0', '18.5540358', '73.7814315', '12AM-2PM', '', '', '2020-04-16 19:29:47'),
(85, '55', 'adam', '03157247117', 'karachi', 'shahfaisal', 'Plot 771 C, Shah Faisal Colony, Karachi, Karachi City, Sindh, 75230, Pakistan, PK', 'Received', '98', '20', 'COD', '', 'NO', '0', '24.8812056', '67.1524348', '8AM-10AM', '', '', '2020-04-16 19:30:04'),
(86, '1', 'Ajay', '7696355852', 'India', 'India', 'Amritsar', 'Received', '66', '20', 'COD', '', 'NO', '0', '', '', '8AM-10AM', '', '', '2020-04-16 20:20:45'),
(87, '1', 'Ajay', '7696355852', 'Trabzon', 'Fhh', '1600, 1600, Amphitheatre Parkway, Mountain View, Santa Clara County, California, 94043, Amerika Birle?ik Devletleri, US', 'Received', '1950', '0', 'COD', '', 'NO', '0', '37.4219983', '-122.084', '8AM-10AM', '', '', '2020-04-16 20:24:05'),
(88, '1', 'Ajay Randhawa', '07986568931', 'Tarn Taran', 'dasdsa', 'Amritsar', 'Received', '135', '10', 'COD', '', 'NO', '0', '31.638676000000004', '74.9150313', '5PM-7PM', '', '', '2020-07-09 18:55:23'),
(89, '57', 'carl', '8888876264', 'pune', 'pune', 'pune', 'On Way', '664', '0', 'COD', '', 'ZIS10', '10', '', '', '8AM-10AM', '5439', '10', '2020-12-12 09:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `orderslist`
--

CREATE TABLE `orderslist` (
  `id` int(50) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `itemname` varchar(500) NOT NULL,
  `itemquantity` varchar(100) NOT NULL,
  `itemquantitytype` varchar(50) NOT NULL,
  `Mquantity` varchar(50) NOT NULL,
  `itemprice` varchar(30) NOT NULL,
  `itemtotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderslist`
--

INSERT INTO `orderslist` (`id`, `orderid`, `itemname`, `itemquantity`, `itemquantitytype`, `Mquantity`, `itemprice`, `itemtotal`) VALUES
(1, '1', 'Strawberry Banana', '1', 'Unit', '1', '125', '125'),
(2, '1', 'werwerwe', '1', 'sdf', '2', '45', '90'),
(3, '2', 'Strawberry Banana', '1', 'Unit', '1', '125', '125'),
(4, '3', 'Orange Strawberry Banana', '1', 'Unit', '1', '299', '299'),
(5, '3', 'Strawberry Banana', '1', 'Unit', '1', '125', '125'),
(6, '4', 'Orchard Green', '1', 'Unit', '1', '600', '600'),
(7, '5', 'Orchard Green', '1', 'Unit', '1', '600', '600'),
(8, '6', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(9, '6', 'Fortune Besan', '1', 'Kg', '1', '12', '12'),
(10, '7', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(11, '8', 'Tata Sampann Besan', '500', 'Gm', '3', '13', '13'),
(12, '8', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(13, '8', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(14, '9', 'Aashirvaad Chakki Atta', '10', 'Kg', '3', '32', '32'),
(15, '10', 'So fit soya Milk vanila', '1', 'Ltr', '2', '125', '125'),
(16, '10', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '1', '6', '6'),
(17, '11', 'So fit soya Milk vanila', '1', 'Ltr', '1', '125', '125'),
(18, '12', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '18', '6', '6'),
(19, '13', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(20, '14', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(21, '14', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(22, '15', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '2', '150', '150'),
(23, '16', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(24, '16', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(25, '16', 'Kissan Tomato Ketchup', '200', 'Gm', '2', '21', '21'),
(26, '16', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '2', '150', '150'),
(27, '16', 'So fit soya Milk vanila', '1', 'Ltr', '2', '125', '125'),
(28, '16', 'Fortune Besan', '1', 'Kg', '2', '12', '12'),
(29, '16', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '2', '6', '6'),
(30, '16', 'Kissan Dip Sauce', '1', 'Kg', '2', '23', '23'),
(31, '17', 'Himalya Total Care Medium Pants', '54', 'Pcs', '2', '650', '650'),
(32, '18', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '2', '6', '6'),
(33, '18', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '2', '155', '155'),
(34, '18', 'So fit soya Milk vanila', '1', 'Ltr', '1', '125', '125'),
(35, '19', 'Aashirvaad Chakki Atta', '10', 'Kg', '3', '32', '32'),
(36, '19', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '4', '150', '150'),
(37, '20', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(38, '20', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '1', '150', '150'),
(39, '21', 'Surf excel quick', '2', 'Kg', '1', '15', '15'),
(40, '22', 'Lays Maxx Chips', '58', 'Gm', '3', '4', '4'),
(41, '23', 'Hit Flying Insect Killer', '625', 'Ml', '6', '23', '23'),
(42, '24', 'Unibic Biscuits Choco Nut', '75', 'Gm', '3', '6', '6'),
(43, '24', 'Lays Maxx Chips', '58', 'Gm', '2', '4', '4'),
(44, '24', 'Lays Cream & Onion Chips', '52', 'Gm', '1', '19', '19'),
(45, '24', 'Drools Dog Food Adult', '20', 'Gm', '1', '2050', '2050'),
(46, '25', 'Unibic Biscuits Choco Nut', '75', 'Gm', '3', '6', '6'),
(47, '26', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(48, '26', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(49, '27', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(50, '28', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(51, '29', 'Pedigree Jumbone', '200', 'Gm', '3', '124', '124'),
(52, '29', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(53, '29', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '3', '155', '155'),
(54, '29', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(55, '29', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(56, '29', 'Fortune Besan', '1', 'Kg', '1', '12', '12'),
(57, '30', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(58, '31', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(59, '31', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(60, '31', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(61, '31', 'Fortune Besan', '1', 'Kg', '2', '12', '12'),
(62, '31', 'Himalya Total Care Medium Pants', '54', 'Pcs', '2', '650', '650'),
(63, '32', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(64, '33', 'Coca Cola', '100', 'Pcs', '12', '5', '5'),
(65, '34', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '2', '150', '150'),
(66, '35', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(67, '35', 'Fortune Besan', '1', 'Kg', '3', '12', '12'),
(68, '36', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(69, '37', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(70, '37', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '1', '150', '150'),
(71, '38', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '3', '155', '155'),
(72, '39', 'Aashirvaad Chakki Atta', '10', 'Kg', '2', '32', '32'),
(73, '39', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(74, '39', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(75, '39', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(76, '39', 'Head & Shoulder Anti Hairfall Shampoo', '650', 'Ml', '1', '8', '8'),
(77, '39', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '1', '6', '6'),
(78, '39', 'Hit Flying Insect Killer', '625', 'Ml', '1', '23', '23'),
(79, '39', 'Surf excel quick', '2', 'Kg', '2', '15', '15'),
(80, '39', 'Lays Maxx Chips', '58', 'Gm', '1', '4', '4'),
(81, '39', 'Lays Cream & Onion Chips', '52', 'Gm', '1', '19', '19'),
(82, '39', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '1', '33', '33'),
(83, '39', 'Cadbury Bournvita Chocolate Health Drink Jar', '200', 'Gm', '1', '103', '103'),
(84, '39', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(85, '40', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(86, '41', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '1', '33', '33'),
(87, '41', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(88, '41', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '4', '6', '6'),
(89, '41', 'Kissan Tomato Ketchup', '200', 'Gm', '4', '21', '21'),
(90, '41', 'Tata Sampann Besan', '500', 'Gm', '4', '13', '13'),
(91, '41', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(92, '41', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(93, '42', 'Aashirvaad Chakki Atta', '10', 'Kg', '4', '32', '32'),
(94, '42', 'Fortune Besan', '1', 'Kg', '3', '12', '12'),
(95, '43', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '1', '150', '150'),
(96, '44', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '1', '33', '33'),
(97, '44', 'Kissan Dip Sauce', '1', 'Kg', '2', '23', '23'),
(98, '44', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(99, '45', 'Kissan Dip Sauce', '1', 'Kg', '4', '23', '23'),
(100, '46', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(101, '46', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '9', '6', '6'),
(102, '46', 'Mamy Poko Medium Pants', '40', 'Pcs', '1', '429', '429'),
(103, '46', 'Amul Lassi Edge	', '250', 'Ml', '3', '19', '19'),
(104, '46', 'So fit soya Milk vanila', '1', 'Ltr', '2', '125', '125'),
(105, '46', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '2', '33', '33'),
(106, '47', 'Tata Sampann Besan', '500', 'Gm', '3', '13', '13'),
(107, '48', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(108, '48', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(109, '48', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '2', '150', '150'),
(110, '49', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(111, '50', 'Fortune Besan', '1', 'Kg', '6', '12', '12'),
(112, '50', 'Aashirvaad Multigrain Atta', '5', 'Kg', '5', '23', '23'),
(113, '51', 'Hit Flying Insect Killer', '625', 'Ml', '1', '23', '23'),
(114, '52', 'Nyle Shampoo Dryness Hydration', '800', 'Ml', '1', '6', '6'),
(115, '53', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(116, '53', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(117, '53', 'Himalya Total Care Medium Pants', '54', 'Pcs', '1', '650', '650'),
(118, '53', 'Kissan Tomato Ketchup', '200', 'Gm', '2', '21', '21'),
(119, '54', 'Lays Maxx Chips', '58', 'Gm', '8', '4', '4'),
(120, '55', '????', '1', 'Kg', '2', '5', '5'),
(121, '56', 'Fortune Besan', '1', 'Kg', '2', '12', '12'),
(122, '56', 'Head & Shoulder Anti Hairfall Shampoo', '650', 'Ml', '7', '8', '8'),
(123, '57', 'Kissan Tomato Ketchup', '200', 'Gm', '1', '21', '21'),
(124, '58', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(125, '59', 'Aashirvaad Select Atta', '5', 'Kg', '2', '23', '23'),
(126, '59', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(127, '59', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(128, '60', 'Aashirvaad Chakki Atta', '10', 'Kg', '2', '32', '32'),
(129, '61', 'Lays Maxx Chips', '58', 'Gm', '1', '4', '4'),
(130, '61', 'Unibic Biscuits Choco Nut', '75', 'Gm', '1', '6', '6'),
(131, '61', 'Lays Cream & Onion Chips', '52', 'Gm', '1', '19', '19'),
(132, '62', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(133, '62', 'Aashirvaad Select Atta', '5', 'Kg', '1', '23', '23'),
(134, '62', 'Pedigree Dog Biscuit Milk & Chicken', '500', 'Gm', '1', '155', '155'),
(135, '63', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '1', '150', '150'),
(136, '64', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(137, '64', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '1', '33', '33'),
(138, '64', 'Himalya Total Care Medium Pants', '54', 'Pcs', '1', '650', '650'),
(139, '64', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(140, '65', 'Head & Shoulder Anti Hairfall Shampoo', '650', 'Ml', '8', '8', '8'),
(141, '65', 'Lays Cream & Onion Chips', '52', 'Gm', '1', '19', '19'),
(142, '66', 'Kissan Dip Sauce', '1', 'Kg', '8', '23', '23'),
(143, '67', 'Aashirvaad Select Atta', '5', 'Kg', '2', '23', '23'),
(144, '68', 'Fortune Besan', '1', 'Kg', '8', '12', '12'),
(145, '68', 'Aashirvaad Chakki Atta', '10', 'Kg', '2', '32', '32'),
(146, '69', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(147, '69', 'Hit Flying Insect Killer', '625', 'Ml', '1', '23', '23'),
(148, '70', 'Drools Dog Food Chicken & Egg', '180', 'Gm', '1', '150', '150'),
(149, '70', 'Kissan Dip Sauce', '1', 'Kg', '1', '23', '23'),
(150, '70', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(151, '70', 'So fit soya Milk vanila', '1', 'Ltr', '1', '125', '125'),
(152, '71', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(153, '72', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(154, '73', 'Unibic Biscuits Choco Nut', '75', 'Gm', '1', '6', '6'),
(155, '74', 'Unibic Biscuits Choco Nut', '75', 'Gm', '3', '6', '6'),
(156, '75', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(157, '76', 'Aashirvaad Multigrain Atta', '5', 'Kg', '2', '23', '23'),
(158, '77', 'Aashirvaad Chakki Atta', '10', 'Kg', '2', '32', '32'),
(159, '78', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '3', '33', '33'),
(160, '78', 'Aashirvaad Select Atta', '5', 'Kg', '3', '23', '23'),
(161, '78', 'Kissan Dip Sauce', '1', 'Kg', '2', '23', '23'),
(162, '78', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(163, '79', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '2', '33', '33'),
(164, '79', 'Aashirvaad Select Atta', '5', 'Kg', '1', '23', '23'),
(165, '79', 'Tata Sampann Besan', '500', 'Gm', '1', '13', '13'),
(166, '80', 'Aashirvaad Select Atta', '5', 'Kg', '2', '23', '23'),
(167, '81', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(168, '81', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(169, '82', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(170, '83', 'Aashirvaad Multigrain Atta', '5', 'Kg', '1', '23', '23'),
(171, '83', 'Aashirvaad Chakki Atta', '10', 'Kg', '1', '32', '32'),
(172, '83', 'Aashirvaad Select Atta', '5', 'Kg', '1', '23', '23'),
(173, '84', 'Hersheys Milk Shake Chocolate	', '200', 'Ml', '2', '33', '33'),
(174, '84', 'Aashirvaad Chakki Atta', '10', 'Kg', '2', '32', '32'),
(175, '84', 'Tata Sampann Besan', '500', 'Gm', '2', '13', '13'),
(176, '84', 'Nyle Damage Repair Hair Shampoo', '800', 'Ml', '1', '9', '9'),
(177, '84', 'Fortune Besan', '1', 'Kg', '1', '12', '12'),
(178, '84', 'Pedigree Jumbone', '200', 'Gm', '3', '124', '124'),
(179, '84', 'Pedigree Chicken & Veg Adult Food', '3', 'Kg', '1', '570', '570'),
(180, '85', 'Hit Flying Insect Killer', '625', 'Ml', '2', '23', '23'),
(181, '85', 'Surf excelMatic', '1', 'Kg', '1', '32', '32'),
(182, '86', 'Aashirvaad Select Atta', '5', 'Kg', '2', '23', '23'),
(183, '87', 'Himalya Total Care Medium Pants', '54', 'Pcs', '3', '650', '650'),
(184, '88', 'So fit soya Milk vanila', '1', 'Ltr', '1', '125', '125'),
(185, '89', 'Fortune Besan', '1', 'Kg', '2', '12', '12'),
(186, '89', 'Himalya Total Care Medium Pants', '54', 'Pcs', '1', '650', '650');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewid` int(11) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `rateing` varchar(50) NOT NULL,
  `itemid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `typevalue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `typevalue`) VALUES
(2, 'Weight Limit', '20');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `amount` int(20) NOT NULL,
  `shipcost` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `amount`, `shipcost`) VALUES
(7, 100, 20),
(8, 200, 10);

-- --------------------------------------------------------

--
-- Table structure for table `storemanager`
--

CREATE TABLE `storemanager` (
  `id` int(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `smobile` varchar(50) NOT NULL,
  `susername` varchar(50) NOT NULL,
  `spassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storemanager`
--

INSERT INTO `storemanager` (`id`, `sname`, `smobile`, `susername`, `spassword`) VALUES
(1, 'David', '98745632210', 'david@grocery', '123456'),
(7, 'James', '9898989898', 'james@grocery', '12345'),
(8, 'Store mngr', '9898989892', 'store@grocery', '12345'),
(9, 'tejas', '8888876264', 'tejas', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `email`, `password`, `mobile`, `address`) VALUES
(1, 'tejas', 'tejas@gmail.com', 'tejas@123', '8888876264', 'Amritsar'),
(2, 'test', 'test@mail.com', '12345678', '123456789', 'TT'),
(3, 'Prabhakar', 'pavansms750@gmail.com', '7075360360', '7075360360', 'Hyd'),
(4, 'Sriyantha', 'snilanga@gmail.com', 'srinadi12', '0777183981', 'Wattals'),
(5, 'Marcos', 'brazziltec@hotmail.com', '123456', '5562998343747', 'Brasil'),
(6, 'Vhhb', 'x@gmail.com', '12344321', '8523690742', 'X@gmail.com'),
(7, 'Tu', 'C@.com', '123321', '0987654321', 'C@.com'),
(8, 'Asdf', 'asdfg@gmail.com', 'asdfgh', '12345678901', 'Asdasd'),
(9, 'H.M.T.N HERATH', 'tentlanka@gmail.com', '990940', '94767705019', 'Udadigana,Kurunegala '),
(10, 'Sriy', 'snilanga@gmail.com', 'srinadi', '0777183981', 'Wattaka'),
(11, 'Laka', 'snilanga@gmail.com', '12345678', '0777183981', 'Wzttala'),
(12, 'sri', 'snilanga@gmail.com', '12345678', '0777183981', 'Watg'),
(13, 'HMTN HERATH', 'tentlanka@outlook.com', '990940', '0767705019', 'Udadigana,kurunegala '),
(14, 'Fjfjfjfj', 'cjcnnc@fnf.xok', '1234567890', '8986868', 'Cncncncnc'),
(15, 'Fjfjfjfjd', 'cncncncn', 'fncncnc', '9876543210', 'Fbcbcnc'),
(16, 'Sjdjdjdj', 'dnfnc@fnf.cc', '1234567890', '9876543210', 'Fjfjcjc'),
(17, 'Biki', 'bikideka@gmail.com', '12345678', '7578023311', 'Rr goreswar'),
(18, 'Kook', 'tirthatalukdar989@gmail.com', '123456789gta', '8638456764', 'Rangia murara'),
(19, 'Ashraf ', 'asharafkannur123@gmail.com', '56678767', '555588558', 'Gtfgy'),
(20, 'Asharafkannur', 'asharafkannur123@gmail.com', 'qwerty12e', '9747624668', 'Jjssus'),
(21, 'ashraf ', 'asharafkannur123@gmail.com', 'qwerty123', '9747624668', 'Hgffg'),
(22, 'Yildo', 'jfjfjfn@hotmail.com', '123456', '555555532', 'Ye?ilkent '),
(23, 'Yildo', 'test69@hotmail.com', '123456', '5555555', 'Hdhxndj'),
(24, 'Pankaj', 'foodnow@sureit.com', 'pankaj', '1111111111', 'Just'),
(25, 'Tapas', 'tapaspal.cfp@gmail.com', 'Xgwn@1956', '9007206290', '107 Rabindra sarani'),
(26, 'Roberto', 'ozeduguti@gmail.com', 'anadani', '596654125', 'Avenida Las Americas'),
(27, 'Mezozer', 'y@hotmail.com', '123456', '0123456789', 'Seçmeli olmal?'),
(28, 'rebbb', 'rebnews@gmail.com', 'qwerty99', '081222121760', 'garut'),
(29, 'Siraj', 'mdsiraj.vk@gmail.com', '123456', '9562330123', 'Malappuram '),
(30, 'Michael  Steveson', 'michael', '123456', '715704866', 'Aveneu 801 New York'),
(31, 'Michael Andrew', 'michaelste@hotmail.com', '123456', '59661414', 'College Avenue'),
(32, 'Chathuranga', 'wchathuranga@hotmail.com', '12345678', '07776194702', 'Sri Lanka'),
(33, 'Dhdjd', 'cgmrocks@gmail.com', 'amanindian', '7012040418', 'Sgshshsvsvsvs'),
(34, 'Arun', 'arunn68@gmail.com', 'pass123#', '9447551606', 'Fjxh'),
(35, 'Abhishek', 'abhixs@me.com', '1234', '8285474532', 'Gaha'),
(36, 'Aniket', 'aniket.3333@gmail.com', '123456', '7032909455', 'Hyderabad'),
(37, '???', 'ridaaze6@gmail.com', '1234', '3565858', '???????????'),
(38, 'Reda', 'ridaaze6@gmail.com', '1234', '123456', 'Yfhfhdh'),
(39, 'Syed', 'riyaz. riyan@gmail.com', 'Riyaz', '9985115191', 'Hyd'),
(40, 'Syed', 'riyaz. riyan@gmail.com', 'Riyaz', '9985115161', 'Hyd'),
(41, 'Raju', 'baijuambro123@gmail.com', '12345678', '9539530703', 'Ragi house, Trivandrum,695501'),
(42, 'Raku', 'rakeshswain7381@gmail.com', 'RAKESH4274#', '7008658538', 'Shirur'),
(43, 'Test', 'azerty@gmail.com', '123456', '0625158843', 'Aga'),
(44, 'Test', 'tast@live.fr', '123456', '0684251385', 'Aggta'),
(45, 'Pagal', 'pongohifi@gmail.com', 'Asdf1234', '8585963476', 'Jajaja'),
(46, 'Tt', 'yu@yu.com', '567788', '921', 'Ghh'),
(47, 'Uos', 'uos@uos.com', '55555', '56', 'Uos'),
(48, 'Uos', '55555@55555.com', '55555', '55555', '55555'),
(49, 'Yogesh', 'bhavna_yogi@yahoo.com', '0000000000', '9979496245', 'Madhapar'),
(50, 'Fjvf', 'parameswarsamal@gmail.com', 'yuyu', '7008086190', 'Ghh'),
(51, 'Yilmo', 'test@test.com', '123456', '05554443322', 'Esurt'),
(52, 'yazan', 'yazanmansour40@gmail.com', 'Yazan1989', '00962790717150', 'amman jordan '),
(53, 'Nik', 'nikhilpande1986@gmail.com', '246699', '9850055539', 'Ytl'),
(54, 'adam', 'adamimran122@gmail.com', 'aedimakers', '03157247114', 'abc'),
(55, 'adam', 'adamimran122@gmail.com', '123', '03157247117', 'abv'),
(56, 'Sat', 'sms@login.com', 'satasata', '0680855247', 'Tdxas city'),
(57, 'carl', 'carl@gmail.com', '123456', '8888876264', 'pune');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryareas`
--
ALTER TABLE `deliveryareas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `orderslist`
--
ALTER TABLE `orderslist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewid`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `storemanager`
--
ALTER TABLE `storemanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveryareas`
--
ALTER TABLE `deliveryareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deliveryboy`
--
ALTER TABLE `deliveryboy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `orderslist`
--
ALTER TABLE `orderslist`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `storemanager`
--
ALTER TABLE `storemanager`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
