

CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","11111","Sales Account","1000","1000","this is first account","1","1","2018-12-18 08:28:02","2019-01-20 15:29:06");
INSERT INTO accounts VALUES("3","21211","Sa","","0","","0","1","2018-12-18 08:28:56","2019-01-20 15:29:06");



CREATE TABLE `adjustments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `attendances` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int NOT NULL,
  `user_id` int NOT NULL,
  `checkin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES("1","2019-01-02","1","1","10:00am","6:30pm","1","","2019-01-02 09:00:50","2019-01-02 09:00:50");
INSERT INTO attendances VALUES("3","2019-01-02","3","1","10:15am","6:30pm","0","","2019-01-02 09:27:12","2019-01-02 09:27:12");
INSERT INTO attendances VALUES("6","2020-02-03","1","1","11:30am","6:00pm","0","","2020-02-03 15:27:30","2020-02-03 15:27:30");



CREATE TABLE `billers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","yousuf","aks.jpg","aks","31123","yousuf@kds.com","442343324","halishahar","chittagong","","","sdgs","1","2018-05-13 03:19:30","2019-03-02 10:50:38");
INSERT INTO billers VALUES("2","tariq","","big tree","","tariq@bigtree.com","321312","khulshi","chittagong","","","","1","2018-05-13 03:27:54","2018-06-15 05:37:11");
INSERT INTO billers VALUES("3","test","","test","","test@test.com","3211","erewrwqre","afsf","","","","0","2018-05-30 08:08:58","2018-05-30 08:09:57");
INSERT INTO billers VALUES("5","modon","mogaTel.jpg","mogaTel","","modon@gmail.com","32321","nasirabad","chittagong","","","bd","1","2018-09-01 09:29:54","2018-10-07 08:05:51");
INSERT INTO billers VALUES("6","a","","a","","a@a.com","q","q","q","","","","0","2018-10-07 08:03:39","2018-10-07 08:04:18");
INSERT INTO billers VALUES("7","a","","a","","a@a.com","a","a","a","","","","0","2018-10-07 08:04:36","2018-10-07 08:06:07");
INSERT INTO billers VALUES("8","x","x.png","x","","x@x.com","x","x","x","","","","1","2019-03-18 16:32:42","2019-12-21 16:31:24");



CREATE TABLE `brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("3","HP","HP.jpg","1","2018-05-12 14:36:14","2019-03-02 11:02:21");
INSERT INTO brands VALUES("4","samsung","samsung.jpg","1","2018-05-12 14:38:41","2018-07-04 09:08:37");
INSERT INTO brands VALUES("5","Apple","Apple.jpg","1","2018-09-01 05:04:49","2018-12-06 08:35:38");
INSERT INTO brands VALUES("6","jjjj","20201019093419.jpg","0","2020-10-19 21:03:52","2020-10-19 21:05:58");
INSERT INTO brands VALUES("7","Lotto","","1","2020-11-16 09:43:41","2020-11-16 09:43:41");



CREATE TABLE `cash_registers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","100","9","1","0","2020-10-13 13:02:54","2020-10-24 05:57:42");
INSERT INTO cash_registers VALUES("2","50","9","1","1","2020-10-13 20:55:26","2020-10-13 20:55:26");
INSERT INTO cash_registers VALUES("3","200","1","1","0","2020-10-22 13:23:07","2021-06-19 10:22:48");
INSERT INTO cash_registers VALUES("4","100","1","2","1","2020-10-24 06:34:39","2020-10-24 06:34:39");
INSERT INTO cash_registers VALUES("5","1000","1","1","1","2021-06-19 10:23:22","2021-06-19 10:23:22");



CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","Fruits","","9","1","2018-05-12 08:57:25","2019-03-01 20:37:21");
INSERT INTO categories VALUES("2","electronics","","","1","2018-05-12 09:05:57","2019-03-01 20:37:21");
INSERT INTO categories VALUES("3","computer","20200701093146.jpg","2","1","2018-05-12 09:06:08","2020-07-01 21:01:46");
INSERT INTO categories VALUES("4","toy","","","1","2018-05-24 04:27:48","2019-03-01 20:39:27");
INSERT INTO categories VALUES("7","jacket","","","0","2018-05-28 04:09:51","2018-05-28 04:10:48");
INSERT INTO categories VALUES("9","food","","","1","2018-06-25 06:51:40","2018-09-03 09:11:28");
INSERT INTO categories VALUES("10","anda","","","0","2018-08-29 05:06:31","2018-08-29 05:07:34");
INSERT INTO categories VALUES("11","anda","","","0","2018-08-29 05:18:06","2018-08-29 05:23:22");
INSERT INTO categories VALUES("12","accessories","","","1","2018-12-05 04:58:53","2019-04-10 09:47:03");
INSERT INTO categories VALUES("14","nn","","","0","2019-04-10 09:52:30","2019-04-10 11:08:47");
INSERT INTO categories VALUES("15","nm","","","0","2019-04-10 09:52:36","2019-04-10 11:11:43");
INSERT INTO categories VALUES("16","desktop","","3","1","2020-03-11 16:12:33","2020-03-11 16:12:33");
INSERT INTO categories VALUES("17","tostos","20200701080042.png","","0","2020-07-01 19:30:42","2020-07-01 21:05:34");
INSERT INTO categories VALUES("19","Paracetamol","","","1","2021-03-07 12:46:01","2021-03-07 12:46:01");
INSERT INTO categories VALUES("20","Automobile","","","1","2021-07-15 18:05:12","2021-07-15 18:05:12");



CREATE TABLE `coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `used` int NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","sonar bangla","percentage","20","0","100","4","2020-11-19","1","1","2018-10-26 04:08:50","2020-11-18 06:22:39");
INSERT INTO coupons VALUES("2","i love bangladesh","fixed","200","1000","50","1","2018-12-31","1","1","2018-10-27 08:29:26","2019-03-02 11:16:48");



CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currencies VALUES("1","US Dollar","USD","1","2020-11-01 05:52:58","2020-11-01 06:04:55");
INSERT INTO currencies VALUES("2","Euro","Euro","0.85","2020-11-01 06:59:12","2020-11-11 04:45:34");



CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","general","0","1","2018-05-12 13:39:36","2019-03-02 11:31:35");
INSERT INTO customer_groups VALUES("2","distributor","-10","1","2018-05-12 13:42:14","2019-03-02 11:32:12");
INSERT INTO customer_groups VALUES("3","reseller","5","1","2018-05-12 13:42:26","2018-05-30 06:48:14");
INSERT INTO customer_groups VALUES("4","test","12","0","2018-05-30 06:47:16","2018-05-30 06:47:57");
INSERT INTO customer_groups VALUES("5","test","0","0","2018-08-03 14:40:27","2018-08-03 14:40:34");



CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","22","dhiman","lioncoders","dhiman@gmail.com","+8801111111101","","kajir deuri","chittagong","","","bd","11","190","20","1","2018-05-12 15:30:48","2021-08-08 20:09:20");
INSERT INTO customers VALUES("2","2","","moinul","lioncoders","","+8801200000001","","jamalkhan","chittagong","","","bd","","100","20","1","2018-05-12 15:34:51","2019-02-22 11:08:08");
INSERT INTO customers VALUES("3","3","","tariq","big tree","","3424","","khulshi","chittagong","","","bd","","","","1","2018-05-12 15:37:52","2019-03-02 11:24:07");
INSERT INTO customers VALUES("4","1","","test","","","4234","","frwerw","qwerwqr","","","","","","","0","2018-05-30 07:05:28","2018-05-30 07:07:38");
INSERT INTO customers VALUES("8","1","","anwar","smart it","anwar@smartit.com","32321","","nasirabad","chittagong","","","bd","","","","0","2018-09-01 08:56:13","2018-09-01 08:59:55");
INSERT INTO customers VALUES("11","1","","walk-in-customer","","","01923000001","11111","mohammadpur","dhaka","","","","251","","0","1","2018-09-02 07:00:54","2021-12-07 18:43:46");
INSERT INTO customers VALUES("15","1","","s","","","2","","s","3e","","","","","","","0","2018-11-05 09:30:39","2018-11-08 09:07:08");
INSERT INTO customers VALUES("16","1","","asas","","","2121","","dasd","asdd","","","","","","","0","2018-12-01 05:37:53","2018-12-04 03:25:46");
INSERT INTO customers VALUES("17","1","","sadman","","","312312","","khulshi","ctg","","","","","","","0","2020-06-22 15:15:35","2020-06-22 15:15:51");
INSERT INTO customers VALUES("19","1","19","Ashfaq","Digital image","shakalaka@gmail.com","1212","999","Andorkillah","Chittagong","Chittagong","1234","Bangladesh","6","","","1","2020-11-09 05:37:16","2021-10-14 15:28:20");
INSERT INTO customers VALUES("21","1","21","Modon Miya","modon company","modon@gmail.com","2222","","kuril road","Dhaka","","","","","","","1","2020-11-13 12:42:11","2020-11-13 12:42:11");
INSERT INTO customers VALUES("25","1","28","Imran miya","","imran@gmail.com","01923000001","","kljkj","hhjhh","","","","","","","0","2021-02-04 11:56:47","2021-02-04 11:56:47");



CREATE TABLE `deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("1","dr-20180808-044431","1","1","kajir deuri chittagong bd","abul","dhiman","","Instrument 1","3","2018-08-08 16:14:55","2020-09-26 17:55:39");
INSERT INTO deliveries VALUES("2","dr-20181106-105936","88","1","mohammadpur dhaka","","","","","2","2018-11-06 10:29:43","2018-11-06 10:40:38");
INSERT INTO deliveries VALUES("3","dr-20181106-111321","79","1","mohammadpur dhaka","Harun","Amjad","","","3","2018-11-06 10:43:25","2020-09-26 18:52:11");



CREATE TABLE `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","Sale","1","2018-12-27 10:46:47","2018-12-27 16:10:23");
INSERT INTO departments VALUES("2","xyz","1","2018-12-27 15:58:47","2018-12-27 15:58:47");



CREATE TABLE `deposits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposits VALUES("1","90","1","1","first deposit","2018-08-26 04:18:23","2018-08-26 06:48:55");
INSERT INTO deposits VALUES("3","100","2","1","","2018-08-26 06:23:16","2018-08-27 03:12:39");
INSERT INTO deposits VALUES("4","50","1","1","","2018-09-05 04:26:19","2018-09-05 04:26:19");
INSERT INTO deposits VALUES("5","50","1","1","","2018-09-10 05:38:40","2018-09-10 05:38:40");



CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","john","john@gmail.com","10001","2","12","johngmailcom.jpg","GEC","chittagong","Bangladesh","1","2018-12-30 06:18:37","2019-03-02 12:20:23");
INSERT INTO employees VALUES("3","tests","test@test.com","111","1","","","","","","1","2018-12-31 03:50:51","2019-01-03 05:33:54");



CREATE TABLE `expense_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("1","16718342","washing","1","2018-08-16 06:02:48","2019-03-02 12:32:07");
INSERT INTO expense_categories VALUES("2","60128975","electric bill","1","2018-08-16 06:09:18","2018-08-16 06:09:18");
INSERT INTO expense_categories VALUES("3","83954970","test","0","2018-08-16 06:20:28","2018-08-16 06:21:40");
INSERT INTO expense_categories VALUES("4","1234","snacks","1","2018-09-01 08:10:04","2018-09-01 08:10:04");



CREATE TABLE `expenses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("2","er-20180817-012254","1","2","1","1","","150","first expense...","2018-08-17 12:52:54","2018-08-17 13:14:13");
INSERT INTO expenses VALUES("3","er-20180817-014241","1","1","1","1","","125","second expense...","2018-08-17 13:12:41","2018-08-17 13:13:50");
INSERT INTO expenses VALUES("4","er-20181022-043609","2","1","1","1","","1000","","2018-10-22 16:06:09","2018-10-22 16:06:09");
INSERT INTO expenses VALUES("5","er-20181101-050207","2","2","1","1","","1000","","2018-11-01 04:32:07","2018-11-01 04:32:07");
INSERT INTO expenses VALUES("6","er-20181101-050231","2","1","1","1","","550","","2018-11-01 04:32:31","2018-11-01 04:32:31");
INSERT INTO expenses VALUES("7","er-20181105-091913","1","1","1","1","","2000","","2018-11-05 08:49:13","2018-11-05 08:49:13");
INSERT INTO expenses VALUES("8","er-20181105-091929","2","2","1","1","","1000","","2018-11-05 08:49:29","2018-11-05 08:49:29");
INSERT INTO expenses VALUES("9","er-20190101-063342","2","1","1","1","","100","","2019-01-01 06:03:42","2019-01-01 06:03:42");
INSERT INTO expenses VALUES("10","er-20190103-070018","2","2","1","9","","2000","","2019-01-03 06:30:18","2019-01-03 06:30:18");
INSERT INTO expenses VALUES("11","er-20190209-104656","2","2","1","1","","500","","2019-02-09 10:16:56","2019-02-09 10:16:56");
INSERT INTO expenses VALUES("12","er-20190209-104716","2","1","1","1","","400","","2019-02-09 10:17:16","2019-02-09 10:17:16");
INSERT INTO expenses VALUES("14","er-20190303-104142","2","2","1","1","","250","jjj","2019-03-03 10:11:42","2019-03-20 14:47:16");
INSERT INTO expenses VALUES("15","er-20190404-095645","2","1","1","1","","200","","2019-04-04 09:26:45","2019-04-04 09:26:45");
INSERT INTO expenses VALUES("16","er-20190528-103306","2","1","1","1","","560","","2019-05-28 10:03:06","2019-05-28 10:03:06");
INSERT INTO expenses VALUES("17","er-20190528-103325","2","2","1","1","","600","","2019-05-28 10:03:25","2019-05-28 10:03:25");
INSERT INTO expenses VALUES("19","er-20190613-101955","2","2","1","1","","800","","2019-06-13 09:49:55","2019-06-13 09:49:55");
INSERT INTO expenses VALUES("20","er-20191019-033149","2","1","1","1","","300","","2019-10-19 15:01:49","2019-10-19 15:01:49");
INSERT INTO expenses VALUES("21","er-20191222-023508","2","1","1","1","","550","","2019-12-22 14:05:08","2019-12-22 14:05:08");
INSERT INTO expenses VALUES("22","er-20200101-022304","2","2","1","1","","500","","2020-01-01 13:53:04","2020-01-01 13:53:04");
INSERT INTO expenses VALUES("23","er-20200204-105938","1","1","1","1","","400","","2020-02-04 22:29:38","2020-02-04 22:29:38");
INSERT INTO expenses VALUES("24","er-20200204-105957","1","2","1","1","","350","","2020-02-04 22:29:57","2020-02-04 22:29:57");
INSERT INTO expenses VALUES("25","er-20200406-075239","2","2","1","1","","750","","2020-04-06 19:22:39","2020-04-06 19:22:39");
INSERT INTO expenses VALUES("26","er-20200506-110112","2","2","1","1","","1260","","2020-05-06 22:31:12","2020-05-06 22:31:12");
INSERT INTO expenses VALUES("27","er-20200609-124344","2","1","1","1","","500","","2020-06-09 12:13:44","2020-06-09 12:13:44");
INSERT INTO expenses VALUES("28","er-20200609-124406","2","2","1","1","","1000","","2020-06-09 12:14:06","2020-06-09 12:14:06");
INSERT INTO expenses VALUES("29","er-20200703-064005","2","2","1","1","","630","","2020-07-03 18:10:05","2020-07-03 18:10:05");
INSERT INTO expenses VALUES("30","er-20200812-062947","1","2","1","1","","320","","2020-08-12 17:59:47","2020-08-12 17:59:47");
INSERT INTO expenses VALUES("31","er-20200812-063010","2","2","1","1","","730","","2020-08-12 18:00:10","2020-08-12 18:00:10");
INSERT INTO expenses VALUES("32","er-20201018-124438","2","1","1","9","2","100","","2020-10-18 12:14:38","2020-10-18 12:14:38");
INSERT INTO expenses VALUES("33","er-20201101-072257","1","2","1","1","4","50","","2020-11-01 06:52:57","2020-11-01 06:52:57");
INSERT INTO expenses VALUES("34","er-20201118-062500","4","1","1","1","3","200","","2020-11-18 05:55:00","2020-11-18 05:55:00");
INSERT INTO expenses VALUES("37","er-20210114-065938","2","2","1","1","4","25.5","","2021-01-14 06:29:38","2021-01-14 06:29:38");
INSERT INTO expenses VALUES("38","er-20210601-075909","2","1","1","1","3","100","","2021-06-01 19:29:09","2021-06-01 19:29:09");
INSERT INTO expenses VALUES("39","er-20211208-115635","2","2","1","1","4","200","","2021-12-08 11:26:35","2021-12-08 11:26:35");



CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int DEFAULT NULL,
  `theme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Hyvikk","20220205020947.png","0","1","own","d/m/Y","Hyvikk","standard","1","default.css","2018-07-06 11:43:11","2022-02-05 14:09:47","prefix");



CREATE TABLE `gift_card_recharges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int NOT NULL,
  `amount` double NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_card_recharges VALUES("1","2","100","1","2018-08-25 04:38:29","2018-08-25 04:38:29");
INSERT INTO gift_card_recharges VALUES("2","1","200","1","2018-08-25 04:38:50","2018-08-25 04:38:50");
INSERT INTO gift_card_recharges VALUES("3","1","100","1","2018-09-05 05:20:41","2018-09-05 05:20:41");
INSERT INTO gift_card_recharges VALUES("4","1","50","1","2018-09-05 05:21:38","2018-09-05 05:21:38");
INSERT INTO gift_card_recharges VALUES("5","1","50","1","2018-09-05 05:23:36","2018-09-05 05:23:36");
INSERT INTO gift_card_recharges VALUES("6","2","50","1","2018-09-05 05:24:34","2018-09-05 05:24:34");
INSERT INTO gift_card_recharges VALUES("7","5","10","1","2018-09-30 05:49:48","2018-09-30 05:49:48");
INSERT INTO gift_card_recharges VALUES("8","5","10","1","2018-09-30 05:50:04","2018-09-30 05:50:04");
INSERT INTO gift_card_recharges VALUES("9","2","100","1","2018-10-07 08:43:05","2018-10-07 08:43:05");
INSERT INTO gift_card_recharges VALUES("10","1","200","1","2018-10-07 08:43:39","2018-10-07 08:43:39");
INSERT INTO gift_card_recharges VALUES("11","1","300","1","2018-10-23 05:52:49","2018-10-23 05:52:49");
INSERT INTO gift_card_recharges VALUES("12","2","130","1","2021-02-11 13:06:01","2021-02-11 13:06:01");



CREATE TABLE `gift_cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_cards VALUES("1","3571097513020486","1400","450","1","","2020-12-31","1","1","2018-08-18 07:27:40","2020-10-18 10:44:26");
INSERT INTO gift_cards VALUES("2","0452297501931931","500","100","2","","2021-12-31","1","1","2018-08-18 08:16:43","2021-02-11 13:06:01");
INSERT INTO gift_cards VALUES("3","123","13123","0","1","","2018-08-19","1","0","2018-08-19 04:08:21","2018-08-19 04:08:28");
INSERT INTO gift_cards VALUES("4","1862381252690499","100","0","","1","2018-10-04","1","0","2018-09-30 05:46:28","2018-09-30 05:47:21");
INSERT INTO gift_cards VALUES("5","2300813717254199","143","0","","1","2018-10-04","1","0","2018-09-30 05:48:49","2018-09-30 05:50:20");
INSERT INTO gift_cards VALUES("6","8327019475026421","1","0","1","","2018-10-07","1","0","2018-10-07 08:42:41","2018-10-07 08:42:55");
INSERT INTO gift_cards VALUES("7","2063379780590151","1","0","1","","2018-10-23","1","0","2018-10-23 05:53:22","2018-10-23 05:53:39");



CREATE TABLE `holidays` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `hrm_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","10:00am","6:00pm","2019-01-02 07:50:08","2019-01-02 09:50:53");



CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO languages VALUES("1","en","2018-07-08 04:29:17","2019-12-24 23:04:20");



CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2018_02_17_060412_create_categories_table","1");
INSERT INTO migrations VALUES("4","2018_02_20_035727_create_brands_table","1");
INSERT INTO migrations VALUES("5","2018_02_25_100635_create_suppliers_table","1");
INSERT INTO migrations VALUES("6","2018_02_27_101619_create_warehouse_table","1");
INSERT INTO migrations VALUES("7","2018_03_03_040448_create_units_table","1");
INSERT INTO migrations VALUES("8","2018_03_04_041317_create_taxes_table","1");
INSERT INTO migrations VALUES("9","2018_03_10_061915_create_customer_groups_table","1");
INSERT INTO migrations VALUES("10","2018_03_10_090534_create_customers_table","1");
INSERT INTO migrations VALUES("11","2018_03_11_095547_create_billers_table","1");
INSERT INTO migrations VALUES("12","2018_04_05_054401_create_products_table","1");
INSERT INTO migrations VALUES("13","2018_04_06_133606_create_purchases_table","1");
INSERT INTO migrations VALUES("14","2018_04_06_154600_create_product_purchases_table","1");
INSERT INTO migrations VALUES("15","2018_04_06_154915_create_product_warhouse_table","1");
INSERT INTO migrations VALUES("16","2018_04_10_085927_create_sales_table","1");
INSERT INTO migrations VALUES("17","2018_04_10_090133_create_product_sales_table","1");
INSERT INTO migrations VALUES("18","2018_04_10_090254_create_payments_table","1");
INSERT INTO migrations VALUES("19","2018_04_10_090341_create_payment_with_cheque_table","1");
INSERT INTO migrations VALUES("20","2018_04_10_090509_create_payment_with_credit_card_table","1");
INSERT INTO migrations VALUES("21","2018_04_13_121436_create_quotation_table","1");
INSERT INTO migrations VALUES("22","2018_04_13_122324_create_product_quotation_table","1");
INSERT INTO migrations VALUES("23","2018_04_14_121802_create_transfers_table","1");
INSERT INTO migrations VALUES("24","2018_04_14_121913_create_product_transfer_table","1");
INSERT INTO migrations VALUES("25","2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table","2");
INSERT INTO migrations VALUES("26","2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table","3");
INSERT INTO migrations VALUES("27","2018_05_20_054532_create_adjustments_table","4");
INSERT INTO migrations VALUES("28","2018_05_20_054859_create_product_adjustments_table","4");
INSERT INTO migrations VALUES("29","2018_05_21_163419_create_returns_table","5");
INSERT INTO migrations VALUES("30","2018_05_21_163443_create_product_returns_table","5");
INSERT INTO migrations VALUES("31","2018_06_02_050905_create_roles_table","6");
INSERT INTO migrations VALUES("32","2018_06_02_073430_add_columns_to_users_table","7");
INSERT INTO migrations VALUES("33","2018_06_03_053738_create_permission_tables","8");
INSERT INTO migrations VALUES("36","2018_06_21_063736_create_pos_setting_table","9");
INSERT INTO migrations VALUES("37","2018_06_21_094155_add_user_id_to_sales_table","10");
INSERT INTO migrations VALUES("38","2018_06_21_101529_add_user_id_to_purchases_table","11");
INSERT INTO migrations VALUES("39","2018_06_21_103512_add_user_id_to_transfers_table","12");
INSERT INTO migrations VALUES("40","2018_06_23_061058_add_user_id_to_quotations_table","13");
INSERT INTO migrations VALUES("41","2018_06_23_082427_add_is_deleted_to_users_table","14");
INSERT INTO migrations VALUES("42","2018_06_25_043308_change_email_to_users_table","15");
INSERT INTO migrations VALUES("43","2018_07_06_115449_create_general_settings_table","16");
INSERT INTO migrations VALUES("44","2018_07_08_043944_create_languages_table","17");
INSERT INTO migrations VALUES("45","2018_07_11_102144_add_user_id_to_returns_table","18");
INSERT INTO migrations VALUES("46","2018_07_11_102334_add_user_id_to_payments_table","18");
INSERT INTO migrations VALUES("47","2018_07_22_130541_add_digital_to_products_table","19");
INSERT INTO migrations VALUES("49","2018_07_24_154250_create_deliveries_table","20");
INSERT INTO migrations VALUES("50","2018_08_16_053336_create_expense_categories_table","21");
INSERT INTO migrations VALUES("51","2018_08_17_115415_create_expenses_table","22");
INSERT INTO migrations VALUES("55","2018_08_18_050418_create_gift_cards_table","23");
INSERT INTO migrations VALUES("56","2018_08_19_063119_create_payment_with_gift_card_table","24");
INSERT INTO migrations VALUES("57","2018_08_25_042333_create_gift_card_recharges_table","25");
INSERT INTO migrations VALUES("58","2018_08_25_101354_add_deposit_expense_to_customers_table","26");
INSERT INTO migrations VALUES("59","2018_08_26_043801_create_deposits_table","27");
INSERT INTO migrations VALUES("60","2018_09_02_044042_add_keybord_active_to_pos_setting_table","28");
INSERT INTO migrations VALUES("61","2018_09_09_092713_create_payment_with_paypal_table","29");
INSERT INTO migrations VALUES("62","2018_09_10_051254_add_currency_to_general_settings_table","30");
INSERT INTO migrations VALUES("63","2018_10_22_084118_add_biller_and_store_id_to_users_table","31");
INSERT INTO migrations VALUES("65","2018_10_26_034927_create_coupons_table","32");
INSERT INTO migrations VALUES("66","2018_10_27_090857_add_coupon_to_sales_table","33");
INSERT INTO migrations VALUES("67","2018_11_07_070155_add_currency_position_to_general_settings_table","34");
INSERT INTO migrations VALUES("68","2018_11_19_094650_add_combo_to_products_table","35");
INSERT INTO migrations VALUES("69","2018_12_09_043712_create_accounts_table","36");
INSERT INTO migrations VALUES("70","2018_12_17_112253_add_is_default_to_accounts_table","37");
INSERT INTO migrations VALUES("71","2018_12_19_103941_add_account_id_to_payments_table","38");
INSERT INTO migrations VALUES("72","2018_12_20_065900_add_account_id_to_expenses_table","39");
INSERT INTO migrations VALUES("73","2018_12_20_082753_add_account_id_to_returns_table","40");
INSERT INTO migrations VALUES("74","2018_12_26_064330_create_return_purchases_table","41");
INSERT INTO migrations VALUES("75","2018_12_26_144210_create_purchase_product_return_table","42");
INSERT INTO migrations VALUES("76","2018_12_26_144708_create_purchase_product_return_table","43");
INSERT INTO migrations VALUES("77","2018_12_27_110018_create_departments_table","44");
INSERT INTO migrations VALUES("78","2018_12_30_054844_create_employees_table","45");
INSERT INTO migrations VALUES("79","2018_12_31_125210_create_payrolls_table","46");
INSERT INTO migrations VALUES("80","2018_12_31_150446_add_department_id_to_employees_table","47");
INSERT INTO migrations VALUES("81","2019_01_01_062708_add_user_id_to_expenses_table","48");
INSERT INTO migrations VALUES("82","2019_01_02_075644_create_hrm_settings_table","49");
INSERT INTO migrations VALUES("83","2019_01_02_090334_create_attendances_table","50");
INSERT INTO migrations VALUES("84","2019_01_27_160956_add_three_columns_to_general_settings_table","51");
INSERT INTO migrations VALUES("85","2019_02_15_183303_create_stock_counts_table","52");
INSERT INTO migrations VALUES("86","2019_02_17_101604_add_is_adjusted_to_stock_counts_table","53");
INSERT INTO migrations VALUES("87","2019_04_13_101707_add_tax_no_to_customers_table","54");
INSERT INTO migrations VALUES("89","2019_10_14_111455_create_holidays_table","55");
INSERT INTO migrations VALUES("90","2019_11_13_145619_add_is_variant_to_products_table","56");
INSERT INTO migrations VALUES("91","2019_11_13_150206_create_product_variants_table","57");
INSERT INTO migrations VALUES("92","2019_11_13_153828_create_variants_table","57");
INSERT INTO migrations VALUES("93","2019_11_25_134041_add_qty_to_product_variants_table","58");
INSERT INTO migrations VALUES("94","2019_11_25_134922_add_variant_id_to_product_purchases_table","58");
INSERT INTO migrations VALUES("95","2019_11_25_145341_add_variant_id_to_product_warehouse_table","58");
INSERT INTO migrations VALUES("96","2019_11_29_182201_add_variant_id_to_product_sales_table","59");
INSERT INTO migrations VALUES("97","2019_12_04_121311_add_variant_id_to_product_quotation_table","60");
INSERT INTO migrations VALUES("98","2019_12_05_123802_add_variant_id_to_product_transfer_table","61");
INSERT INTO migrations VALUES("100","2019_12_08_114954_add_variant_id_to_product_returns_table","62");
INSERT INTO migrations VALUES("101","2019_12_08_203146_add_variant_id_to_purchase_product_return_table","63");
INSERT INTO migrations VALUES("102","2020_02_28_103340_create_money_transfers_table","64");
INSERT INTO migrations VALUES("103","2020_07_01_193151_add_image_to_categories_table","65");
INSERT INTO migrations VALUES("105","2020_09_26_130426_add_user_id_to_deliveries_table","66");
INSERT INTO migrations VALUES("107","2020_10_11_125457_create_cash_registers_table","67");
INSERT INTO migrations VALUES("108","2020_10_13_155019_add_cash_register_id_to_sales_table","68");
INSERT INTO migrations VALUES("109","2020_10_13_172624_add_cash_register_id_to_returns_table","69");
INSERT INTO migrations VALUES("110","2020_10_17_212338_add_cash_register_id_to_payments_table","70");
INSERT INTO migrations VALUES("111","2020_10_18_124200_add_cash_register_id_to_expenses_table","71");
INSERT INTO migrations VALUES("112","2020_10_21_121632_add_developed_by_to_general_settings_table","72");
INSERT INTO migrations VALUES("113","2019_08_19_000000_create_failed_jobs_table","73");
INSERT INTO migrations VALUES("114","2020_10_30_135557_create_notifications_table","73");
INSERT INTO migrations VALUES("115","2020_11_01_044954_create_currencies_table","74");
INSERT INTO migrations VALUES("116","2020_11_01_140736_add_price_to_product_warehouse_table","75");
INSERT INTO migrations VALUES("117","2020_11_02_050633_add_is_diff_price_to_products_table","76");
INSERT INTO migrations VALUES("118","2020_11_09_055222_add_user_id_to_customers_table","77");
INSERT INTO migrations VALUES("119","2020_11_17_054806_add_invoice_format_to_general_settings_table","78");
INSERT INTO migrations VALUES("120","2021_02_10_074859_add_variant_id_to_product_adjustments_table","79");
INSERT INTO migrations VALUES("121","2021_03_07_093606_create_product_batches_table","80");
INSERT INTO migrations VALUES("122","2021_03_07_093759_add_product_batch_id_to_product_warehouse_table","80");
INSERT INTO migrations VALUES("123","2021_03_07_093900_add_product_batch_id_to_product_purchases_table","80");
INSERT INTO migrations VALUES("124","2021_03_11_132603_add_product_batch_id_to_product_sales_table","81");
INSERT INTO migrations VALUES("127","2021_03_25_125421_add_is_batch_to_products_table","82");
INSERT INTO migrations VALUES("128","2021_05_19_120127_add_product_batch_id_to_product_returns_table","82");
INSERT INTO migrations VALUES("130","2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table","83");
INSERT INTO migrations VALUES("131","2021_05_23_124848_add_product_batch_id_to_product_transfer_table","84");
INSERT INTO migrations VALUES("132","2021_05_26_153106_add_product_batch_id_to_product_quotation_table","85");
INSERT INTO migrations VALUES("133","2021_06_08_213007_create_reward_point_settings_table","86");
INSERT INTO migrations VALUES("134","2021_06_16_104155_add_points_to_customers_table","87");
INSERT INTO migrations VALUES("135","2021_06_17_101057_add_used_points_to_payments_table","88");
INSERT INTO migrations VALUES("136","2021_07_06_132716_add_variant_list_to_products_table","89");
INSERT INTO migrations VALUES("137","2021_09_27_161141_add_is_imei_to_products_table","90");
INSERT INTO migrations VALUES("138","2021_09_28_170052_add_imei_number_to_product_warehouse_table","91");
INSERT INTO migrations VALUES("139","2021_09_28_170126_add_imei_number_to_product_purchases_table","91");
INSERT INTO migrations VALUES("140","2021_10_03_170652_add_imei_number_to_product_sales_table","92");
INSERT INTO migrations VALUES("141","2021_10_10_145214_add_imei_number_to_product_returns_table","93");
INSERT INTO migrations VALUES("142","2021_10_11_104504_add_imei_number_to_product_transfer_table","94");
INSERT INTO migrations VALUES("143","2021_10_12_160107_add_imei_number_to_purchase_product_return_table","95");
INSERT INTO migrations VALUES("144","2021_10_12_205146_add_is_rtl_to_general_settings_table","96");
INSERT INTO migrations VALUES("148","2021_10_23_142451_add_is_approve_to_payments_table","97");
INSERT INTO migrations VALUES("149","2022_02_03_151850_create_pizzas_table","97");
INSERT INTO migrations VALUES("150","2022_02_04_111821_create_product_pizzas_table","97");
INSERT INTO migrations VALUES("151","2022_02_09_170103_create_orders_table","98");



CREATE TABLE `money_transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO money_transfers VALUES("2","mtr-20200228-071852","1","3","100","2020-02-28 18:48:52","2020-02-28 18:48:52");



CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES("249beded-5431-40a3-ba1e-d255ffb047a3","App\Notifications\SendNotification","App\User","9","{"message":"Please delete all pending purchase."}","2020-11-01 07:03:32","2020-11-01 07:03:07","2020-11-01 07:03:32");
INSERT INTO notifications VALUES("50684783-f550-4977-bc9b-891e444f38f1","App\Notifications\SendNotification","App\User","22","{"message":"srgrrgr"}","","2022-02-11 16:44:53","2022-02-11 16:44:53");



CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pizza_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO orders VALUES("2","{"15":"1","2":"0","1":"5","17":"0","16":"0","3":"1"}","2022-02-11","1","2022-02-11 12:31:04","2022-02-11 12:31:04");



CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_cheque` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `cheque_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_cheque VALUES("1","19","23425235235","2018-07-01 08:39:48","2018-07-01 08:39:48");
INSERT INTO payment_with_cheque VALUES("2","24","3123123123","2018-07-10 06:51:32","2018-07-10 06:51:32");
INSERT INTO payment_with_cheque VALUES("3","31","767867678","2018-08-08 16:06:22","2018-08-08 16:06:22");
INSERT INTO payment_with_cheque VALUES("4","34","3123412","2018-08-09 05:25:54","2018-08-09 05:25:54");
INSERT INTO payment_with_cheque VALUES("5","35","7765","2018-08-09 06:02:14","2018-08-09 06:02:14");
INSERT INTO payment_with_cheque VALUES("6","44","3124142412","2018-08-30 08:37:18","2018-08-30 08:37:18");
INSERT INTO payment_with_cheque VALUES("7","51","6576764646","2018-09-03 09:38:21","2018-09-03 09:38:21");
INSERT INTO payment_with_cheque VALUES("8","53","111111111","2018-09-03 09:45:24","2018-09-03 09:45:24");
INSERT INTO payment_with_cheque VALUES("9","79","1111","2018-10-06 06:21:55","2018-10-06 06:21:55");
INSERT INTO payment_with_cheque VALUES("10","147","221133","2018-12-04 06:28:35","2018-12-04 06:28:35");
INSERT INTO payment_with_cheque VALUES("11","175","1111","2019-02-07 12:08:23","2019-02-07 12:08:23");
INSERT INTO payment_with_cheque VALUES("12","176","1111","2019-02-07 12:24:59","2019-02-07 12:24:59");
INSERT INTO payment_with_cheque VALUES("13","178","420","2019-02-07 12:37:04","2019-02-07 12:37:04");
INSERT INTO payment_with_cheque VALUES("14","216","12344321","2019-11-11 10:09:11","2019-11-11 10:09:11");
INSERT INTO payment_with_cheque VALUES("15","295","111122222","2020-10-18 10:47:24","2020-10-18 10:47:24");



CREATE TABLE `payment_with_credit_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_credit_card VALUES("4","294","1","cus_IDw8z9yJZn4qH3","ch_1HdUGJKwOmA8HLXePiqphlky","2020-10-18 10:46:55","2020-10-18 10:46:55");



CREATE TABLE `payment_with_gift_card` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `gift_card_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_with_gift_card VALUES("1","36","2","2018-08-25 03:18:36","2018-08-25 06:27:35");
INSERT INTO payment_with_gift_card VALUES("4","39","1","2018-08-25 08:06:34","2018-08-25 08:06:34");
INSERT INTO payment_with_gift_card VALUES("6","50","1","2018-09-03 04:31:38","2018-09-03 04:31:38");
INSERT INTO payment_with_gift_card VALUES("8","293","1","2020-10-18 10:44:26","2020-10-18 10:44:26");



CREATE TABLE `payment_with_paypal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `cash_register_id` int DEFAULT NULL,
  `account_id` int NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("33","spr-20180809-055453","1","","2","","1","1000","","0","Cash","","2018-08-09 05:24:53","2018-08-09 05:24:53");
INSERT INTO payments VALUES("34","spr-20180809-055553","1","","2","","1","1200","","0","Cheque","","2018-08-09 05:25:53","2018-08-09 05:26:36");
INSERT INTO payments VALUES("35","spr-20180809-063214","1","","3","","1","897","","0","Cheque","","2018-08-09 06:02:14","2018-08-09 06:02:14");
INSERT INTO payments VALUES("36","spr-20180825-034836","1","","4","","1","100","","0","Gift Card","100 bucks paid...","2018-08-25 03:18:36","2018-08-25 06:27:35");
INSERT INTO payments VALUES("39","spr-20180825-083634","1","","4","","1","200","","0","Gift Card","","2018-08-25 08:06:34","2018-08-25 08:06:34");
INSERT INTO payments VALUES("41","spr-20180826-094836","1","","6","","1","20","","0","Deposit","20 bucks paid","2018-08-26 09:18:36","2018-08-27 03:12:13");
INSERT INTO payments VALUES("42","spr-20180827-073545","1","","7","","1","880","","0","Cash","","2018-08-27 07:05:45","2018-08-27 07:05:45");
INSERT INTO payments VALUES("43","ppr-20180830-071637","1","13","","","1","100","","0","Cash","100 bucks paid...","2018-08-30 06:46:37","2018-08-30 06:46:37");
INSERT INTO payments VALUES("44","ppr-20180830-090718","1","13","","","1","200","","0","Cheque","","2018-08-30 08:37:18","2018-08-30 08:37:18");
INSERT INTO payments VALUES("46","spr-20180902-053954","1","","8","","1","3529.8","","0","Cash","fully paid","2018-09-02 05:09:54","2018-09-02 05:09:54");
INSERT INTO payments VALUES("49","spr-20180903-033314","1","","9","","1","20","","0","Deposit","fully paid","2018-09-03 03:03:14","2018-09-03 03:03:14");
INSERT INTO payments VALUES("50","spr-20180903-050138","1","","10","","1","200","","0","Gift Card","50 bucks due...","2018-09-03 04:31:38","2018-09-10 03:10:28");
INSERT INTO payments VALUES("51","spr-20180903-100821","1","","11","","1","5500","","0","Cheque","","2018-09-03 09:38:21","2018-09-03 09:38:21");
INSERT INTO payments VALUES("53","ppr-20180903-101524","1","16","","","1","1750","","0","Cheque","","2018-09-03 09:45:24","2018-10-06 06:39:20");
INSERT INTO payments VALUES("78","spr-20180926-092105","1","","31","","1","560","","0","Cash","","2018-09-26 08:51:05","2018-09-26 08:51:05");
INSERT INTO payments VALUES("79","spr-20181006-065017","1","","30","","1","100","","0","Cheque","","2018-10-06 06:20:17","2018-10-06 06:21:55");
INSERT INTO payments VALUES("80","spr-20181006-065222","1","","30","","1","20","","0","Cash","","2018-10-06 06:22:22","2018-10-06 06:22:22");
INSERT INTO payments VALUES("82","ppr-20181006-070935","1","16","","","1","1600","","0","Cash","","2018-10-06 06:39:35","2018-10-06 06:39:35");
INSERT INTO payments VALUES("83","spr-20181010-041636","1","","41","","1","461","","0","Cash","","2018-10-10 03:46:36","2018-10-10 03:46:36");
INSERT INTO payments VALUES("84","spr-20181010-053456","1","","42","","1","440","","0","Cash","","2018-10-10 05:04:56","2018-10-10 05:04:56");
INSERT INTO payments VALUES("91","spr-20181021-065338","1","","55","","1","250","","0","Cash","","2018-10-21 06:23:38","2018-10-21 06:23:38");
INSERT INTO payments VALUES("92","spr-20181021-082618","1","","57","","1","575.2","","0","Cash","","2018-10-21 07:56:18","2018-10-21 07:56:18");
INSERT INTO payments VALUES("93","spr-20181022-032730","1","","58","","1","1220","","0","Cash","","2018-10-22 14:57:30","2018-10-22 14:57:30");
INSERT INTO payments VALUES("104","spr-20181023-071548","11","","73","","1","5500","","0","Cash","","2018-10-23 06:45:48","2018-10-23 06:45:48");
INSERT INTO payments VALUES("105","spr-20181023-071648","1","","74","","1","2320","","0","Cash","","2018-10-23 06:46:48","2018-10-23 06:46:48");
INSERT INTO payments VALUES("126","spr-20181101-050033","1","","75","","1","7678","","0","Cash","","2018-11-01 04:30:33","2018-11-01 04:30:33");
INSERT INTO payments VALUES("127","spr-20181101-050130","1","","76","","1","1424","","0","Cash","","2018-11-01 04:31:30","2018-11-08 09:14:51");
INSERT INTO payments VALUES("129","spr-20181105-091523","1","","79","","1","14454","","0","Cash","","2018-11-05 08:45:23","2018-11-05 08:45:23");
INSERT INTO payments VALUES("130","spr-20181105-092002","1","","80","","1","2500","","0","Cash","","2018-11-05 08:50:02","2018-11-05 08:50:02");
INSERT INTO payments VALUES("131","ppr-20181105-092128","1","24","","","1","15950","","0","Cash","","2018-11-05 08:51:28","2018-11-05 08:51:28");
INSERT INTO payments VALUES("137","spr-20181105-095952","1","","86","","1","1100","","0","Cash","","2018-11-05 09:29:52","2018-11-05 09:29:52");
INSERT INTO payments VALUES("138","spr-20181105-100310","1","","88","","1","1100","","0","Cash","","2018-11-05 09:33:10","2018-11-05 09:33:10");
INSERT INTO payments VALUES("139","spr-20181126-020534","1","","94","","1","120","","0","Cash","","2018-11-26 13:35:34","2018-11-26 13:35:34");
INSERT INTO payments VALUES("140","spr-20181128-071515","1","","96","","1","132","","0","Cash","","2018-11-28 06:45:15","2018-11-28 06:45:15");
INSERT INTO payments VALUES("141","spr-20181201-060524","1","","97","","1","200","","300","Cash","","2018-12-01 05:35:24","2018-12-04 05:51:05");
INSERT INTO payments VALUES("148","ppr-20181204-065932","1","23","","","1","500","","500","Cash","","2018-12-04 06:29:32","2018-12-04 06:29:44");
INSERT INTO payments VALUES("149","ppr-20181205-053443","1","25","","","1","4450","","550","Cash","","2018-12-05 05:04:43","2018-12-05 05:04:43");
INSERT INTO payments VALUES("150","spr-20181205-053608","1","","98","","1","800","","200","Cash","","2018-12-05 05:06:08","2018-12-05 05:06:08");
INSERT INTO payments VALUES("151","spr-20181205-053724","1","","99","","1","800","","0","Cash","","2018-12-05 05:07:24","2018-12-05 05:07:24");
INSERT INTO payments VALUES("152","spr-20181208-062032","1","","101","","1","100","","400","Cash","","2018-12-08 05:50:32","2018-12-11 08:49:39");
INSERT INTO payments VALUES("157","ppr-20181220-063439","1","27","","","1","10","","0","Cash","","2018-12-20 06:04:39","2018-12-20 06:05:01");
INSERT INTO payments VALUES("159","spr-20181224-045832","1","","103","","1","120","","0","Cash","","2018-12-24 04:28:32","2018-12-24 04:28:32");
INSERT INTO payments VALUES("160","spr-20190101-054544","1","","105","","1","21","","0","Cash","","2019-01-01 05:15:44","2019-01-01 05:15:44");
INSERT INTO payments VALUES("161","spr-20190101-091040","1","","106","","1","860","","0","Cash","","2019-01-01 08:40:40","2019-01-01 08:40:40");
INSERT INTO payments VALUES("162","spr-20190103-065627","1","","107","","1","5040","","960","Cash","","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO payments VALUES("163","spr-20190120-035824","1","","108","","1","120","","0","Cash","","2019-01-20 15:28:24","2019-01-20 15:28:24");
INSERT INTO payments VALUES("164","ppr-20190129-100302","9","36","","","1","650","","350","Cash","","2019-01-29 09:33:02","2019-01-29 09:33:02");
INSERT INTO payments VALUES("165","ppr-20190129-100324","9","34","","","1","2860","","140","Cash","","2019-01-29 09:33:24","2019-01-29 09:33:24");
INSERT INTO payments VALUES("166","spr-20190129-101451","9","","109","","1","540","","460","Cash","","2019-01-29 09:44:51","2019-01-29 09:44:51");
INSERT INTO payments VALUES("167","spr-20190129-115048","9","","110","","1","1700","","300","Cash","","2019-01-29 11:20:48","2019-01-29 11:20:48");
INSERT INTO payments VALUES("168","spr-20190131-110839","9","","111","","1","271","","0","Cash","","2019-01-31 10:38:39","2019-01-31 10:38:39");
INSERT INTO payments VALUES("169","spr-20190202-104045","1","","112","","1","440","","0","Cash","","2019-02-02 10:10:45","2019-02-02 10:10:45");
INSERT INTO payments VALUES("170","spr-20190202-114117","1","","113","","1","350","","0","Cash","","2019-02-02 11:11:17","2019-02-02 11:11:17");
INSERT INTO payments VALUES("171","spr-20190205-030454","1","","114","","1","440","","0","Cash","","2019-02-05 14:34:54","2019-02-05 14:34:54");
INSERT INTO payments VALUES("176","ppr-20190207-125418","1","35","","","1","50","","50","Cash","","2019-02-07 12:24:18","2019-02-07 12:35:23");
INSERT INTO payments VALUES("178","ppr-20190207-010640","1","35","","","1","50","","50","Cheque","","2019-02-07 12:36:40","2019-02-07 12:37:04");
INSERT INTO payments VALUES("179","spr-20190207-010915","1","","120","","1","50","","50","Cash","","2019-02-07 12:39:15","2019-02-07 12:39:15");
INSERT INTO payments VALUES("180","spr-20190209-104816","1","","121","","1","1272","","728","Cash","","2019-02-09 10:18:16","2019-02-09 10:18:16");
INSERT INTO payments VALUES("181","ppr-20190209-104940","1","38","","","1","1660","","0","Cash","","2019-02-09 10:19:40","2019-02-09 10:19:40");
INSERT INTO payments VALUES("182","ppr-20190209-104959","1","39","","","1","973.5","","0","Cash","","2019-02-09 10:19:59","2019-02-09 10:19:59");
INSERT INTO payments VALUES("183","spr-20190219-023214","1","","123","","1","440","","0","Cash","","2019-02-19 14:02:14","2019-02-19 14:02:14");
INSERT INTO payments VALUES("189","spr-20190303-104010","1","","127","","1","2500","","0","Cash","","2019-03-03 10:10:10","2019-03-03 10:10:10");
INSERT INTO payments VALUES("190","ppr-20190303-104046","1","40","","","1","100","","0","Cash","","2019-03-03 10:10:46","2019-03-03 10:10:46");
INSERT INTO payments VALUES("191","ppr-20190303-104222","1","37","","","1","4000","","0","Cash","","2019-03-03 10:12:22","2019-03-03 10:12:22");
INSERT INTO payments VALUES("192","ppr-20190303-104414","1","41","","","1","1000","","0","Cash","","2019-03-03 10:14:14","2019-03-03 10:14:14");
INSERT INTO payments VALUES("193","spr-20190404-095555","1","","128","","1","560","","0","Cash","","2019-04-04 09:25:55","2019-04-04 09:25:55");
INSERT INTO payments VALUES("194","ppr-20190404-095910","1","42","","","1","300","","200","Cash","","2019-04-04 09:29:10","2019-04-13 16:22:38");
INSERT INTO payments VALUES("195","spr-20190404-095937","1","","129","","1","120","","0","Cash","","2019-04-04 09:29:37","2019-04-04 09:29:37");
INSERT INTO payments VALUES("196","spr-20190421-122124","1","","130","","1","586","","0","Cash","","2019-04-21 11:51:24","2019-04-21 11:51:24");
INSERT INTO payments VALUES("197","spr-20190528-103229","1","","131","","1","2890","","0","Cash","","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO payments VALUES("198","ppr-20190613-101351","1","37","","","1","2390","","0","Cash","","2019-06-13 09:43:51","2019-06-13 09:43:51");
INSERT INTO payments VALUES("199","spr-20190613-101637","1","","132","","1","840","","0","Cash","","2019-06-13 09:46:37","2019-06-13 09:46:37");
INSERT INTO payments VALUES("200","ppr-20190613-101713","1","43","","","1","1000","","0","Cash","","2019-06-13 09:47:13","2019-06-13 09:47:13");
INSERT INTO payments VALUES("201","spr-20190613-101752","1","","133","","1","2700","","0","Cash","","2019-06-13 09:47:52","2019-06-13 09:47:52");
INSERT INTO payments VALUES("202","ppr-20191019-032925","1","43","","","1","3290","","710","Cash","","2019-10-19 14:59:25","2019-10-19 14:59:25");
INSERT INTO payments VALUES("203","spr-20191019-033028","1","","134","","1","2940","","60","Cash","","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO payments VALUES("205","spr-20191103-114044","1","","139","","1","488","","12","Cash","","2019-11-03 11:10:44","2019-11-03 11:10:44");
INSERT INTO payments VALUES("206","ppr-20191103-114222","1","46","","","1","200","","0","Cash","","2019-11-03 11:12:22","2019-11-03 11:12:22");
INSERT INTO payments VALUES("211","spr-20191109-074131","1","","144","","1","1220","","0","Cash","","2019-11-09 19:11:31","2019-11-09 19:11:31");
INSERT INTO payments VALUES("216","ppr-20191111-103911","1","49","","","1","5000","","0","Cheque","","2019-11-11 10:09:11","2019-11-11 10:09:11");
INSERT INTO payments VALUES("217","spr-20191111-104008","1","","147","","1","2220","","780","Cash","","2019-11-11 10:10:08","2019-11-11 10:10:08");
INSERT INTO payments VALUES("222","spr-20191203-115128","1","","163","","1","3","","0","Cash","","2019-12-03 11:21:28","2019-12-03 11:21:28");
INSERT INTO payments VALUES("227","ppr-20191204-111124","1","57","","","1","220","","280","Cash","","2019-12-04 22:41:24","2019-12-04 22:41:24");
INSERT INTO payments VALUES("228","spr-20191205-092712","1","","173","","1","621","","0","Cash","","2019-12-05 08:57:12","2019-12-05 08:57:12");
INSERT INTO payments VALUES("239","spr-20191222-104058","1","","187","","1","288","","212","Cash","","2019-12-22 10:10:58","2019-12-22 10:10:58");
INSERT INTO payments VALUES("241","spr-20191223-125946","1","","190","","1","1100","","400","Cash","","2019-12-23 12:29:46","2019-12-23 12:29:46");
INSERT INTO payments VALUES("244","ppr-20200101-010750","1","61","","","1","60","","0","Cash","","2020-01-01 12:37:50","2020-01-01 12:37:50");
INSERT INTO payments VALUES("246","spr-20200101-022028","1","","193","","1","1100","","400","Cash","","2020-01-01 13:50:28","2020-01-01 13:50:28");
INSERT INTO payments VALUES("247","ppr-20200101-022131","1","59","","","1","6","","0","Cash","","2020-01-01 13:51:31","2020-01-01 13:51:31");
INSERT INTO payments VALUES("248","ppr-20200101-022137","1","58","","","1","4","","0","Cash","","2020-01-01 13:51:37","2020-01-01 13:51:37");
INSERT INTO payments VALUES("249","ppr-20200101-022144","1","56","","","1","2","","0","Cash","","2020-01-01 13:51:44","2020-01-01 13:51:44");
INSERT INTO payments VALUES("250","ppr-20200101-022152","1","55","","","1","4","","0","Cash","","2020-01-01 13:51:52","2020-01-01 13:51:52");
INSERT INTO payments VALUES("251","ppr-20200101-022225","1","49","","","1","2000","","0","Cash","","2020-01-01 13:52:25","2020-01-01 13:52:25");
INSERT INTO payments VALUES("252","spr-20200102-043947","1","","194","","1","892","","108","Cash","","2020-01-02 16:09:47","2020-01-02 16:09:47");
INSERT INTO payments VALUES("258","spr-20200203-035256","1","","201","","1","120","","880","Cash","","2020-02-03 15:22:56","2020-02-03 15:22:56");
INSERT INTO payments VALUES("259","spr-20200204-105853","1","","202","","1","1400","","100","Cash","","2020-02-04 22:28:53","2020-02-04 22:28:53");
INSERT INTO payments VALUES("260","ppr-20200204-110050","1","67","","","1","300","","0","Cash","","2020-02-04 22:30:50","2020-02-04 22:30:50");
INSERT INTO payments VALUES("261","spr-20200302-115414","1","","203","","1","350","","150","Cash","","2020-03-02 11:24:14","2020-03-02 11:24:14");
INSERT INTO payments VALUES("262","spr-20200302-115741","1","","204","","1","40","","10","Cash","","2020-03-02 11:27:41","2020-03-02 11:27:41");
INSERT INTO payments VALUES("263","ppr-20200302-115811","1","70","","","1","50","","0","Cash","","2020-03-02 11:28:11","2020-03-02 11:28:11");
INSERT INTO payments VALUES("264","ppr-20200302-115820","1","69","","","1","50","","0","Cash","","2020-03-02 11:28:20","2020-03-02 11:28:20");
INSERT INTO payments VALUES("265","spr-20200311-044642","1","","205","","1","352","","148","Cash","","2020-03-11 16:16:42","2020-03-11 16:16:42");
INSERT INTO payments VALUES("266","ppr-20200406-073823","1","71","","","1","2000","","1000","Cash","First Payment","2020-04-06 19:08:23","2020-04-06 19:08:55");
INSERT INTO payments VALUES("267","spr-20200406-074024","1","","207","","1","500","","500","Cash","","2020-04-06 19:10:24","2020-04-06 19:10:24");
INSERT INTO payments VALUES("268","spr-20200406-074201","1","","207","","1","144","","56","Cash","","2020-04-06 19:12:01","2020-04-06 19:12:01");
INSERT INTO payments VALUES("269","spr-20200506-105950","1","","208","","1","1540","","460","Cash","","2020-05-06 22:29:50","2020-05-06 22:29:50");
INSERT INTO payments VALUES("270","spr-20200609-124248","1","","209","","1","1220","","780","Cash","","2020-06-09 12:12:48","2020-06-09 12:12:48");
INSERT INTO payments VALUES("273","spr-20200703-063914","1","","212","","1","2585","","415","Cash","","2020-07-03 18:09:14","2020-07-03 18:09:14");
INSERT INTO payments VALUES("274","spr-20200712-095153","1","","213","","1","13","","37","Cash","","2020-07-12 21:21:53","2020-07-12 21:21:53");
INSERT INTO payments VALUES("276","spr-20200727-083808","1","","217","","1","385","","0","Cash","","2020-07-27 20:08:08","2020-07-27 20:08:08");
INSERT INTO payments VALUES("277","spr-20200727-084024","1","","218","","1","385","","0","Cash","","2020-07-27 20:10:24","2020-07-27 20:10:24");
INSERT INTO payments VALUES("278","spr-20200727-084645","1","","219","","1","385","","0","Cash","","2020-07-27 20:16:45","2020-07-27 20:16:45");
INSERT INTO payments VALUES("279","spr-20200812-062806","1","","220","","1","760","","240","Cash","","2020-08-12 17:58:06","2020-08-12 17:58:06");
INSERT INTO payments VALUES("280","ppr-20200812-062853","1","62","","","1","1650","","0","Cash","","2020-08-12 17:58:53","2020-08-12 17:58:53");
INSERT INTO payments VALUES("281","spr-20200812-063035","1","","221","","1","1100","","0","Cash","","2020-08-12 18:00:35","2020-08-12 18:00:35");
INSERT INTO payments VALUES("282","spr-20200816-100426","1","","222","","1","23000","","2000","Cash","","2020-08-16 21:34:26","2020-08-16 21:34:26");
INSERT INTO payments VALUES("283","spr-20200816-100523","1","","223","","1","300","","200","Cash","","2020-08-16 21:35:23","2020-08-16 21:35:23");
INSERT INTO payments VALUES("284","spr-20200816-100632","1","","223","","1","100","","0","Cash","","2020-08-16 21:36:32","2020-08-16 21:36:32");
INSERT INTO payments VALUES("285","spr-20200816-100735","1","","223","","1","40","","0","Cash","","2020-08-16 21:37:35","2020-08-16 21:37:35");
INSERT INTO payments VALUES("290","spr-20201017-092854","9","","230","2","1","200","","0","Cash","","2020-10-17 20:58:54","2020-10-18 10:18:54");
INSERT INTO payments VALUES("291","spr-20201018-105138","9","","230","2","1","50","","0","Cash","","2020-10-18 10:21:38","2020-10-18 10:21:38");
INSERT INTO payments VALUES("292","spr-20201018-111333","9","","231","2","1","100","","0","Cash","","2020-10-18 10:43:33","2020-10-18 10:43:33");
INSERT INTO payments VALUES("293","spr-20201018-111426","9","","231","2","1","50","","0","Gift Card","","2020-10-18 10:44:26","2020-10-18 10:44:26");
INSERT INTO payments VALUES("294","spr-20201018-111651","9","","231","2","1","50","","0","Credit Card","","2020-10-18 10:46:51","2020-10-18 10:46:51");
INSERT INTO payments VALUES("295","spr-20201018-111724","9","","231","2","1","50","","0","Cheque","","2020-10-18 10:47:24","2020-10-18 10:47:24");
INSERT INTO payments VALUES("296","spr-20201022-013018","9","","232","2","1","100","","0","Cash","","2020-10-22 13:00:18","2020-10-22 13:00:18");
INSERT INTO payments VALUES("297","spr-20201022-015606","1","","233","3","1","250","","0","Cash","","2020-10-22 13:26:06","2020-10-22 13:26:06");
INSERT INTO payments VALUES("298","spr-20201024-070508","1","","234","4","1","11500","","0","Cash","","2020-10-24 06:35:08","2020-10-24 06:35:08");
INSERT INTO payments VALUES("299","spr-20201024-070753","1","","235","4","1","250","","0","Cash","","2020-10-24 06:37:53","2020-10-24 06:37:53");
INSERT INTO payments VALUES("300","spr-20201024-034619","1","","237","4","1","61900","","0","Cash","","2020-10-24 15:16:19","2020-10-24 15:16:19");
INSERT INTO payments VALUES("302","spr-20201027-054004","1","","239","3","1","2","","0","Cash","","2020-10-27 05:10:04","2020-10-27 05:10:04");
INSERT INTO payments VALUES("303","spr-20201027-054207","1","","240","3","1","6","","0","Cash","","2020-10-27 05:12:07","2020-10-27 05:12:07");
INSERT INTO payments VALUES("304","spr-20201027-063202","1","","241","4","1","250","","0","Cash","","2020-10-27 06:02:02","2020-10-27 06:02:02");
INSERT INTO payments VALUES("305","spr-20201029-073033","1","","242","4","1","250","","0","Cash","","2020-10-29 07:00:33","2020-10-29 07:00:33");
INSERT INTO payments VALUES("306","spr-20201101-072115","1","","243","4","1","250","","0","Cash","","2020-11-01 06:51:15","2020-11-01 06:51:15");
INSERT INTO payments VALUES("307","spr-20201101-074225","1","","245","3","1","1130","","0","Cash","","2020-11-01 07:12:25","2020-11-01 07:12:25");
INSERT INTO payments VALUES("308","spr-20201101-075019","1","","246","4","1","440","","0","Cash","","2020-11-01 07:20:19","2020-11-01 07:20:19");
INSERT INTO payments VALUES("310","spr-20201106-013042","1","","250","4","1","378.4","","0","Cash","","2020-11-06 13:00:42","2020-11-06 13:00:42");
INSERT INTO payments VALUES("311","spr-20201109-011527","1","","251","4","1","500","","0","Cash","","2020-11-09 12:45:27","2020-11-09 12:45:27");
INSERT INTO payments VALUES("312","spr-20201111-055902","1","","252","3","1","229.5","","0","Cash","","2020-11-11 05:29:02","2020-11-11 05:29:02");
INSERT INTO payments VALUES("313","spr-20201114-064739","1","","253","4","1","10242.5","","0","Cash","","2020-11-14 06:17:39","2020-11-14 06:17:39");
INSERT INTO payments VALUES("316","spr-20201117-064751","1","","256","4","1","715","","0","Cash","","2020-11-17 06:17:51","2020-11-17 06:17:51");
INSERT INTO payments VALUES("317","spr-20201117-070920","1","","257","4","1","250","","0","Cash","","2020-11-17 06:39:20","2020-11-17 06:39:20");
INSERT INTO payments VALUES("320","ppr-20201118-062036","1","90","","","1","33000","","0","Cash","","2020-11-18 05:50:36","2020-11-18 05:50:36");
INSERT INTO payments VALUES("321","spr-20201118-065242","1","","258","4","1","27200","","0","Cash","","2020-11-18 06:22:42","2020-11-18 06:22:42");
INSERT INTO payments VALUES("324","spr-20201208-094000","1","","263","4","1","300","","200","Cash","","2020-12-08 09:10:00","2020-12-08 09:10:00");
INSERT INTO payments VALUES("325","spr-20210106-022350","1","","263","4","1","50","","0","Cash","","2021-01-06 13:53:50","2021-01-06 13:53:50");
INSERT INTO payments VALUES("330","spr-20210111-021625","1","","271","3","1","1274","","0","Cash","","2021-01-11 13:46:25","2021-01-11 13:46:25");
INSERT INTO payments VALUES("332","spr-20210113-070243","1","","274","4","1","1556","","0","Cash","","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO payments VALUES("333","spr-20210201-023748","1","","275","4","1","484","","0","Cash","","2021-02-01 14:07:48","2021-02-01 14:07:48");
INSERT INTO payments VALUES("335","spr-20210216-070948","1","","277","4","1","15156","","0","Cash","","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO payments VALUES("336","spr-20210217-073238","1","","278","4","1","26949.9","","0","Cash","","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO payments VALUES("338","spr-20210524-074506","1","","290","3","1","250","","0","Cash","","2021-05-24 19:15:06","2021-05-24 19:15:06");
INSERT INTO payments VALUES("339","spr-20210524-074647","1","","290","3","1","-130","","0","Cash","","2021-05-24 19:16:47","2021-05-24 19:16:47");
INSERT INTO payments VALUES("341","spr-20210601-123530","1","","294","4","1","440","","0","Cash","","2021-06-01 12:05:30","2021-06-01 12:05:30");
INSERT INTO payments VALUES("342","spr-20210601-032209","1","","295","3","1","2","","0","Cash","","2021-06-01 14:52:09","2021-06-01 14:52:09");
INSERT INTO payments VALUES("343","spr-20210601-034624","1","","296","3","1","2","","0","Cash","","2021-06-01 15:16:24","2021-06-01 15:16:24");
INSERT INTO payments VALUES("344","spr-20210601-074150","9","","297","2","1","250","","0","Cash","","2021-06-01 19:11:50","2021-06-01 19:11:50");
INSERT INTO payments VALUES("345","spr-20210601-075547","9","","298","2","1","2","","0","Cash","","2021-06-01 19:25:47","2021-06-01 19:25:47");
INSERT INTO payments VALUES("346","spr-20210616-105325","1","","299","4","1","1100","","0","Cash","","2021-06-16 10:23:25","2021-06-16 10:23:25");
INSERT INTO payments VALUES("347","spr-20210616-111044","1","","300","4","1","440","","0","Cash","","2021-06-16 10:40:44","2021-06-16 10:40:44");
INSERT INTO payments VALUES("348","spr-20210616-111120","1","","301","4","1","2200","","0","Cash","","2021-06-16 10:41:20","2021-06-16 10:41:20");
INSERT INTO payments VALUES("349","spr-20210616-080543","1","","303","4","1","440","2","0","Points","","2021-06-16 19:35:43","2021-06-16 19:35:43");
INSERT INTO payments VALUES("351","spr-20210616-082851","1","","305","4","1","440","","0","Cash","","2021-06-16 19:58:51","2021-06-16 19:58:51");
INSERT INTO payments VALUES("352","spr-20210617-115553","1","","306","3","1","1100","4","0","Points","","2021-06-17 11:25:53","2021-06-17 11:25:53");
INSERT INTO payments VALUES("353","spr-20210617-121359","1","","304","4","1","440","2","0","Points","","2021-06-17 11:43:59","2021-06-17 11:43:59");
INSERT INTO payments VALUES("354","spr-20210617-030013","1","","307","3","1","100","","0","Cash","","2021-06-17 14:30:13","2021-06-17 14:30:13");
INSERT INTO payments VALUES("355","ppr-20210618-082857","1","115","","","1","101","","0","Cash","","2021-06-18 19:58:57","2021-06-18 19:58:57");
INSERT INTO payments VALUES("356","spr-20210618-083127","1","","308","4","1","1608","","392","Cash","","2021-06-18 20:01:27","2021-06-18 20:01:27");
INSERT INTO payments VALUES("357","spr-20210618-083254","1","","309","3","1","2","","0","Cash","","2021-06-18 20:02:54","2021-06-18 20:02:54");
INSERT INTO payments VALUES("358","ppr-20210619-104903","1","116","","","1","101","","0","Cash","","2021-06-19 10:19:03","2021-06-19 10:19:03");
INSERT INTO payments VALUES("359","spr-20210619-105121","1","","310","4","1","958","","42","Cash","","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO payments VALUES("360","spr-20210619-110231","1","","312","4","1","440","2","0","Points","","2021-06-19 10:32:31","2021-06-19 10:32:31");
INSERT INTO payments VALUES("361","spr-20210619-110638","1","","313","4","1","250","1","0","Points","","2021-06-19 10:36:38","2021-06-19 10:36:38");
INSERT INTO payments VALUES("362","spr-20210627-124247","1","","314","4","1","1100","","0","Cash","","2021-06-27 12:12:47","2021-06-27 12:12:47");
INSERT INTO payments VALUES("364","spr-20210707-103455","1","","317","4","1","18","","0","Cash","","2021-07-07 10:04:55","2021-07-07 10:04:55");
INSERT INTO payments VALUES("367","spr-20210814-092805","1","","325","4","1","1250","","0","Cash","","2021-08-14 20:58:05","2021-08-14 20:58:05");
INSERT INTO payments VALUES("371","spr-20210921-010722","1","","333","4","1","2","","0","Cash","","2021-09-21 12:37:22","2021-09-21 12:37:22");
INSERT INTO payments VALUES("372","spr-20210921-035020","1","","334","4","1","120","","0","Cash","","2021-09-21 15:20:20","2021-09-21 15:20:20");
INSERT INTO payments VALUES("373","spr-20210923-024704","1","","335","4","1","11","","0","Cash","","2021-09-23 14:17:04","2021-09-23 14:17:04");
INSERT INTO payments VALUES("374","spr-20211003-051829","1","","336","4","1","1220","","0","Cash","","2021-10-03 16:48:29","2021-10-03 16:48:29");
INSERT INTO payments VALUES("376","spr-20211003-054404","1","","338","4","1","1100","","0","Cash","","2021-10-03 17:14:04","2021-10-03 17:14:04");
INSERT INTO payments VALUES("378","spr-20211007-025229","1","","340","4","1","1100","","0","Cash","","2021-10-07 14:22:29","2021-10-07 14:22:29");
INSERT INTO payments VALUES("379","spr-20211007-033840","1","","341","4","1","1100","","0","Cash","","2021-10-07 15:08:40","2021-10-07 15:08:40");
INSERT INTO payments VALUES("384","spr-20211014-035825","1","","348","4","1","1100","","0","Cash","","2021-10-14 15:28:25","2021-10-14 15:28:25");
INSERT INTO payments VALUES("385","spr-20211020-011209","1","","349","4","1","102","","0","Cash","","2021-10-20 12:42:09","2021-10-20 12:42:09");
INSERT INTO payments VALUES("386","spr-20211114-013929","1","","353","4","1","374","","0","Cash","","2021-11-14 13:09:29","2021-11-14 13:09:29");
INSERT INTO payments VALUES("387","spr-20211124-062858","1","","355","4","1","3161","","0","Cash","","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO payments VALUES("388","spr-20211207-070932","1","","356","4","1","573","","0","Cash","","2021-12-07 18:39:32","2021-12-07 18:39:32");



CREATE TABLE `payrolls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("8","payroll-20190101-055231","1","1","1","100","0","","2019-01-01 05:22:31","2019-01-01 05:22:31");
INSERT INTO payrolls VALUES("9","payroll-20191204-113802","1","1","1","10000","0","","2019-12-04 23:08:02","2019-12-04 23:08:02");
INSERT INTO payrolls VALUES("10","payroll-20210619-123706","1","1","1","200","0","","2021-06-19 12:07:06","2021-06-19 12:07:06");



CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("4","products-edit","web","2018-06-03 06:30:09","2018-06-03 06:30:09");
INSERT INTO permissions VALUES("5","products-delete","web","2018-06-04 04:24:22","2018-06-04 04:24:22");
INSERT INTO permissions VALUES("6","products-add","web","2018-06-04 06:04:14","2018-06-04 06:04:14");
INSERT INTO permissions VALUES("7","products-index","web","2018-06-04 09:04:27","2018-06-04 09:04:27");
INSERT INTO permissions VALUES("8","purchases-index","web","2018-06-04 13:33:19","2018-06-04 13:33:19");
INSERT INTO permissions VALUES("9","purchases-add","web","2018-06-04 13:42:25","2018-06-04 13:42:25");
INSERT INTO permissions VALUES("10","purchases-edit","web","2018-06-04 15:17:36","2018-06-04 15:17:36");
INSERT INTO permissions VALUES("11","purchases-delete","web","2018-06-04 15:17:36","2018-06-04 15:17:36");
INSERT INTO permissions VALUES("12","sales-index","web","2018-06-04 16:19:08","2018-06-04 16:19:08");
INSERT INTO permissions VALUES("13","sales-add","web","2018-06-04 16:19:52","2018-06-04 16:19:52");
INSERT INTO permissions VALUES("14","sales-edit","web","2018-06-04 16:19:52","2018-06-04 16:19:52");
INSERT INTO permissions VALUES("15","sales-delete","web","2018-06-04 16:19:53","2018-06-04 16:19:53");
INSERT INTO permissions VALUES("16","quotes-index","web","2018-06-05 03:35:10","2018-06-05 03:35:10");
INSERT INTO permissions VALUES("17","quotes-add","web","2018-06-05 03:35:10","2018-06-05 03:35:10");
INSERT INTO permissions VALUES("18","quotes-edit","web","2018-06-05 03:35:10","2018-06-05 03:35:10");
INSERT INTO permissions VALUES("19","quotes-delete","web","2018-06-05 03:35:10","2018-06-05 03:35:10");
INSERT INTO permissions VALUES("20","transfers-index","web","2018-06-05 04:00:03","2018-06-05 04:00:03");
INSERT INTO permissions VALUES("21","transfers-add","web","2018-06-05 04:00:03","2018-06-05 04:00:03");
INSERT INTO permissions VALUES("22","transfers-edit","web","2018-06-05 04:00:03","2018-06-05 04:00:03");
INSERT INTO permissions VALUES("23","transfers-delete","web","2018-06-05 04:00:03","2018-06-05 04:00:03");
INSERT INTO permissions VALUES("24","returns-index","web","2018-06-05 04:20:24","2018-06-05 04:20:24");
INSERT INTO permissions VALUES("25","returns-add","web","2018-06-05 04:20:24","2018-06-05 04:20:24");
INSERT INTO permissions VALUES("26","returns-edit","web","2018-06-05 04:20:25","2018-06-05 04:20:25");
INSERT INTO permissions VALUES("27","returns-delete","web","2018-06-05 04:20:25","2018-06-05 04:20:25");
INSERT INTO permissions VALUES("28","customers-index","web","2018-06-05 04:45:54","2018-06-05 04:45:54");
INSERT INTO permissions VALUES("29","customers-add","web","2018-06-05 04:45:55","2018-06-05 04:45:55");
INSERT INTO permissions VALUES("30","customers-edit","web","2018-06-05 04:45:55","2018-06-05 04:45:55");
INSERT INTO permissions VALUES("31","customers-delete","web","2018-06-05 04:45:55","2018-06-05 04:45:55");
INSERT INTO permissions VALUES("32","suppliers-index","web","2018-06-05 05:10:12","2018-06-05 05:10:12");
INSERT INTO permissions VALUES("33","suppliers-add","web","2018-06-05 05:10:12","2018-06-05 05:10:12");
INSERT INTO permissions VALUES("34","suppliers-edit","web","2018-06-05 05:10:12","2018-06-05 05:10:12");
INSERT INTO permissions VALUES("35","suppliers-delete","web","2018-06-05 05:10:12","2018-06-05 05:10:12");
INSERT INTO permissions VALUES("36","product-report","web","2018-06-25 04:35:33","2018-06-25 04:35:33");
INSERT INTO permissions VALUES("37","purchase-report","web","2018-06-25 04:54:56","2018-06-25 04:54:56");
INSERT INTO permissions VALUES("38","sale-report","web","2018-06-25 05:03:13","2018-06-25 05:03:13");
INSERT INTO permissions VALUES("39","customer-report","web","2018-06-25 05:06:51","2018-06-25 05:06:51");
INSERT INTO permissions VALUES("40","due-report","web","2018-06-25 05:09:52","2018-06-25 05:09:52");
INSERT INTO permissions VALUES("41","users-index","web","2018-06-25 05:30:10","2018-06-25 05:30:10");
INSERT INTO permissions VALUES("42","users-add","web","2018-06-25 05:30:10","2018-06-25 05:30:10");
INSERT INTO permissions VALUES("43","users-edit","web","2018-06-25 05:31:30","2018-06-25 05:31:30");
INSERT INTO permissions VALUES("44","users-delete","web","2018-06-25 05:31:30","2018-06-25 05:31:30");
INSERT INTO permissions VALUES("45","profit-loss","web","2018-07-15 03:20:05","2018-07-15 03:20:05");
INSERT INTO permissions VALUES("46","best-seller","web","2018-07-15 03:31:38","2018-07-15 03:31:38");
INSERT INTO permissions VALUES("47","daily-sale","web","2018-07-15 03:54:21","2018-07-15 03:54:21");
INSERT INTO permissions VALUES("48","monthly-sale","web","2018-07-15 04:00:41","2018-07-15 04:00:41");
INSERT INTO permissions VALUES("49","daily-purchase","web","2018-07-15 04:06:46","2018-07-15 04:06:46");
INSERT INTO permissions VALUES("50","monthly-purchase","web","2018-07-15 04:18:17","2018-07-15 04:18:17");
INSERT INTO permissions VALUES("51","payment-report","web","2018-07-15 04:40:41","2018-07-15 04:40:41");
INSERT INTO permissions VALUES("52","warehouse-stock-report","web","2018-07-15 04:46:55","2018-07-15 04:46:55");
INSERT INTO permissions VALUES("53","product-qty-alert","web","2018-07-15 05:03:21","2018-07-15 05:03:21");
INSERT INTO permissions VALUES("54","supplier-report","web","2018-07-30 08:30:01","2018-07-30 08:30:01");
INSERT INTO permissions VALUES("55","expenses-index","web","2018-09-05 06:37:10","2018-09-05 06:37:10");
INSERT INTO permissions VALUES("56","expenses-add","web","2018-09-05 06:37:10","2018-09-05 06:37:10");
INSERT INTO permissions VALUES("57","expenses-edit","web","2018-09-05 06:37:10","2018-09-05 06:37:10");
INSERT INTO permissions VALUES("58","expenses-delete","web","2018-09-05 06:37:11","2018-09-05 06:37:11");
INSERT INTO permissions VALUES("59","general_setting","web","2018-10-20 04:40:04","2018-10-20 04:40:04");
INSERT INTO permissions VALUES("60","mail_setting","web","2018-10-20 04:40:04","2018-10-20 04:40:04");
INSERT INTO permissions VALUES("61","pos_setting","web","2018-10-20 04:40:04","2018-10-20 04:40:04");
INSERT INTO permissions VALUES("62","hrm_setting","web","2019-01-02 16:00:23","2019-01-02 16:00:23");
INSERT INTO permissions VALUES("63","purchase-return-index","web","2019-01-03 03:15:14","2019-01-03 03:15:14");
INSERT INTO permissions VALUES("64","purchase-return-add","web","2019-01-03 03:15:14","2019-01-03 03:15:14");
INSERT INTO permissions VALUES("65","purchase-return-edit","web","2019-01-03 03:15:14","2019-01-03 03:15:14");
INSERT INTO permissions VALUES("66","purchase-return-delete","web","2019-01-03 03:15:14","2019-01-03 03:15:14");
INSERT INTO permissions VALUES("67","account-index","web","2019-01-03 03:36:13","2019-01-03 03:36:13");
INSERT INTO permissions VALUES("68","balance-sheet","web","2019-01-03 03:36:14","2019-01-03 03:36:14");
INSERT INTO permissions VALUES("69","account-statement","web","2019-01-03 03:36:14","2019-01-03 03:36:14");
INSERT INTO permissions VALUES("70","department","web","2019-01-03 04:00:01","2019-01-03 04:00:01");
INSERT INTO permissions VALUES("71","attendance","web","2019-01-03 04:00:01","2019-01-03 04:00:01");
INSERT INTO permissions VALUES("72","payroll","web","2019-01-03 04:00:01","2019-01-03 04:00:01");
INSERT INTO permissions VALUES("73","employees-index","web","2019-01-03 04:22:19","2019-01-03 04:22:19");
INSERT INTO permissions VALUES("74","employees-add","web","2019-01-03 04:22:19","2019-01-03 04:22:19");
INSERT INTO permissions VALUES("75","employees-edit","web","2019-01-03 04:22:19","2019-01-03 04:22:19");
INSERT INTO permissions VALUES("76","employees-delete","web","2019-01-03 04:22:19","2019-01-03 04:22:19");
INSERT INTO permissions VALUES("77","user-report","web","2019-01-16 12:18:18","2019-01-16 12:18:18");
INSERT INTO permissions VALUES("78","stock_count","web","2019-02-17 16:02:01","2019-02-17 16:02:01");
INSERT INTO permissions VALUES("79","adjustment","web","2019-02-17 16:02:02","2019-02-17 16:02:02");
INSERT INTO permissions VALUES("80","sms_setting","web","2019-02-22 10:48:03","2019-02-22 10:48:03");
INSERT INTO permissions VALUES("81","create_sms","web","2019-02-22 10:48:03","2019-02-22 10:48:03");
INSERT INTO permissions VALUES("82","print_barcode","web","2019-03-07 10:32:19","2019-03-07 10:32:19");
INSERT INTO permissions VALUES("83","empty_database","web","2019-03-07 10:32:19","2019-03-07 10:32:19");
INSERT INTO permissions VALUES("84","customer_group","web","2019-03-07 11:07:15","2019-03-07 11:07:15");
INSERT INTO permissions VALUES("85","unit","web","2019-03-07 11:07:15","2019-03-07 11:07:15");
INSERT INTO permissions VALUES("86","tax","web","2019-03-07 11:07:15","2019-03-07 11:07:15");
INSERT INTO permissions VALUES("87","gift_card","web","2019-03-07 11:59:38","2019-03-07 11:59:38");
INSERT INTO permissions VALUES("88","coupon","web","2019-03-07 11:59:38","2019-03-07 11:59:38");
INSERT INTO permissions VALUES("89","holiday","web","2019-10-19 14:27:15","2019-10-19 14:27:15");
INSERT INTO permissions VALUES("90","warehouse-report","web","2019-10-22 11:30:23","2019-10-22 11:30:23");
INSERT INTO permissions VALUES("91","warehouse","web","2020-02-26 12:17:32","2020-02-26 12:17:32");
INSERT INTO permissions VALUES("92","brand","web","2020-02-26 12:29:59","2020-02-26 12:29:59");
INSERT INTO permissions VALUES("93","billers-index","web","2020-02-26 12:41:15","2020-02-26 12:41:15");
INSERT INTO permissions VALUES("94","billers-add","web","2020-02-26 12:41:15","2020-02-26 12:41:15");
INSERT INTO permissions VALUES("95","billers-edit","web","2020-02-26 12:41:15","2020-02-26 12:41:15");
INSERT INTO permissions VALUES("96","billers-delete","web","2020-02-26 12:41:15","2020-02-26 12:41:15");
INSERT INTO permissions VALUES("97","money-transfer","web","2020-03-02 11:11:48","2020-03-02 11:11:48");
INSERT INTO permissions VALUES("98","category","web","2020-07-13 17:43:16","2020-07-13 17:43:16");
INSERT INTO permissions VALUES("99","delivery","web","2020-07-13 17:43:16","2020-07-13 17:43:16");
INSERT INTO permissions VALUES("100","send_notification","web","2020-10-31 11:51:31","2020-10-31 11:51:31");
INSERT INTO permissions VALUES("101","today_sale","web","2020-10-31 12:27:04","2020-10-31 12:27:04");
INSERT INTO permissions VALUES("102","today_profit","web","2020-10-31 12:27:04","2020-10-31 12:27:04");
INSERT INTO permissions VALUES("103","currency","web","2020-11-09 05:53:11","2020-11-09 05:53:11");
INSERT INTO permissions VALUES("104","backup_database","web","2020-11-15 05:46:55","2020-11-15 05:46:55");
INSERT INTO permissions VALUES("105","reward_point_setting","web","2021-06-27 10:04:42","2021-06-27 10:04:42");
INSERT INTO permissions VALUES("106","pizzas-index","web","2022-02-04 11:55:18","2022-02-04 11:55:18");
INSERT INTO permissions VALUES("107","pizzas-add","web","2022-02-04 11:55:18","2022-02-04 11:55:18");
INSERT INTO permissions VALUES("108","pizzas-edit","web","2022-02-04 11:55:18","2022-02-04 11:55:18");
INSERT INTO permissions VALUES("109","pizzas-delete","web","2022-02-04 11:55:18","2022-02-04 11:55:18");
INSERT INTO permissions VALUES("110","orders-index","web","2022-02-08 14:39:47","2022-02-08 14:39:47");
INSERT INTO permissions VALUES("111","orders-add","web","2022-02-08 14:39:47","2022-02-08 14:39:47");
INSERT INTO permissions VALUES("112","orders-edit","web","2022-02-08 14:39:47","2022-02-08 14:39:47");
INSERT INTO permissions VALUES("113","orders-delete","web","2022-02-08 14:39:47","2022-02-08 14:39:47");



CREATE TABLE `pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int NOT NULL,
  `user_id` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pizzas VALUES("1","Mexican Green Wave","6816816","5","1","2022-02-04 17:08:58","2022-02-10 17:44:17");
INSERT INTO pizzas VALUES("2","Margherita","9689810","5","1","2022-02-04 17:41:06","2022-02-10 17:44:07");
INSERT INTO pizzas VALUES("3","Veggie Paradise","848484","5","1","2022-02-05 10:22:28","2022-02-10 17:43:53");
INSERT INTO pizzas VALUES("15","eavcaevev","656166641","3","1","2022-02-08 18:18:11","2022-02-10 17:43:40");
INSERT INTO pizzas VALUES("16","tnyfjytjjyj","43543543","5","1","2022-02-09 14:56:59","2022-02-10 17:43:16");
INSERT INTO pizzas VALUES("17","pizza name","123456","6","1","2022-02-10 11:51:55","2022-02-10 15:42:42");



CREATE TABLE `pos_setting` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `product_number` int NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `pos_setting_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_setting VALUES("1","11","2","1","4","0","pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB","sk_test_TtQQaawhEYRwa3mU9CzttrEy","2018-09-02 08:47:04","2020-04-17 19:29:54");



CREATE TABLE `product_adjustments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `batch_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_batches VALUES("1","71","1001","2023-05-31","16","2021-03-07 13:44:05","2021-12-07 19:11:55");
INSERT INTO product_batches VALUES("2","71","1002","2023-05-31","6","2021-03-07 14:25:06","2021-06-18 20:02:54");
INSERT INTO product_batches VALUES("3","71","1003","2023-09-30","2","2021-03-09 15:12:13","2021-09-21 15:19:37");
INSERT INTO product_batches VALUES("4","22","10001","2021-11-30","1","2021-10-20 13:17:09","2021-10-20 13:17:09");



CREATE TABLE `product_pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pizza_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_pizzas VALUES("79","17","86","2","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("80","17","85","300","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("81","17","84","1","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("82","17","82","1","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("83","17","80","500","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("84","17","83","1","2022-02-10 15:42:42","2022-02-10 15:42:42");
INSERT INTO product_pizzas VALUES("85","16","83","1","2022-02-10 17:43:16","2022-02-10 17:43:16");
INSERT INTO product_pizzas VALUES("86","16","78","100","2022-02-10 17:43:16","2022-02-10 17:43:16");
INSERT INTO product_pizzas VALUES("87","16","82","1","2022-02-10 17:43:16","2022-02-10 17:43:16");
INSERT INTO product_pizzas VALUES("88","16","81","500","2022-02-10 17:43:16","2022-02-10 17:43:16");
INSERT INTO product_pizzas VALUES("89","16","80","500","2022-02-10 17:43:16","2022-02-10 17:43:16");
INSERT INTO product_pizzas VALUES("90","15","83","1","2022-02-10 17:43:40","2022-02-10 17:43:40");
INSERT INTO product_pizzas VALUES("91","15","82","1","2022-02-10 17:43:40","2022-02-10 17:43:40");
INSERT INTO product_pizzas VALUES("92","15","81","500","2022-02-10 17:43:40","2022-02-10 17:43:40");
INSERT INTO product_pizzas VALUES("93","3","83","1","2022-02-10 17:43:53","2022-02-10 17:43:53");
INSERT INTO product_pizzas VALUES("94","3","82","1","2022-02-10 17:43:53","2022-02-10 17:43:53");
INSERT INTO product_pizzas VALUES("95","3","79","100","2022-02-10 17:43:53","2022-02-10 17:43:53");
INSERT INTO product_pizzas VALUES("96","3","80","300","2022-02-10 17:43:53","2022-02-10 17:43:53");
INSERT INTO product_pizzas VALUES("97","3","81","300","2022-02-10 17:43:53","2022-02-10 17:43:53");
INSERT INTO product_pizzas VALUES("98","2","83","1","2022-02-10 17:44:07","2022-02-10 17:44:07");
INSERT INTO product_pizzas VALUES("99","2","79","100","2022-02-10 17:44:07","2022-02-10 17:44:07");
INSERT INTO product_pizzas VALUES("100","2","82","1","2022-02-10 17:44:07","2022-02-10 17:44:07");
INSERT INTO product_pizzas VALUES("101","2","80","500","2022-02-10 17:44:07","2022-02-10 17:44:07");
INSERT INTO product_pizzas VALUES("102","2","78","100","2022-02-10 17:44:07","2022-02-10 17:44:07");
INSERT INTO product_pizzas VALUES("103","1","83","1","2022-02-10 17:44:17","2022-02-10 17:44:17");
INSERT INTO product_pizzas VALUES("104","1","78","200","2022-02-10 17:44:17","2022-02-10 17:44:17");
INSERT INTO product_pizzas VALUES("105","1","79","100","2022-02-10 17:44:17","2022-02-10 17:44:17");
INSERT INTO product_pizzas VALUES("106","1","80","500","2022-02-10 17:44:17","2022-02-10 17:44:17");
INSERT INTO product_pizzas VALUES("107","1","82","1","2022-02-10 17:44:17","2022-02-10 17:44:17");



CREATE TABLE `product_purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("2","1","84","","","","500","500","2","0","0","0","0","0","2022-02-10 14:48:51","2022-02-10 14:48:51");
INSERT INTO product_purchases VALUES("3","2","85","","","","10","10","1","100","0","0","0","1000","2022-02-10 15:19:11","2022-02-10 15:19:11");
INSERT INTO product_purchases VALUES("4","3","86","","","","5","5","5","2400","0","0","0","12000","2022-02-10 15:41:29","2022-02-10 15:41:29");
INSERT INTO product_purchases VALUES("5","1","78","","","","10","10","1","1000","0","0","0","10000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("6","1","79","","","","10","10","1","1000","0","0","0","10000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("7","1","80","","","","10","10","1","1000","0","0","0","10000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("8","1","81","","","","10","10","1","1000","0","0","0","10000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("9","1","82","","","","50","50","1","1000","0","0","0","50000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("10","1","83","","","","10","10","4","1440","0","0","0","14400","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("11","1","84","","","","10","10","2","0.12","0","0","0","1.2","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("12","1","85","","","","10","10","1","100","0","0","0","1000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("13","1","86","","","","10","10","5","2400","0","0","0","24000","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO product_purchases VALUES("14","2","84","","","","1000","1000","2","0.12","0","0","0","120","2022-02-10 18:12:45","2022-02-10 18:12:45");



CREATE TABLE `product_quotation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_quotation VALUES("2","1","1","","","1","2","5030","10","15","754.5","5784.5","2018-08-09 05:22:50","2018-08-28 05:39:57");
INSERT INTO product_quotation VALUES("3","1","4","","","50","1","1.5","25","10","7.5","82.5","2018-08-09 05:23:25","2018-08-28 06:04:36");
INSERT INTO product_quotation VALUES("4","1","2","","","6","1","9.55","0","10","5.73","63","2018-08-28 06:33:48","2018-08-28 06:37:07");
INSERT INTO product_quotation VALUES("5","2","10","","","2.5","7","22","0","0","0","55","2018-09-04 03:32:58","2018-09-20 16:07:41");
INSERT INTO product_quotation VALUES("6","2","13","","","1","0","21","0","0","0","21","2018-09-04 03:32:58","2018-09-04 03:32:58");
INSERT INTO product_quotation VALUES("7","3","1","","","1","1","400","0","10","40","440","2018-10-23 05:42:49","2019-12-21 12:11:37");
INSERT INTO product_quotation VALUES("19","3","48","","2","1","1","13","0","0","0","13","2019-12-07 14:20:02","2019-12-21 12:11:37");
INSERT INTO product_quotation VALUES("27","11","61","","","2","1","10000","0","15","3000","23000","2020-10-24 08:38:14","2020-10-24 08:58:35");
INSERT INTO product_quotation VALUES("28","12","3","","","10","1","250","0","0","0","2500","2020-12-10 05:04:01","2020-12-10 05:04:01");
INSERT INTO product_quotation VALUES("29","12","22","","","5","1","1200","0","10","600","6600","2020-12-10 05:04:01","2020-12-10 05:04:01");
INSERT INTO product_quotation VALUES("30","13","2","","","10","1","10.43","0","15","15.65","120","2021-01-12 12:28:03","2021-01-12 12:29:15");
INSERT INTO product_quotation VALUES("32","13","1","","","1","1","400","0","10","40","440","2021-01-12 12:28:03","2021-01-12 12:29:15");
INSERT INTO product_quotation VALUES("33","13","22","","","1","1","1000","0","10","100","1100","2021-01-12 12:29:15","2021-01-12 12:29:15");
INSERT INTO product_quotation VALUES("37","15","71","1","","1","1","2","0","0","0","2","2021-05-29 10:23:56","2021-05-30 13:34:07");
INSERT INTO product_quotation VALUES("38","15","1","","","1","1","400","0","10","40","440","2021-05-29 10:23:56","2021-05-30 13:34:07");



CREATE TABLE `product_returns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_returns VALUES("3","2","4","","","","20","1","2","0","0","0","40","","");
INSERT INTO product_returns VALUES("4","3","10","","","","2","7","22","0","0","0","44","","2018-10-07 07:49:40");
INSERT INTO product_returns VALUES("6","5","3","","","","1","1","250","0","0","0","250","","2018-12-26 03:46:08");
INSERT INTO product_returns VALUES("12","6","1","","","","1","1","400","0","10","40","440","","");
INSERT INTO product_returns VALUES("23","11","13","","","","1","0","21","0","0","0","21","2019-12-24 10:50:29","2019-12-24 10:50:29");
INSERT INTO product_returns VALUES("26","13","61","","","","1","1","10000","0","15","1500","11500","2020-08-16 21:55:02","2020-08-16 21:55:02");
INSERT INTO product_returns VALUES("27","14","1","","","","1","1","400","0","10","40","440","2020-10-13 17:09:54","2020-10-13 17:09:54");
INSERT INTO product_returns VALUES("31","18","61","","","","1","1","10000","0","15","1500","11500","2020-11-18 06:32:18","2020-11-18 06:32:18");
INSERT INTO product_returns VALUES("32","19","3","","","","1","1","250","0","0","0","250","2020-12-10 06:10:25","2020-12-10 06:10:25");
INSERT INTO product_returns VALUES("43","25","71","1","","","1","1","2","0","0","0","2","2021-05-24 19:09:50","2021-05-24 19:09:50");



CREATE TABLE `product_sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","2","","","","1","2","104.35","0","15","15.65","120","2018-08-08 16:06:23","2018-08-08 16:43:27");
INSERT INTO product_sales VALUES("3","1","5","","","","2","1","115","10","0","0","230","2018-08-08 16:43:28","2018-08-08 16:43:28");
INSERT INTO product_sales VALUES("4","2","1","","","","10","1","420","0","10","420","4620","2018-08-09 05:24:53","2018-08-09 05:24:53");
INSERT INTO product_sales VALUES("5","2","4","","","","50","1","2.1","0","0","0","105","2018-08-09 05:24:53","2018-08-09 05:24:53");
INSERT INTO product_sales VALUES("6","2","2","","","","3","2","109.57","0","15","49.3","378","2018-08-09 05:24:53","2018-08-09 05:24:53");
INSERT INTO product_sales VALUES("7","3","4","","","","20","1","2.1","0","0","0","42","2018-08-09 06:02:15","2018-08-09 06:02:15");
INSERT INTO product_sales VALUES("8","3","5","","","","5","1","126","0","0","0","630","2018-08-09 06:02:15","2018-08-09 06:02:15");
INSERT INTO product_sales VALUES("9","3","3","","","","1","1","225","0","0","0","225","2018-08-09 06:02:15","2018-08-09 06:02:15");
INSERT INTO product_sales VALUES("10","4","1","","","","2","1","400","0","10","80","880","2018-08-25 03:18:37","2018-08-25 03:18:37");
INSERT INTO product_sales VALUES("12","6","13","","","","1","0","18.9","0","0","0","18.9","2018-08-26 09:18:36","2018-08-26 11:18:05");
INSERT INTO product_sales VALUES("13","7","1","","","","2","1","400","0","10","80","880","2018-08-27 07:05:45","2018-08-27 07:05:45");
INSERT INTO product_sales VALUES("14","8","5","","","","2","2","1440","0","10","288","3168","2018-09-02 05:09:54","2018-09-02 05:09:54");
INSERT INTO product_sales VALUES("15","9","4","","","","10","1","2","0","0","0","20","2018-09-03 03:03:14","2018-09-03 03:03:14");
INSERT INTO product_sales VALUES("16","10","3","","","","1","1","250","0","0","0","250","2018-09-03 04:31:39","2018-09-03 04:31:39");
INSERT INTO product_sales VALUES("17","11","22","","","","5","1","1000","0","10","500","5500","2018-09-03 09:38:21","2018-09-03 09:38:21");
INSERT INTO product_sales VALUES("18","12","22","","","","10","1","1050","0","10","1050","11550","2018-09-03 09:40:33","2018-09-03 09:40:33");
INSERT INTO product_sales VALUES("46","29","5","","","","1","1","120","0","0","0","120","2018-09-09 09:08:41","2018-09-09 09:08:41");
INSERT INTO product_sales VALUES("47","30","1","","","","1","1","400","0","10","40","440","2018-09-10 04:27:06","2018-09-20 14:42:38");
INSERT INTO product_sales VALUES("48","31","1","","","","1","1","400","0","10","40","440","2018-09-26 08:50:59","2018-09-26 08:51:25");
INSERT INTO product_sales VALUES("49","31","2","","","","1","2","104.35","0","15","15.65","120","2018-09-26 08:50:59","2018-09-26 08:51:25");
INSERT INTO product_sales VALUES("50","32","1","","","","1","1","400","0","10","40","440","2018-10-04 09:25:48","2018-10-04 09:25:48");
INSERT INTO product_sales VALUES("51","33","1","","","","1","1","400","0","10","40","440","2018-10-04 09:30:23","2018-10-04 09:30:23");
INSERT INTO product_sales VALUES("57","37","3","","","","1","1","250","0","0","0","250","2018-10-07 06:16:05","2018-10-07 06:16:05");
INSERT INTO product_sales VALUES("58","38","1","","","","1","1","400","0","10","40","440","2018-10-07 06:17:19","2018-10-07 06:17:19");
INSERT INTO product_sales VALUES("61","40","1","","","","1","1","400","0","10","40","440","2018-10-07 06:43:12","2018-10-07 06:43:12");
INSERT INTO product_sales VALUES("62","41","1","","","","1","1","400","0","10","40","440","2018-10-10 03:46:21","2018-10-10 03:46:21");
INSERT INTO product_sales VALUES("63","41","13","","","","1","0","21","0","0","0","21","2018-10-10 03:46:21","2018-10-10 03:46:21");
INSERT INTO product_sales VALUES("64","42","1","","","","1","1","400","0","10","40","440","2018-10-10 05:04:51","2018-10-10 05:04:51");
INSERT INTO product_sales VALUES("65","43","1","","","","1","1","400","0","10","40","440","2018-10-16 03:04:35","2018-10-16 03:04:35");
INSERT INTO product_sales VALUES("78","55","3","","","","1","1","250","0","0","0","250","2018-10-21 06:23:34","2018-10-21 06:23:34");
INSERT INTO product_sales VALUES("80","57","1","","","","1","1","400","0","10","40","440","2018-10-21 07:56:12","2018-10-21 07:56:12");
INSERT INTO product_sales VALUES("81","57","13","","","","2","0","21","0","0","0","42","2018-10-21 07:56:13","2018-10-21 07:56:13");
INSERT INTO product_sales VALUES("82","58","22","","","","1","1","1000","0","10","100","1100","2018-10-22 14:57:24","2018-10-22 14:57:24");
INSERT INTO product_sales VALUES("83","58","5","","","","1","1","120","0","0","0","120","2018-10-22 14:57:24","2018-10-22 14:57:24");
INSERT INTO product_sales VALUES("101","73","25","","","","3","1","1000","0","10","300","3300","2018-10-23 06:45:43","2018-10-23 06:45:43");
INSERT INTO product_sales VALUES("102","73","22","","","","2","1","1000","0","10","200","2200","2018-10-23 06:45:44","2018-10-23 06:45:44");
INSERT INTO product_sales VALUES("103","74","22","","","","1","1","1000","0","10","100","1100","2018-10-23 06:46:44","2018-10-23 06:46:44");
INSERT INTO product_sales VALUES("104","74","25","","","","1","1","1000","0","10","100","1100","2018-10-23 06:46:44","2018-10-23 06:46:44");
INSERT INTO product_sales VALUES("105","74","5","","","","1","1","120","0","0","0","120","2018-10-23 06:46:44","2018-10-23 06:46:44");
INSERT INTO product_sales VALUES("106","75","2","","","","3","2","104.35","0","15","46.96","360","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO product_sales VALUES("107","75","22","","","","2","1","1000","0","10","200","2200","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO product_sales VALUES("108","75","25","","","","3","1","1000","0","10","300","3300","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO product_sales VALUES("109","75","1","","","","2","1","400","0","10","80","880","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO product_sales VALUES("110","75","5","","","","2","1","120","0","0","0","240","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO product_sales VALUES("111","76","3","","","","1","1","250","0","0","0","250","2018-11-01 04:31:26","2018-11-03 08:58:56");
INSERT INTO product_sales VALUES("112","76","22","","","","1","1","1000","0","10","100","1100","2018-11-01 04:31:27","2018-11-03 08:58:56");
INSERT INTO product_sales VALUES("113","76","13","","","","4","0","21","0","0","0","84","2018-11-01 04:31:27","2018-11-03 08:58:56");
INSERT INTO product_sales VALUES("117","79","1","","","","4","1","400","0","10","160","1760","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("118","79","2","","","","7","2","104.35","0","15","109.57","840","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("119","79","3","","","","7","1","250","0","0","0","1750","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("120","79","4","","","","7","1","2","0","0","0","14","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("121","79","22","","","","8","1","1000","0","10","800","8800","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("122","79","13","","","","10","0","21","0","0","0","210","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("123","79","5","","","","9","1","120","0","0","0","1080","2018-11-05 08:45:17","2018-11-05 08:45:17");
INSERT INTO product_sales VALUES("124","80","2","","","","2","2","104.35","0","15","31.3","240","2018-11-05 08:49:58","2018-11-05 08:49:58");
INSERT INTO product_sales VALUES("125","80","3","","","","2","1","250","0","0","0","500","2018-11-05 08:49:58","2018-11-05 08:49:58");
INSERT INTO product_sales VALUES("126","80","1","","","","4","1","400","0","10","160","1760","2018-11-05 08:49:58","2018-11-05 08:49:58");
INSERT INTO product_sales VALUES("132","86","22","","","","1","1","1000","0","10","100","1100","2018-11-05 09:29:48","2018-11-05 09:29:48");
INSERT INTO product_sales VALUES("134","88","22","","","","1","1","1000","0","10","100","1100","2018-11-05 09:32:58","2018-11-05 09:32:58");
INSERT INTO product_sales VALUES("142","94","2","","","","1","2","104.35","0","15","15.65","120","2018-11-26 13:35:34","2018-11-26 13:35:34");
INSERT INTO product_sales VALUES("143","95","5","","","","3","1","120","0","0","0","360","2018-11-27 09:06:08","2018-11-27 09:06:08");
INSERT INTO product_sales VALUES("144","95","5","","","","3","1","120","0","0","0","360","2018-11-27 09:06:08","2018-11-27 09:06:08");
INSERT INTO product_sales VALUES("145","96","2","","","","1","2","104.35","0","15","15.65","120","2018-11-28 06:45:09","2018-11-28 06:45:09");
INSERT INTO product_sales VALUES("146","97","2","","","","2","2","104.35","0","15","31.3","240","2018-12-01 05:35:18","2018-12-01 05:35:18");
INSERT INTO product_sales VALUES("147","97","10","","","","1","7","22","0","0","0","22","2018-12-01 05:35:18","2018-12-01 05:35:18");
INSERT INTO product_sales VALUES("148","98","30","","","","2","1","100","0","0","0","200","2018-12-05 05:05:58","2018-12-05 05:05:58");
INSERT INTO product_sales VALUES("149","98","31","","","","2","1","300","0","0","0","600","2018-12-05 05:05:58","2018-12-05 05:05:58");
INSERT INTO product_sales VALUES("150","99","30","","","","2","1","100","0","0","0","200","2018-12-05 05:07:19","2018-12-05 05:07:19");
INSERT INTO product_sales VALUES("151","99","31","","","","2","1","300","0","0","0","600","2018-12-05 05:07:20","2018-12-05 05:07:20");
INSERT INTO product_sales VALUES("153","101","30","","","","1","1","100","0","0","0","100","2018-12-08 05:50:26","2018-12-08 05:50:26");
INSERT INTO product_sales VALUES("155","103","2","","","","1","2","104.35","0","15","15.65","120","2018-12-24 04:28:32","2018-12-24 04:28:32");
INSERT INTO product_sales VALUES("156","104","33","","","","4","1","2","0","0","0","8","2018-12-24 08:45:27","2018-12-25 03:25:23");
INSERT INTO product_sales VALUES("157","104","26","","","","2","0","1250","0","0","0","2500","2018-12-25 03:17:54","2018-12-25 03:25:23");
INSERT INTO product_sales VALUES("158","105","13","","","","1","0","21","0","0","0","21","2019-01-01 05:15:38","2019-01-01 05:15:38");
INSERT INTO product_sales VALUES("159","106","2","","","","1","2","104.35","0","15","15.65","120","2019-01-01 08:40:40","2019-01-01 08:40:40");
INSERT INTO product_sales VALUES("160","106","3","","","","2","1","250","0","0","0","500","2019-01-01 08:40:40","2019-01-01 08:40:40");
INSERT INTO product_sales VALUES("161","106","5","","","","2","1","120","0","0","0","240","2019-01-01 08:40:40","2019-01-01 08:40:40");
INSERT INTO product_sales VALUES("162","107","3","","","","2","1","250","0","0","0","500","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("163","107","5","","","","2","1","120","0","0","0","240","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("164","107","22","","","","2","1","1000","0","10","200","2200","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("165","107","25","","","","1","1","1000","0","10","100","1100","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("166","107","1","","","","2","1","400","0","10","80","880","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("167","107","2","","","","1","2","104.35","0","15","15.65","120","2019-01-03 06:26:27","2019-01-03 06:26:27");
INSERT INTO product_sales VALUES("168","108","2","","","","1","2","104.35","0","15","15.65","120","2019-01-20 15:28:24","2019-01-20 15:28:24");
INSERT INTO product_sales VALUES("169","109","1","","","","1","1","400","0","10","40","440","2019-01-29 09:44:43","2019-01-29 09:44:43");
INSERT INTO product_sales VALUES("170","109","30","","","","1","1","100","0","0","0","100","2019-01-29 09:44:43","2019-01-29 09:44:43");
INSERT INTO product_sales VALUES("171","110","31","","","","2","1","300","0","0","0","600","2019-01-29 11:20:41","2019-01-29 11:20:41");
INSERT INTO product_sales VALUES("172","110","25","","","","1","1","1000","0","10","100","1100","2019-01-29 11:20:41","2019-01-29 11:20:41");
INSERT INTO product_sales VALUES("173","111","3","","","","1","1","250","0","0","0","250","2019-01-31 10:38:39","2019-01-31 10:38:39");
INSERT INTO product_sales VALUES("174","111","13","","","","1","0","21","0","0","0","21","2019-01-31 10:38:39","2019-01-31 10:38:39");
INSERT INTO product_sales VALUES("175","112","1","","","","1","1","400","0","10","40","440","2019-02-02 10:10:45","2019-02-02 10:10:45");
INSERT INTO product_sales VALUES("176","113","3","","","","1","1","250","0","0","0","250","2019-02-02 11:11:17","2019-02-02 11:11:17");
INSERT INTO product_sales VALUES("177","113","30","","","","1","1","100","0","0","0","100","2019-02-02 11:11:17","2019-02-02 11:11:17");
INSERT INTO product_sales VALUES("178","114","1","","","","1","1","400","0","10","40","440","2019-02-05 14:34:45","2019-02-05 14:34:45");
INSERT INTO product_sales VALUES("183","118","1","","","","1","1","400","0","10","40","440","2019-02-07 10:45:42","2019-02-07 10:45:42");
INSERT INTO product_sales VALUES("185","120","1","","","","1","1","400","0","10","40","440","2019-02-07 11:10:37","2019-02-07 11:10:37");
INSERT INTO product_sales VALUES("186","121","3","","","","1","1","250","0","0","0","250","2019-02-09 10:18:14","2019-02-09 10:18:14");
INSERT INTO product_sales VALUES("187","121","2","","","","1","2","104.35","0","15","15.65","120","2019-02-09 10:18:14","2019-02-09 10:18:14");
INSERT INTO product_sales VALUES("188","121","4","","","","10","1","2","0","0","0","20","2019-02-09 10:18:15","2019-02-09 10:18:15");
INSERT INTO product_sales VALUES("189","121","13","","","","2","0","21","0","0","0","42","2019-02-09 10:18:15","2019-02-09 10:18:15");
INSERT INTO product_sales VALUES("190","121","1","","","","1","1","400","0","10","40","440","2019-02-09 10:18:15","2019-02-09 10:18:15");
INSERT INTO product_sales VALUES("191","121","31","","","","1","1","300","0","0","0","300","2019-02-09 10:18:15","2019-02-09 10:18:15");
INSERT INTO product_sales VALUES("192","121","30","","","","1","1","100","0","0","0","100","2019-02-09 10:18:15","2019-02-09 10:18:15");
INSERT INTO product_sales VALUES("194","123","1","","","","1","1","400","0","10","40","440","2019-02-19 14:02:14","2019-02-19 14:02:14");
INSERT INTO product_sales VALUES("198","127","31","","","","1","1","300","0","0","0","300","2019-03-03 10:10:10","2019-03-03 10:10:10");
INSERT INTO product_sales VALUES("199","127","25","","","","1","1","1000","0","10","100","1100","2019-03-03 10:10:10","2019-03-03 10:10:10");
INSERT INTO product_sales VALUES("200","127","22","","","","1","1","1000","0","10","100","1100","2019-03-03 10:10:10","2019-03-03 10:10:10");
INSERT INTO product_sales VALUES("201","128","1","","","","1","1","400","0","10","40","440","2019-04-04 09:25:55","2019-04-04 09:25:55");
INSERT INTO product_sales VALUES("202","128","2","","","","1","2","104.35","0","15","15.65","120","2019-04-04 09:25:55","2019-04-04 09:25:55");
INSERT INTO product_sales VALUES("203","129","5","","","","2","1","120","0","0","0","240","2019-04-04 09:29:37","2019-04-11 10:20:16");
INSERT INTO product_sales VALUES("204","130","1","","","","1","1","400","0","10","40","440","2019-04-21 11:51:24","2019-04-21 11:51:24");
INSERT INTO product_sales VALUES("205","130","2","","","","1","2","125.22","0","15","18.78","144","2019-04-21 11:51:24","2019-04-21 11:51:24");
INSERT INTO product_sales VALUES("206","130","4","","","","1","1","2","0","0","0","2","2019-04-21 11:51:24","2019-04-21 11:51:24");
INSERT INTO product_sales VALUES("207","131","1","","","","1","1","400","0","10","40","440","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO product_sales VALUES("208","131","3","","","","1","1","250","0","0","0","250","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO product_sales VALUES("209","131","25","","","","1","1","1000","0","10","100","1100","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO product_sales VALUES("210","131","22","","","","1","1","1000","0","10","100","1100","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO product_sales VALUES("211","132","1","","","","1","1","400","0","10","40","440","2019-06-13 09:46:37","2019-06-13 09:46:37");
INSERT INTO product_sales VALUES("212","132","30","","","","1","1","100","0","0","0","100","2019-06-13 09:46:37","2019-06-13 09:46:37");
INSERT INTO product_sales VALUES("213","132","31","","","","1","1","300","0","0","0","300","2019-06-13 09:46:37","2019-06-13 09:46:37");
INSERT INTO product_sales VALUES("214","133","3","","","","2","1","250","0","0","0","500","2019-06-13 09:47:51","2019-06-13 09:47:51");
INSERT INTO product_sales VALUES("215","133","25","","","","1","1","1000","0","10","100","1100","2019-06-13 09:47:52","2019-06-13 09:47:52");
INSERT INTO product_sales VALUES("216","133","22","","","","1","1","1000","0","10","100","1100","2019-06-13 09:47:52","2019-06-13 09:47:52");
INSERT INTO product_sales VALUES("217","134","1","","","","1","1","400","0","10","40","440","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO product_sales VALUES("218","134","22","","","","1","1","1000","0","10","100","1100","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO product_sales VALUES("219","134","25","","","","1","1","1000","0","10","100","1100","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO product_sales VALUES("220","134","31","","","","1","1","300","0","0","0","300","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO product_sales VALUES("224","138","5","","","","1","1","120","0","0","0","120","2019-10-31 11:59:37","2019-10-31 11:59:37");
INSERT INTO product_sales VALUES("225","139","2","","","","2","2","125.22","0","15","37.57","288","2019-11-03 11:10:44","2019-11-03 11:10:44");
INSERT INTO product_sales VALUES("226","139","4","","","","100","1","2","0","0","0","200","2019-11-03 11:10:44","2019-11-03 11:10:44");
INSERT INTO product_sales VALUES("236","144","22","","","","1","1","1000","0","10","100","1100","2019-11-09 19:11:31","2019-11-09 19:11:31");
INSERT INTO product_sales VALUES("237","144","5","","","","1","1","120","0","0","0","120","2019-11-09 19:11:31","2019-11-09 19:11:31");
INSERT INTO product_sales VALUES("241","147","22","","","","1","1","1000","0","10","100","1100","2019-11-11 10:10:08","2019-11-11 10:10:08");
INSERT INTO product_sales VALUES("242","147","25","","","","1","1","1000","0","10","100","1100","2019-11-11 10:10:08","2019-11-11 10:10:08");
INSERT INTO product_sales VALUES("243","147","4","","","","10","1","2","0","0","0","20","2019-11-11 10:10:08","2019-11-11 10:10:08");
INSERT INTO product_sales VALUES("282","172","1","","","","1","1","400","0","10","40","440","2019-12-03 15:16:31","2019-12-03 15:16:31");
INSERT INTO product_sales VALUES("283","173","3","","","","1","1","225","0","0","0","225","2019-12-04 22:49:40","2019-12-04 22:49:40");
INSERT INTO product_sales VALUES("284","173","1","","","","1","1","360","0","10","36","396","2019-12-04 22:49:40","2019-12-04 22:49:40");
INSERT INTO product_sales VALUES("306","187","2","","","","2","2","125.22","0","15","37.57","288","2019-12-22 10:10:58","2019-12-22 10:10:58");
INSERT INTO product_sales VALUES("308","190","22","","","","1","1","1000","0","10","100","1100","2019-12-23 12:29:46","2019-12-23 12:29:46");
INSERT INTO product_sales VALUES("312","193","25","","","","1","1","1000","0","10","100","1100","2020-01-01 13:50:28","2020-01-01 13:50:28");
INSERT INTO product_sales VALUES("313","194","1","","","","2","1","400","0","10","80","880","2020-01-02 16:09:47","2020-01-02 16:09:47");
INSERT INTO product_sales VALUES("314","194","2","","","","1","1","10.43","0","15","1.57","12","2020-01-02 16:09:47","2020-01-02 16:09:47");
INSERT INTO product_sales VALUES("323","201","5","","","","1","1","120","0","0","0","120","2020-02-03 15:22:56","2020-02-03 15:22:56");
INSERT INTO product_sales VALUES("324","202","25","","","","1","1","1000","0","10","100","1100","2020-02-04 22:28:53","2020-02-04 22:28:53");
INSERT INTO product_sales VALUES("325","202","31","","","","1","1","300","0","0","0","300","2020-02-04 22:28:53","2020-02-04 22:28:53");
INSERT INTO product_sales VALUES("326","203","3","","","","1","1","250","0","0","0","250","2020-03-02 11:24:14","2020-03-02 11:24:14");
INSERT INTO product_sales VALUES("327","203","30","","","","1","1","100","0","0","0","100","2020-03-02 11:24:14","2020-03-02 11:24:14");
INSERT INTO product_sales VALUES("328","204","4","","","","20","1","2","0","0","0","40","2020-03-02 11:27:41","2020-03-02 11:27:41");
INSERT INTO product_sales VALUES("329","205","1","","","","1","1","400","0","10","40","440","2020-03-11 16:16:42","2020-03-11 16:16:42");
INSERT INTO product_sales VALUES("330","206","5","","","","1","1","120","0","0","0","120","2020-03-11 16:22:30","2020-03-11 16:24:04");
INSERT INTO product_sales VALUES("331","207","30","","","","2","1","100","0","0","0","200","2020-04-06 19:10:24","2020-04-06 19:11:11");
INSERT INTO product_sales VALUES("332","207","31","","","","1","1","300","0","0","0","300","2020-04-06 19:10:24","2020-04-06 19:11:11");
INSERT INTO product_sales VALUES("333","207","2","","","","1","2","125.22","0","15","18.78","144","2020-04-06 19:11:11","2020-04-06 19:11:11");
INSERT INTO product_sales VALUES("334","208","25","","","","1","1","1000","0","10","100","1100","2020-05-06 22:29:50","2020-05-06 22:29:50");
INSERT INTO product_sales VALUES("335","208","1","","","","1","1","400","0","10","40","440","2020-05-06 22:29:50","2020-05-06 22:29:50");
INSERT INTO product_sales VALUES("336","209","5","","","","1","1","120","0","0","0","120","2020-06-09 12:12:48","2020-06-09 12:12:48");
INSERT INTO product_sales VALUES("337","209","25","","","","1","1","1000","0","10","100","1100","2020-06-09 12:12:48","2020-06-09 12:12:48");
INSERT INTO product_sales VALUES("340","212","1","","","","1","1","350","0","10","35","385","2020-07-03 18:09:14","2020-07-03 18:09:14");
INSERT INTO product_sales VALUES("341","212","25","","","","1","1","1000","0","10","100","1100","2020-07-03 18:09:14","2020-07-03 18:09:14");
INSERT INTO product_sales VALUES("342","212","22","","","","1","1","1000","0","10","100","1100","2020-07-03 18:09:14","2020-07-03 18:09:14");
INSERT INTO product_sales VALUES("343","213","48","","2","","1","1","13","0","0","0","13","2020-07-12 21:21:53","2020-07-12 21:21:53");
INSERT INTO product_sales VALUES("344","214","3","","","","1","1","250","0","0","0","250","2020-07-14 11:23:41","2020-07-14 11:23:41");
INSERT INTO product_sales VALUES("347","217","1","","","","1","1","350","0","10","35","385","2020-07-27 20:08:08","2020-07-27 20:08:08");
INSERT INTO product_sales VALUES("348","218","1","","","","1","1","350","0","10","35","385","2020-07-27 20:10:24","2020-07-27 20:10:24");
INSERT INTO product_sales VALUES("349","219","1","","","","1","1","350","0","10","35","385","2020-07-27 20:16:45","2020-07-27 20:16:45");
INSERT INTO product_sales VALUES("350","220","31","","","","2","1","300","0","0","0","600","2020-08-12 17:58:04","2020-08-12 17:58:04");
INSERT INTO product_sales VALUES("351","220","33","","","","3","1","20","0","0","0","60","2020-08-12 17:58:04","2020-08-12 17:58:04");
INSERT INTO product_sales VALUES("352","220","30","","","","1","1","100","0","0","0","100","2020-08-12 17:58:04","2020-08-12 17:58:04");
INSERT INTO product_sales VALUES("353","221","25","","","","1","1","1000","0","10","100","1100","2020-08-12 18:00:35","2020-08-12 18:00:35");
INSERT INTO product_sales VALUES("354","222","61","","","","2","1","10000","0","15","3000","23000","2020-08-16 21:34:24","2020-08-16 21:34:24");
INSERT INTO product_sales VALUES("355","223","1","","","","1","1","400","0","10","40","440","2020-08-16 21:35:23","2020-08-16 21:35:23");
INSERT INTO product_sales VALUES("356","224","1","","","","3","1","390","30","10","117","1287","2020-08-26 19:31:39","2020-08-26 19:31:39");
INSERT INTO product_sales VALUES("362","230","3","","","","1","1","250","0","0","0","250","2020-10-17 20:58:52","2020-10-17 20:58:52");
INSERT INTO product_sales VALUES("363","231","1","","","","1","1","400","0","10","40","440","2020-10-18 10:43:33","2020-10-18 10:43:33");
INSERT INTO product_sales VALUES("364","232","30","","","","1","1","100","0","0","0","100","2020-10-22 13:00:14","2020-10-22 13:00:14");
INSERT INTO product_sales VALUES("365","233","3","","","","1","1","250","0","0","0","250","2020-10-22 13:26:04","2020-10-22 13:26:04");
INSERT INTO product_sales VALUES("366","234","61","","","","1","1","10000","0","15","1500","11500","2020-10-24 06:35:06","2020-10-24 06:35:06");
INSERT INTO product_sales VALUES("367","235","3","","","","1","1","250","0","0","0","250","2020-10-24 06:37:52","2020-10-24 06:37:52");
INSERT INTO product_sales VALUES("369","237","25","","","","2","1","1000","0","10","200","2200","2020-10-24 15:16:01","2020-10-24 15:16:01");
INSERT INTO product_sales VALUES("370","237","22","","","","2","1","1000","0","10","200","2200","2020-10-24 15:16:01","2020-10-24 15:16:01");
INSERT INTO product_sales VALUES("371","237","61","","","","5","1","10000","0","15","7500","57500","2020-10-24 15:16:01","2020-10-24 15:16:01");
INSERT INTO product_sales VALUES("373","239","60","","9","","1","1","2","0","0","0","2","2020-10-27 05:10:02","2020-10-27 05:10:02");
INSERT INTO product_sales VALUES("374","240","60","","9","","2","1","3","0","0","0","6","2020-10-27 05:12:06","2020-10-27 05:12:06");
INSERT INTO product_sales VALUES("375","241","3","","","","1","1","250","0","0","0","250","2020-10-27 06:02:00","2020-10-27 06:02:00");
INSERT INTO product_sales VALUES("376","242","3","","","","1","1","250","0","0","0","250","2020-10-29 07:00:30","2020-10-29 07:00:30");
INSERT INTO product_sales VALUES("377","243","3","","","","1","1","250","0","0","0","250","2020-11-01 06:51:12","2020-11-01 06:51:12");
INSERT INTO product_sales VALUES("380","245","1","","","","2","1","400","0","10","80","880","2020-11-01 07:12:23","2020-11-01 07:12:23");
INSERT INTO product_sales VALUES("381","245","3","","","","1","1","250","0","0","0","250","2020-11-01 07:12:23","2020-11-01 07:12:23");
INSERT INTO product_sales VALUES("382","246","1","","","","1","1","400","0","10","40","440","2020-11-01 07:20:18","2020-11-02 16:09:17");
INSERT INTO product_sales VALUES("386","250","1","","","","1","1","344","0","10","34.4","378.4","2020-11-06 13:00:41","2020-11-06 13:00:41");
INSERT INTO product_sales VALUES("387","251","1","","","","1","1","344","0","10","34.4","378.4","2020-11-09 12:45:24","2020-11-09 12:45:24");
INSERT INTO product_sales VALUES("388","251","3","","","","1","1","232.2","0","0","0","232.2","2020-11-09 12:45:24","2020-11-09 12:45:24");
INSERT INTO product_sales VALUES("389","252","3","","","","1","1","229.5","0","0","0","229.5","2020-11-11 05:28:58","2020-11-11 05:28:58");
INSERT INTO product_sales VALUES("390","253","3","","","","1","1","212.5","0","0","0","212.5","2020-11-14 06:17:36","2020-11-14 06:17:36");
INSERT INTO product_sales VALUES("391","253","31","","","","1","1","255","0","0","0","255","2020-11-14 06:17:36","2020-11-14 06:17:36");
INSERT INTO product_sales VALUES("392","253","61","","","","1","1","8500","0","15","1275","9775","2020-11-14 06:17:36","2020-11-14 06:17:36");
INSERT INTO product_sales VALUES("395","256","1","","","","1","1","400","0","10","40","440","2020-11-17 06:17:48","2020-11-17 06:17:48");
INSERT INTO product_sales VALUES("396","256","3","","","","1","1","250","0","10","25","275","2020-11-17 06:17:48","2020-11-17 06:17:48");
INSERT INTO product_sales VALUES("397","257","3","","","","1","1","250","0","0","0","250","2020-11-17 06:39:19","2020-11-17 06:39:19");
INSERT INTO product_sales VALUES("398","258","61","","","","3","1","10000","0","15","4500","34500","2020-11-18 06:22:39","2020-11-18 06:22:39");
INSERT INTO product_sales VALUES("402","262","61","","","","2","1","10000","0","15","3000","23000","2020-11-29 04:51:30","2020-11-29 04:51:30");
INSERT INTO product_sales VALUES("403","263","1","","","","1","1","400","0","10","40","440","2020-12-08 09:09:57","2020-12-08 09:09:57");
INSERT INTO product_sales VALUES("416","270","2","","","","1","3","250.43","0","15","37.57","288","2021-01-11 13:15:35","2021-01-11 13:28:44");
INSERT INTO product_sales VALUES("419","270","22","","","","1","1","1000","0","10","100","1100","2021-01-11 13:24:04","2021-01-11 13:28:44");
INSERT INTO product_sales VALUES("420","271","2","","","","1","2","125.22","0","15","18.78","144","2021-01-11 13:46:25","2021-01-11 13:46:25");
INSERT INTO product_sales VALUES("421","271","3","","","","1","1","250","0","0","0","250","2021-01-11 13:46:25","2021-01-11 13:46:25");
INSERT INTO product_sales VALUES("422","271","1","","","","2","1","400","0","10","80","880","2021-01-11 13:46:25","2021-01-11 13:46:25");
INSERT INTO product_sales VALUES("429","274","2","","","","10","1","10.43","0","15","15.65","120","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO product_sales VALUES("430","274","30","","","","1","1","100","0","0","0","100","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO product_sales VALUES("431","274","3","","","","2","1","250","0","0","0","500","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO product_sales VALUES("432","274","1","","","","2","1","380","40","10","76","836","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO product_sales VALUES("433","275","1","","","","1","1","400","0","10","40","440","2021-02-01 14:07:48","2021-02-01 14:07:48");
INSERT INTO product_sales VALUES("437","277","32","","","","1","1","10","0","0","0","10","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("438","277","48","","5","","1","1","53","0","0","0","53","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("439","277","48","","2","","1","1","13","0","0","0","13","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("440","277","48","","3","","1","1","3","0","0","0","3","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("441","277","61","","","","1","1","10000","0","15","1500","11500","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("442","277","31","","","","1","1","300","0","0","0","300","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("443","277","30","","","","1","1","100","0","0","0","100","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("444","277","25","","","","1","1","1000","0","10","100","1100","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("445","277","22","","","","1","1","1000","0","10","100","1100","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("446","277","13","","","","1","0","21","0","0","0","21","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("447","277","5","","","","1","1","120","0","0","0","120","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("448","277","4","","","","1","1","2","0","0","0","2","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("449","277","3","","","","1","1","250","0","0","0","250","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("450","277","2","","","","1","2","125.22","0","15","18.78","144","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("451","277","1","","","","1","1","400","0","10","40","440","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO product_sales VALUES("452","278","1","","","","1","1","400","0","10","40","440","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO product_sales VALUES("453","278","61","","","","2","1","10000","0","15","3000","23000","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO product_sales VALUES("454","278","22","","","","1","1","1000","0","10","100","1100","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO product_sales VALUES("455","278","3","","","","1","1","250","0","0","0","250","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO product_sales VALUES("456","278","5","","","","1","1","120","0","0","0","120","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO product_sales VALUES("457","279","71","1","","","2","1","2","0","0","0","4","2021-03-11 13:10:34","2021-03-11 13:10:34");
INSERT INTO product_sales VALUES("458","280","71","2","","","1","1","2","0","0","0","2","2021-03-17 03:44:11","2021-03-17 03:44:11");
INSERT INTO product_sales VALUES("459","282","71","1","","","1","1","2","0","0","0","2","2021-03-18 05:17:29","2021-03-20 10:29:57");
INSERT INTO product_sales VALUES("468","288","5","","","","1","1","120","0","0","0","120","2021-04-12 13:10:46","2021-04-12 13:10:46");
INSERT INTO product_sales VALUES("473","290","5","","","","1","1","120","0","0","0","120","2021-05-24 19:15:58","2021-05-24 19:15:58");
INSERT INTO product_sales VALUES("478","294","1","","","","1","1","400","0","10","40","440","2021-06-01 12:05:30","2021-06-01 12:05:30");
INSERT INTO product_sales VALUES("479","295","71","3","","","1","1","2","0","0","0","2","2021-06-01 14:52:09","2021-06-01 14:52:09");
INSERT INTO product_sales VALUES("480","296","71","1","","","1","1","2","0","0","0","2","2021-06-01 15:16:24","2021-06-01 15:16:24");
INSERT INTO product_sales VALUES("481","297","3","","","","1","1","250","0","0","0","250","2021-06-01 19:11:50","2021-06-01 19:11:50");
INSERT INTO product_sales VALUES("482","298","71","3","","","1","1","2","0","0","0","2","2021-06-01 19:25:47","2021-06-01 19:25:47");
INSERT INTO product_sales VALUES("483","299","22","","","","1","1","1000","0","10","100","1100","2021-06-16 10:23:25","2021-06-16 10:23:25");
INSERT INTO product_sales VALUES("484","300","1","","","","1","1","400","0","10","40","440","2021-06-16 10:40:33","2021-06-16 10:40:33");
INSERT INTO product_sales VALUES("485","301","22","","","","1","1","1000","0","10","100","1100","2021-06-16 10:41:11","2021-06-16 10:41:11");
INSERT INTO product_sales VALUES("486","301","25","","","","1","1","1000","0","10","100","1100","2021-06-16 10:41:11","2021-06-16 10:41:11");
INSERT INTO product_sales VALUES("487","302","1","","","","1","1","400","0","10","40","440","2021-06-16 19:34:52","2021-06-16 19:34:52");
INSERT INTO product_sales VALUES("488","303","1","","","","1","1","400","0","10","40","440","2021-06-16 19:35:43","2021-06-16 19:35:43");
INSERT INTO product_sales VALUES("489","304","1","","","","1","1","400","0","10","40","440","2021-06-16 19:36:34","2021-06-16 19:36:34");
INSERT INTO product_sales VALUES("490","305","1","","","","1","1","400","0","10","40","440","2021-06-16 19:58:42","2021-06-16 19:58:42");
INSERT INTO product_sales VALUES("491","306","22","","","","1","1","1000","0","10","100","1100","2021-06-17 11:25:53","2021-06-17 11:25:53");
INSERT INTO product_sales VALUES("492","307","22","","","","2","1","1000","0","10","200","2200","2021-06-17 11:53:49","2021-06-17 14:29:33");
INSERT INTO product_sales VALUES("493","308","2","","","","2","2","125.22","0","15","37.57","288","2021-06-18 20:01:27","2021-06-18 20:01:27");
INSERT INTO product_sales VALUES("494","308","1","","","","3","1","400","0","10","120","1320","2021-06-18 20:01:27","2021-06-18 20:01:27");
INSERT INTO product_sales VALUES("495","309","71","2","","","1","1","2","0","0","0","2","2021-06-18 20:02:54","2021-06-18 20:02:54");
INSERT INTO product_sales VALUES("496","310","71","","","","1","1","2","0","0","0","2","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("497","310","5","","","","1","1","120","0","0","0","120","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("498","310","4","","","","1","1","2","0","0","0","2","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("499","310","3","","","","1","1","250","0","0","0","250","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("500","310","2","","","","1","2","125.22","0","15","18.78","144","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("501","310","1","","","","1","1","400","0","10","40","440","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO product_sales VALUES("502","311","1","","","","1","1","400","0","10","40","440","2021-06-19 10:23:44","2021-06-19 10:23:44");
INSERT INTO product_sales VALUES("503","312","1","","","","1","1","400","0","10","40","440","2021-06-19 10:32:31","2021-06-19 10:32:31");
INSERT INTO product_sales VALUES("504","313","3","","","","1","1","250","0","0","0","250","2021-06-19 10:36:28","2021-06-19 10:36:28");
INSERT INTO product_sales VALUES("505","314","22","","","","1","1","1000","0","10","100","1100","2021-06-27 12:12:47","2021-06-27 12:12:47");
INSERT INTO product_sales VALUES("508","317","74","","","","1","0","18","0","0","0","18","2021-07-07 10:04:55","2021-07-07 10:04:55");
INSERT INTO product_sales VALUES("536","325","26","","","","2","0","1200","0","0","0","2400","2021-08-14 20:58:05","2021-08-14 21:04:27");
INSERT INTO product_sales VALUES("547","333","71","","","","1","1","2","0","0","0","2","2021-09-21 12:37:22","2021-09-21 12:37:22");
INSERT INTO product_sales VALUES("548","334","5","","","","1","1","120","0","0","0","120","2021-09-21 15:20:20","2021-09-21 15:20:20");
INSERT INTO product_sales VALUES("549","335","10","","","","0.5","7","22","0","0","0","11","2021-09-23 14:17:04","2021-09-23 14:17:04");
INSERT INTO product_sales VALUES("550","336","5","","","","1","1","120","0","0","0","120","2021-10-03 16:48:29","2021-10-03 16:48:29");
INSERT INTO product_sales VALUES("551","336","22","","","1103","1","1","1000","0","10","100","1100","2021-10-03 16:48:29","2021-10-03 16:48:29");
INSERT INTO product_sales VALUES("553","338","22","","","11103","1","1","1000","0","10","100","1100","2021-10-03 17:14:04","2021-10-03 17:14:04");
INSERT INTO product_sales VALUES("555","340","22","","","11104","1","1","1000","0","10","100","1100","2021-10-07 14:22:29","2021-10-07 14:22:29");
INSERT INTO product_sales VALUES("556","341","22","","","91101","1","1","1000","0","10","100","1100","2021-10-07 15:08:40","2021-10-07 15:08:40");
INSERT INTO product_sales VALUES("557","342","25","","","99901,99902","2","1","1000","0","10","200","2200","2021-10-09 11:42:42","2021-10-09 15:52:39");
INSERT INTO product_sales VALUES("558","342","5","","","","1","1","120","0","0","0","120","2021-10-09 15:52:39","2021-10-09 15:52:39");
INSERT INTO product_sales VALUES("559","343","22","","","1105,91102","2","1","1000","0","10","200","2200","2021-10-09 16:02:32","2021-10-09 16:02:32");
INSERT INTO product_sales VALUES("564","348","22","","","11101","1","1","1000","0","10","100","1100","2021-10-14 15:28:20","2021-10-14 15:28:20");
INSERT INTO product_sales VALUES("565","349","5","","","","1","1","102","0","0","0","102","2021-10-20 12:42:09","2021-10-20 12:42:09");
INSERT INTO product_sales VALUES("568","353","1","","","","1","1","340","0","10","34","374","2021-11-14 13:09:29","2021-11-14 13:09:29");
INSERT INTO product_sales VALUES("569","354","22","","","","1","1","1000","0","10","100","1100","2021-11-15 11:33:09","2021-11-15 11:33:09");
INSERT INTO product_sales VALUES("570","354","71","1","","","1","1","2","0","0","0","2","2021-11-15 11:33:09","2021-11-15 11:33:09");
INSERT INTO product_sales VALUES("571","354","1","","","","1","1","400","0","10","40","440","2021-11-15 11:33:09","2021-11-15 11:33:09");
INSERT INTO product_sales VALUES("572","355","25","","","","1","1","1000","0","10","100","1100","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO product_sales VALUES("573","355","22","","","","1","1","1000","0","10","100","1100","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO product_sales VALUES("574","355","13","","","","1","0","21","0","0","0","21","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO product_sales VALUES("575","355","3","","","","2","1","250","0","0","0","500","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO product_sales VALUES("576","355","1","","","","1","1","400","0","10","40","440","2021-11-24 17:58:58","2021-11-24 17:58:58");
INSERT INTO product_sales VALUES("577","356","48","","2","","1","1","13","0","0","0","13","2021-12-07 18:39:32","2021-12-07 18:39:32");
INSERT INTO product_sales VALUES("578","356","5","","","","1","1","120","0","0","0","120","2021-12-07 18:39:32","2021-12-07 18:39:32");
INSERT INTO product_sales VALUES("579","356","1","","","","1","1","400","0","10","40","440","2021-12-07 18:39:32","2021-12-07 18:39:32");



CREATE TABLE `product_transfer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_transfer VALUES("1","1","4","","","","100","1","1","0","0","100","2018-08-08 16:47:10","2018-12-25 03:46:55");
INSERT INTO product_transfer VALUES("7","6","48","","3","","1","1","2","0","0","2","2019-12-05 19:25:04","2019-12-05 19:39:42");
INSERT INTO product_transfer VALUES("11","8","5","","","","10","1","100","0","0","1000","2020-01-22 12:00:59","2020-01-22 12:00:59");
INSERT INTO product_transfer VALUES("13","10","1","","","","1","1","320","10","32","352","2020-10-08 12:57:35","2020-10-08 12:59:35");
INSERT INTO product_transfer VALUES("14","11","62","","12","","1","1","1","0","0","1","2020-10-18 17:47:08","2020-10-18 17:47:08");
INSERT INTO product_transfer VALUES("15","12","61","","","","10","1","3000","15","4500","34500","2020-10-24 08:31:46","2020-10-24 08:31:46");



CREATE TABLE `product_variants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `position` int NOT NULL,
  `item_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("3","48","3","1","S-93475396","","12","2019-11-21 12:33:04","2021-07-15 17:55:45");
INSERT INTO product_variants VALUES("5","48","5","3","L-93475396","50","11","2019-11-24 11:37:20","2021-12-07 18:31:11");
INSERT INTO product_variants VALUES("6","48","2","2","M-93475396","10","12","2019-11-24 12:47:07","2021-12-07 18:39:32");
INSERT INTO product_variants VALUES("10","60","9","1","a-32081679","","1","2020-05-18 22:14:14","2020-10-27 05:12:06");
INSERT INTO product_variants VALUES("11","60","11","2","b-32081679","","0","2020-05-18 22:28:31","2020-05-18 22:28:31");
INSERT INTO product_variants VALUES("12","62","12","1","variant 1-81145830","","3","2020-09-27 11:38:27","2021-02-11 06:58:16");
INSERT INTO product_variants VALUES("13","62","13","2","variant 2-81145830","","0","2020-09-27 11:38:27","2020-09-27 11:38:27");



CREATE TABLE `product_warehouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `warehouse_id` int NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouse VALUES("10","1","","","","1","133.5","","2018-08-08 14:00:12","2021-11-29 12:59:18");
INSERT INTO product_warehouse VALUES("11","2","","","","1","1368","","2018-08-08 14:00:12","2021-01-12 12:42:14");
INSERT INTO product_warehouse VALUES("12","3","","","","1","102","","2018-08-08 14:00:13","2021-11-29 12:59:18");
INSERT INTO product_warehouse VALUES("13","5","","","","1","79","","2018-08-08 14:00:13","2021-12-07 18:31:11");
INSERT INTO product_warehouse VALUES("14","4","","","","1","171","","2018-08-08 14:46:09","2020-03-02 11:26:03");
INSERT INTO product_warehouse VALUES("15","4","","","","2","119","","2018-08-08 16:46:15","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("16","2","","","","2","1789","","2018-08-08 16:56:49","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("17","1","","","","2","43.5","","2018-08-08 17:03:33","2021-12-07 19:11:55");
INSERT INTO product_warehouse VALUES("18","3","","","","2","47","","2018-08-09 05:17:23","2021-12-07 18:44:25");
INSERT INTO product_warehouse VALUES("19","5","","","","2","54","","2018-08-09 05:18:36","2021-12-07 18:39:32");
INSERT INTO product_warehouse VALUES("20","10","","","","1","50","","2018-08-09 05:19:29","2019-12-04 11:19:14");
INSERT INTO product_warehouse VALUES("21","10","","","","2","60.5","","2018-08-09 05:19:55","2021-09-23 14:17:04");
INSERT INTO product_warehouse VALUES("22","22","","","7001,11101,11102,11103,","1","29","","2018-09-03 09:36:09","2021-12-07 18:31:11");
INSERT INTO product_warehouse VALUES("23","22","","","","2","13","","2018-09-03 09:37:14","2021-11-29 12:52:53");
INSERT INTO product_warehouse VALUES("24","24","","","","2","0","","2018-09-16 03:19:30","2018-09-16 03:20:49");
INSERT INTO product_warehouse VALUES("25","25","","","","1","14","","2018-10-23 06:44:21","2019-03-02 15:36:10");
INSERT INTO product_warehouse VALUES("26","25","","","","2","5","","2018-10-23 06:44:41","2021-12-07 18:44:26");
INSERT INTO product_warehouse VALUES("27","31","","","","1","14","","2018-12-05 05:04:30","2021-01-10 06:34:28");
INSERT INTO product_warehouse VALUES("28","30","","","","1","14","","2018-12-05 05:04:30","2020-10-22 13:00:14");
INSERT INTO product_warehouse VALUES("29","31","","","","2","11","","2018-12-05 05:05:08","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("30","30","","","","2","10","","2018-12-05 05:05:08","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("31","32","","","","1","10","","2018-12-19 05:27:16","2019-02-09 10:15:23");
INSERT INTO product_warehouse VALUES("32","32","","","","2","19","","2018-12-19 05:27:41","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("33","33","","","","1","16","","2018-12-24 06:08:40","2019-03-03 10:09:17");
INSERT INTO product_warehouse VALUES("34","33","","","","2","22","","2019-02-09 09:51:38","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("35","48","","3","","1","2","","2019-11-25 19:53:02","2021-02-11 06:56:56");
INSERT INTO product_warehouse VALUES("36","48","","2","","1","4","","2019-11-26 12:17:42","2021-10-03 12:36:21");
INSERT INTO product_warehouse VALUES("37","48","","3","","2","9","","2019-11-26 13:42:08","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("38","48","","2","","2","8","","2019-11-26 13:42:08","2021-12-07 18:39:32");
INSERT INTO product_warehouse VALUES("39","48","","5","","1","2","","2019-12-21 15:48:51","2021-12-07 18:31:11");
INSERT INTO product_warehouse VALUES("40","48","","5","","2","9","","2019-12-22 14:06:39","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("45","61","","","","2","8","","2020-08-16 21:32:07","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("46","62","","12","","1","2","","2020-09-27 12:25:33","2020-11-16 14:31:45");
INSERT INTO product_warehouse VALUES("47","62","","12","","2","1","","2020-10-18 17:47:08","2021-02-11 06:58:16");
INSERT INTO product_warehouse VALUES("48","61","","","","1","8","","2020-10-24 08:31:46","2020-11-29 04:51:30");
INSERT INTO product_warehouse VALUES("49","60","","9","","1","1","","2020-10-26 16:04:05","2020-10-27 05:12:06");
INSERT INTO product_warehouse VALUES("51","71","1","","","1","19","","2021-03-07 13:44:05","2021-06-19 10:18:22");
INSERT INTO product_warehouse VALUES("52","71","1","","","2","4","","2021-03-07 13:51:16","2021-12-07 19:11:55");
INSERT INTO product_warehouse VALUES("53","71","2","","","1","3","","2021-03-07 14:25:06","2021-06-18 20:02:54");
INSERT INTO product_warehouse VALUES("54","71","3","","","1","2","","2021-03-09 15:12:13","2021-09-21 15:19:37");
INSERT INTO product_warehouse VALUES("55","71","2","","","2","0","","2021-05-23 12:39:03","2021-05-26 13:08:06");
INSERT INTO product_warehouse VALUES("56","72","","","","1","5","","2021-07-06 12:40:42","2021-07-06 12:40:42");
INSERT INTO product_warehouse VALUES("57","72","","","","2","4","","2021-07-06 12:41:07","2021-07-15 17:55:45");
INSERT INTO product_warehouse VALUES("58","22","4","","","1","1","","2021-10-20 13:17:09","2021-10-20 13:17:09");
INSERT INTO product_warehouse VALUES("59","81","","","","1","30","","2022-02-04 12:26:54","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("60","80","","","","1","30","","2022-02-04 12:26:54","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("61","82","","","","1","100","","2022-02-04 12:26:54","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("62","79","","","","1","20","","2022-02-04 12:26:54","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("63","78","","","","1","20","","2022-02-04 12:26:54","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("64","83","","","","1","288","","2022-02-10 11:50:38","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("65","84","","","","1","1.51","","2022-02-10 14:47:47","2022-02-10 18:12:45");
INSERT INTO product_warehouse VALUES("66","85","","","","1","20","","2022-02-10 15:19:11","2022-02-10 18:11:37");
INSERT INTO product_warehouse VALUES("67","86","","","","2","120","","2022-02-10 15:41:29","2022-02-10 15:41:29");
INSERT INTO product_warehouse VALUES("68","86","","","","1","240","","2022-02-10 18:11:37","2022-02-10 18:11:37");



CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `sale_unit_id` int NOT NULL,
  `cost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint DEFAULT NULL,
  `promotion_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `tax_method` int DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint DEFAULT NULL,
  `product_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("78","Mushroom","1234561","standard","C128","","9","1","1","2","1000","1000","8.6","5","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","","1","2022-02-04 12:14:35","2022-02-11 10:36:18");
INSERT INTO products VALUES("79","Black Olive","1234562","standard","C128","","9","1","1","2","1000","1000","8.7","5","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-04 12:15:47","2022-02-11 10:36:18");
INSERT INTO products VALUES("80","Mozzarella Cheese","1234563","standard","C128","","9","1","1","2","1000","1000","2.1","5","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-04 12:22:26","2022-02-11 10:36:18");
INSERT INTO products VALUES("81","Parmesan Cheese","1234564","standard","C128","","9","1","1","2","1000","1000","9.1","5","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-04 12:23:15","2022-02-11 10:36:18");
INSERT INTO products VALUES("82","Mayonnaise","1234565","standard","C128","","9","1","1","1","1000","1000","33","5","","","","","","1","zummXD2dvAtI.png","","","","0","","0","","","","","","1","2022-02-04 12:25:01","2022-02-11 10:36:18");
INSERT INTO products VALUES("83","Pizza Base","125487","standard","C128","","9","3","4","3","120","120","103","10","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-10 11:49:38","2022-02-11 10:36:18");
INSERT INTO products VALUES("84","onion","548784","standard","C128","","9","1","2","1","120","120","-2.99","10","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-10 14:47:13","2022-02-11 10:36:18");
INSERT INTO products VALUES("85","Garlic","54875454","standard","C128","","9","1","1","2","100","100","8.8","5","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-10 15:18:36","2022-02-11 10:36:18");
INSERT INTO products VALUES("86","Sauce","5618664","standard","C128","","9","3","5","4","100","100","144","1","","","","","","1","zummXD2dvAtI.png","","","","","","","","","","","","1","2022-02-10 15:40:48","2022-02-11 10:36:18");



CREATE TABLE `purchase_product_return` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_product_return VALUES("1","1","3","","","","1","1","200","0","0","0","200","","2019-12-07 16:49:03");



CREATE TABLE `purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20220210-061137","1","1","3","9","130","0","0","129401.2","0","0","","","129401.2","0","1","1","","","2022-02-10 18:11:37","2022-02-10 18:11:37");
INSERT INTO purchases VALUES("2","pr-20220210-061245","1","1","1","1","1000","0","0","120","0","0","","","120","0","1","1","","","2022-02-10 18:12:45","2022-02-10 18:12:45");



CREATE TABLE `quotations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES("1","qr-20180809-055250","1","1","3","3","1","3","57","35","767.73","5930","10","583","100","500","6913","2","","first quotation...","2018-08-09 05:22:50","2018-09-04 09:02:16");
INSERT INTO quotations VALUES("2","qr-20180904-040257","1","1","","1","1","2","3.5","0","0","76","0","0","1.6","2.7","77.1","1","","","2018-09-04 03:32:57","2018-09-21 12:35:57");
INSERT INTO quotations VALUES("3","qr-20181023-061249","9","1","3","11","1","2","2","0","40","453","0","0","0","0","453","2","","","2018-10-23 05:42:49","2019-12-21 12:11:36");
INSERT INTO quotations VALUES("11","qr-20201024-090814","1","1","","1","1","1","2","0","3000","23000","0","0","0","0","23000","1","","","2020-10-24 08:38:14","2020-10-24 08:58:35");
INSERT INTO quotations VALUES("12","qr-20201210-053401","1","1","1","19","2","2","15","0","600","9100","0","0","100","500","9500","1","","","2020-12-10 05:04:01","2020-12-10 05:04:01");
INSERT INTO quotations VALUES("13","qr-20210112-125803","1","1","","11","1","3","12","0","155.65","1660","0","0","0","0","1660","1","","","2021-01-12 12:28:03","2021-01-12 12:29:14");
INSERT INTO quotations VALUES("15","qr-20210529-105356","1","1","","11","2","2","2","0","40","442","0","0","0","0","442","1","","","2021-05-29 10:23:56","2021-05-30 13:34:07");



CREATE TABLE `return_purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `user_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO return_purchases VALUES("1","prr-20190101-090759","3","1","1","1","1","1","0","0","200","0","0","200","","","","2019-01-01 08:37:59","2019-12-07 16:49:03");



CREATE TABLE `returns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO returns VALUES("2","rr-20180809-055834","1","","1","1","1","1","1","20","0","0","40","10","4","44","","","","2018-08-09 05:28:34","2018-08-09 05:28:34");
INSERT INTO returns VALUES("3","rr-20180828-045527","1","","1","2","1","1","1","2","0","0","44","0","0","44","","","","2018-08-28 04:25:27","2018-09-20 16:33:47");
INSERT INTO returns VALUES("5","rr-20181007-082129","1","","11","2","2","1","1","1","0","0","250","0","0","250","","","","2018-10-07 07:51:29","2018-12-26 03:46:08");
INSERT INTO returns VALUES("6","rr-20190101-090630","9","","1","1","1","1","1","1","0","40","440","0","0","440","","","","2019-01-01 08:36:30","2019-01-01 08:36:30");
INSERT INTO returns VALUES("13","rr-20200816-102502","1","","1","2","2","1","1","1","0","1500","11500","0","0","11500","","","","2020-08-16 21:55:02","2020-08-16 21:55:02");
INSERT INTO returns VALUES("14","rr-20201013-053954","9","1","1","1","1","1","1","1","0","40","440","0","0","440","","","","2020-10-13 17:09:54","2020-10-13 17:09:54");
INSERT INTO returns VALUES("18","rr-20201118-070218","1","4","1","2","1","1","1","1","0","1500","11500","0","0","11500","","","","2020-11-18 06:32:18","2020-11-18 06:32:18");
INSERT INTO returns VALUES("19","rr-20201210-064025","1","3","19","1","1","1","1","1","0","0","250","0","0","250","","","","2020-12-10 06:10:25","2020-12-10 06:10:25");
INSERT INTO returns VALUES("25","rr-20210524-073950","1","3","1","1","1","1","1","1","0","0","2","0","0","2","","","","2021-05-24 19:09:50","2021-05-24 19:09:50");



CREATE TABLE `reward_point_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","300","1000","1","Year","1","2021-06-08 21:10:15","2021-06-27 10:50:55");



CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("4","1");
INSERT INTO role_has_permissions VALUES("5","1");
INSERT INTO role_has_permissions VALUES("6","1");
INSERT INTO role_has_permissions VALUES("7","1");
INSERT INTO role_has_permissions VALUES("8","1");
INSERT INTO role_has_permissions VALUES("9","1");
INSERT INTO role_has_permissions VALUES("10","1");
INSERT INTO role_has_permissions VALUES("11","1");
INSERT INTO role_has_permissions VALUES("12","1");
INSERT INTO role_has_permissions VALUES("13","1");
INSERT INTO role_has_permissions VALUES("14","1");
INSERT INTO role_has_permissions VALUES("15","1");
INSERT INTO role_has_permissions VALUES("16","1");
INSERT INTO role_has_permissions VALUES("17","1");
INSERT INTO role_has_permissions VALUES("18","1");
INSERT INTO role_has_permissions VALUES("19","1");
INSERT INTO role_has_permissions VALUES("20","1");
INSERT INTO role_has_permissions VALUES("21","1");
INSERT INTO role_has_permissions VALUES("22","1");
INSERT INTO role_has_permissions VALUES("23","1");
INSERT INTO role_has_permissions VALUES("24","1");
INSERT INTO role_has_permissions VALUES("25","1");
INSERT INTO role_has_permissions VALUES("26","1");
INSERT INTO role_has_permissions VALUES("27","1");
INSERT INTO role_has_permissions VALUES("28","1");
INSERT INTO role_has_permissions VALUES("29","1");
INSERT INTO role_has_permissions VALUES("30","1");
INSERT INTO role_has_permissions VALUES("31","1");
INSERT INTO role_has_permissions VALUES("32","1");
INSERT INTO role_has_permissions VALUES("33","1");
INSERT INTO role_has_permissions VALUES("34","1");
INSERT INTO role_has_permissions VALUES("35","1");
INSERT INTO role_has_permissions VALUES("36","1");
INSERT INTO role_has_permissions VALUES("37","1");
INSERT INTO role_has_permissions VALUES("38","1");
INSERT INTO role_has_permissions VALUES("39","1");
INSERT INTO role_has_permissions VALUES("40","1");
INSERT INTO role_has_permissions VALUES("41","1");
INSERT INTO role_has_permissions VALUES("42","1");
INSERT INTO role_has_permissions VALUES("43","1");
INSERT INTO role_has_permissions VALUES("44","1");
INSERT INTO role_has_permissions VALUES("45","1");
INSERT INTO role_has_permissions VALUES("46","1");
INSERT INTO role_has_permissions VALUES("47","1");
INSERT INTO role_has_permissions VALUES("48","1");
INSERT INTO role_has_permissions VALUES("49","1");
INSERT INTO role_has_permissions VALUES("50","1");
INSERT INTO role_has_permissions VALUES("51","1");
INSERT INTO role_has_permissions VALUES("52","1");
INSERT INTO role_has_permissions VALUES("53","1");
INSERT INTO role_has_permissions VALUES("54","1");
INSERT INTO role_has_permissions VALUES("55","1");
INSERT INTO role_has_permissions VALUES("56","1");
INSERT INTO role_has_permissions VALUES("57","1");
INSERT INTO role_has_permissions VALUES("58","1");
INSERT INTO role_has_permissions VALUES("59","1");
INSERT INTO role_has_permissions VALUES("60","1");
INSERT INTO role_has_permissions VALUES("61","1");
INSERT INTO role_has_permissions VALUES("62","1");
INSERT INTO role_has_permissions VALUES("63","1");
INSERT INTO role_has_permissions VALUES("64","1");
INSERT INTO role_has_permissions VALUES("65","1");
INSERT INTO role_has_permissions VALUES("66","1");
INSERT INTO role_has_permissions VALUES("67","1");
INSERT INTO role_has_permissions VALUES("68","1");
INSERT INTO role_has_permissions VALUES("69","1");
INSERT INTO role_has_permissions VALUES("70","1");
INSERT INTO role_has_permissions VALUES("71","1");
INSERT INTO role_has_permissions VALUES("72","1");
INSERT INTO role_has_permissions VALUES("73","1");
INSERT INTO role_has_permissions VALUES("74","1");
INSERT INTO role_has_permissions VALUES("75","1");
INSERT INTO role_has_permissions VALUES("76","1");
INSERT INTO role_has_permissions VALUES("77","1");
INSERT INTO role_has_permissions VALUES("78","1");
INSERT INTO role_has_permissions VALUES("79","1");
INSERT INTO role_has_permissions VALUES("80","1");
INSERT INTO role_has_permissions VALUES("81","1");
INSERT INTO role_has_permissions VALUES("82","1");
INSERT INTO role_has_permissions VALUES("83","1");
INSERT INTO role_has_permissions VALUES("84","1");
INSERT INTO role_has_permissions VALUES("85","1");
INSERT INTO role_has_permissions VALUES("86","1");
INSERT INTO role_has_permissions VALUES("87","1");
INSERT INTO role_has_permissions VALUES("88","1");
INSERT INTO role_has_permissions VALUES("89","1");
INSERT INTO role_has_permissions VALUES("90","1");
INSERT INTO role_has_permissions VALUES("91","1");
INSERT INTO role_has_permissions VALUES("92","1");
INSERT INTO role_has_permissions VALUES("93","1");
INSERT INTO role_has_permissions VALUES("94","1");
INSERT INTO role_has_permissions VALUES("95","1");
INSERT INTO role_has_permissions VALUES("96","1");
INSERT INTO role_has_permissions VALUES("97","1");
INSERT INTO role_has_permissions VALUES("98","1");
INSERT INTO role_has_permissions VALUES("99","1");
INSERT INTO role_has_permissions VALUES("100","1");
INSERT INTO role_has_permissions VALUES("101","1");
INSERT INTO role_has_permissions VALUES("102","1");
INSERT INTO role_has_permissions VALUES("103","1");
INSERT INTO role_has_permissions VALUES("104","1");
INSERT INTO role_has_permissions VALUES("105","1");
INSERT INTO role_has_permissions VALUES("106","1");
INSERT INTO role_has_permissions VALUES("107","1");
INSERT INTO role_has_permissions VALUES("108","1");
INSERT INTO role_has_permissions VALUES("109","1");
INSERT INTO role_has_permissions VALUES("110","1");
INSERT INTO role_has_permissions VALUES("111","1");
INSERT INTO role_has_permissions VALUES("112","1");
INSERT INTO role_has_permissions VALUES("113","1");
INSERT INTO role_has_permissions VALUES("4","2");
INSERT INTO role_has_permissions VALUES("5","2");
INSERT INTO role_has_permissions VALUES("6","2");
INSERT INTO role_has_permissions VALUES("7","2");
INSERT INTO role_has_permissions VALUES("8","2");
INSERT INTO role_has_permissions VALUES("9","2");
INSERT INTO role_has_permissions VALUES("10","2");
INSERT INTO role_has_permissions VALUES("11","2");
INSERT INTO role_has_permissions VALUES("12","2");
INSERT INTO role_has_permissions VALUES("13","2");
INSERT INTO role_has_permissions VALUES("14","2");
INSERT INTO role_has_permissions VALUES("15","2");
INSERT INTO role_has_permissions VALUES("16","2");
INSERT INTO role_has_permissions VALUES("17","2");
INSERT INTO role_has_permissions VALUES("18","2");
INSERT INTO role_has_permissions VALUES("19","2");
INSERT INTO role_has_permissions VALUES("20","2");
INSERT INTO role_has_permissions VALUES("21","2");
INSERT INTO role_has_permissions VALUES("22","2");
INSERT INTO role_has_permissions VALUES("23","2");
INSERT INTO role_has_permissions VALUES("24","2");
INSERT INTO role_has_permissions VALUES("25","2");
INSERT INTO role_has_permissions VALUES("26","2");
INSERT INTO role_has_permissions VALUES("27","2");
INSERT INTO role_has_permissions VALUES("28","2");
INSERT INTO role_has_permissions VALUES("29","2");
INSERT INTO role_has_permissions VALUES("30","2");
INSERT INTO role_has_permissions VALUES("31","2");
INSERT INTO role_has_permissions VALUES("32","2");
INSERT INTO role_has_permissions VALUES("33","2");
INSERT INTO role_has_permissions VALUES("34","2");
INSERT INTO role_has_permissions VALUES("35","2");
INSERT INTO role_has_permissions VALUES("36","2");
INSERT INTO role_has_permissions VALUES("37","2");
INSERT INTO role_has_permissions VALUES("38","2");
INSERT INTO role_has_permissions VALUES("39","2");
INSERT INTO role_has_permissions VALUES("40","2");
INSERT INTO role_has_permissions VALUES("41","2");
INSERT INTO role_has_permissions VALUES("42","2");
INSERT INTO role_has_permissions VALUES("43","2");
INSERT INTO role_has_permissions VALUES("44","2");
INSERT INTO role_has_permissions VALUES("45","2");
INSERT INTO role_has_permissions VALUES("46","2");
INSERT INTO role_has_permissions VALUES("47","2");
INSERT INTO role_has_permissions VALUES("48","2");
INSERT INTO role_has_permissions VALUES("49","2");
INSERT INTO role_has_permissions VALUES("50","2");
INSERT INTO role_has_permissions VALUES("51","2");
INSERT INTO role_has_permissions VALUES("52","2");
INSERT INTO role_has_permissions VALUES("53","2");
INSERT INTO role_has_permissions VALUES("54","2");
INSERT INTO role_has_permissions VALUES("55","2");
INSERT INTO role_has_permissions VALUES("56","2");
INSERT INTO role_has_permissions VALUES("57","2");
INSERT INTO role_has_permissions VALUES("58","2");
INSERT INTO role_has_permissions VALUES("59","2");
INSERT INTO role_has_permissions VALUES("60","2");
INSERT INTO role_has_permissions VALUES("61","2");
INSERT INTO role_has_permissions VALUES("62","2");
INSERT INTO role_has_permissions VALUES("63","2");
INSERT INTO role_has_permissions VALUES("64","2");
INSERT INTO role_has_permissions VALUES("65","2");
INSERT INTO role_has_permissions VALUES("66","2");
INSERT INTO role_has_permissions VALUES("67","2");
INSERT INTO role_has_permissions VALUES("68","2");
INSERT INTO role_has_permissions VALUES("69","2");
INSERT INTO role_has_permissions VALUES("70","2");
INSERT INTO role_has_permissions VALUES("71","2");
INSERT INTO role_has_permissions VALUES("72","2");
INSERT INTO role_has_permissions VALUES("73","2");
INSERT INTO role_has_permissions VALUES("74","2");
INSERT INTO role_has_permissions VALUES("75","2");
INSERT INTO role_has_permissions VALUES("76","2");
INSERT INTO role_has_permissions VALUES("77","2");
INSERT INTO role_has_permissions VALUES("78","2");
INSERT INTO role_has_permissions VALUES("79","2");
INSERT INTO role_has_permissions VALUES("80","2");
INSERT INTO role_has_permissions VALUES("81","2");
INSERT INTO role_has_permissions VALUES("82","2");
INSERT INTO role_has_permissions VALUES("83","2");
INSERT INTO role_has_permissions VALUES("84","2");
INSERT INTO role_has_permissions VALUES("85","2");
INSERT INTO role_has_permissions VALUES("86","2");
INSERT INTO role_has_permissions VALUES("87","2");
INSERT INTO role_has_permissions VALUES("88","2");
INSERT INTO role_has_permissions VALUES("89","2");
INSERT INTO role_has_permissions VALUES("90","2");
INSERT INTO role_has_permissions VALUES("91","2");
INSERT INTO role_has_permissions VALUES("92","2");
INSERT INTO role_has_permissions VALUES("93","2");
INSERT INTO role_has_permissions VALUES("94","2");
INSERT INTO role_has_permissions VALUES("95","2");
INSERT INTO role_has_permissions VALUES("96","2");
INSERT INTO role_has_permissions VALUES("97","2");
INSERT INTO role_has_permissions VALUES("98","2");
INSERT INTO role_has_permissions VALUES("99","2");
INSERT INTO role_has_permissions VALUES("100","2");
INSERT INTO role_has_permissions VALUES("101","2");
INSERT INTO role_has_permissions VALUES("102","2");
INSERT INTO role_has_permissions VALUES("103","2");
INSERT INTO role_has_permissions VALUES("104","2");
INSERT INTO role_has_permissions VALUES("105","2");
INSERT INTO role_has_permissions VALUES("106","2");
INSERT INTO role_has_permissions VALUES("107","2");
INSERT INTO role_has_permissions VALUES("108","2");
INSERT INTO role_has_permissions VALUES("109","2");
INSERT INTO role_has_permissions VALUES("4","4");
INSERT INTO role_has_permissions VALUES("6","4");
INSERT INTO role_has_permissions VALUES("7","4");
INSERT INTO role_has_permissions VALUES("8","4");
INSERT INTO role_has_permissions VALUES("9","4");
INSERT INTO role_has_permissions VALUES("12","4");
INSERT INTO role_has_permissions VALUES("13","4");
INSERT INTO role_has_permissions VALUES("20","4");
INSERT INTO role_has_permissions VALUES("21","4");
INSERT INTO role_has_permissions VALUES("22","4");
INSERT INTO role_has_permissions VALUES("24","4");
INSERT INTO role_has_permissions VALUES("25","4");
INSERT INTO role_has_permissions VALUES("28","4");
INSERT INTO role_has_permissions VALUES("29","4");
INSERT INTO role_has_permissions VALUES("55","4");
INSERT INTO role_has_permissions VALUES("56","4");
INSERT INTO role_has_permissions VALUES("57","4");
INSERT INTO role_has_permissions VALUES("63","4");
INSERT INTO role_has_permissions VALUES("64","4");



CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Admin","admin can access all data...","web","1","2018-06-02 05:16:44","2018-06-03 04:43:05");
INSERT INTO roles VALUES("2","Owner","Owner of shop...","web","1","2018-10-22 08:08:13","2018-10-22 08:08:13");
INSERT INTO roles VALUES("4","staff","staff has specific acess...","web","1","2018-06-02 05:35:27","2018-06-02 05:35:27");
INSERT INTO roles VALUES("5","Customer","","web","1","2020-11-05 12:13:16","2020-11-15 05:54:15");



CREATE TABLE `sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","sr-20180808-043622","1","","1","1","1","2","3","10","15.65","350","380","10","30","50","","","50","1","2","","0","ukgjkgjkgkj","gjkgjkgkujg","2018-08-08 16:06:22","2018-10-06 14:55:29");
INSERT INTO sales VALUES("2","sr-20180809-055453","1","","3","1","1","3","63","0","469.3","5103","5503","0","0","100","","","500","1","2","","2200","","","2018-08-09 05:24:53","2018-08-09 05:26:35");
INSERT INTO sales VALUES("3","posr-20180809-063214","1","","2","2","2","3","26","0","0","897","897","0","0","","","","","1","4","","897","","","2018-08-09 06:02:14","2018-08-09 06:02:14");
INSERT INTO sales VALUES("4","sr-20180825-034836","1","","1","1","1","1","2","0","80","880","880","0","0","","","","","1","2","","300","","","2018-08-25 03:18:36","2018-09-22 08:26:03");
INSERT INTO sales VALUES("6","sr-20180826-094836","1","","2","1","2","1","1","0","0","18.9","20","0","0","0","","","1.1","1","4","","20","","","2018-08-26 09:18:36","2018-08-26 11:18:05");
INSERT INTO sales VALUES("7","sr-20180827-073545","1","","1","1","1","1","2","0","80","880","880","0","0","","","","","1","4","","880","","","2018-08-27 07:05:45","2018-08-27 07:05:45");
INSERT INTO sales VALUES("8","posr-20180902-053954","1","","1","1","2","1","2","0","288","3168","3529.8","10","311.8","50","","","100","1","4","","3529.8","good customer","good customer","2018-09-02 05:09:54","2018-09-02 05:09:54");
INSERT INTO sales VALUES("9","posr-20180903-033314","1","","1","2","1","1","10","0","0","20","20","0","0","","","","","1","4","","20","","","2018-09-03 03:03:14","2018-09-03 03:03:14");
INSERT INTO sales VALUES("10","posr-20180903-050138","1","","11","2","1","1","1","0","0","250","250","0","0","","","","","1","2","","200","","","2018-09-03 04:31:38","2018-09-10 03:10:28");
INSERT INTO sales VALUES("11","posr-20180903-100821","1","","11","2","1","1","5","0","500","5500","5500","0","0","","","","","1","4","","5500","","","2018-09-03 09:38:21","2018-09-03 09:38:21");
INSERT INTO sales VALUES("12","sr-20180903-101026","1","","3","1","5","1","10","0","1050","11550","11550","0","0","","","","","1","2","","0","","","2018-09-03 09:40:26","2018-09-22 08:25:14");
INSERT INTO sales VALUES("29","sr-20180909-093841","1","","1","1","1","1","1","0","0","120","132","10","12","","","","","1","2","","0","","","2018-09-09 09:08:41","2018-10-06 08:06:52");
INSERT INTO sales VALUES("30","posr-20180910-045706","1","","11","2","1","1","1","0","40","440","440","0","0","0","","","0","1","2","","120","","","2018-09-10 04:27:06","2018-10-06 06:23:20");
INSERT INTO sales VALUES("31","posr-20180926-092059","1","","11","2","1","2","2","0","55.65","560","560","0","0","0","","","0","1","4","","560","","","2018-09-26 08:50:59","2018-09-26 08:51:25");
INSERT INTO sales VALUES("32","posr-20181004-095547","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2018-10-04 09:25:47","2018-10-04 09:25:47");
INSERT INTO sales VALUES("33","posr-20181004-100022","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2018-10-04 09:30:22","2018-10-04 09:30:22");
INSERT INTO sales VALUES("37","sr-20181007-064605","1","","1","1","1","1","1","0","0","250","250","0","0","","","","","1","2","","0","","","2018-10-07 06:16:05","2018-10-07 06:16:28");
INSERT INTO sales VALUES("38","posr-20181007-064719","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","","","2018-10-07 06:17:19","2018-10-07 08:47:02");
INSERT INTO sales VALUES("40","posr-20181007-071312","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","","","2018-10-07 06:43:12","2018-10-07 08:47:39");
INSERT INTO sales VALUES("41","posr-20181010-041621","1","","1","2","1","2","2","0","40","461","461","0","0","","","","","1","4","","461","","","2018-10-10 03:46:21","2018-10-10 03:46:21");
INSERT INTO sales VALUES("42","posr-20181010-053450","1","","1","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2018-10-10 05:04:50","2018-10-10 05:04:50");
INSERT INTO sales VALUES("43","sr-20181016-033434","1","","1","1","1","1","1","0","40","440","440","0","0","","","","","1","2","","0","sss
sss
s","","2018-10-16 03:04:34","2018-10-23 05:51:27");
INSERT INTO sales VALUES("55","posr-20181021-065334","1","","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2018-10-21 06:23:34","2018-10-21 06:23:34");
INSERT INTO sales VALUES("57","posr-20181021-082612","1","","11","2","1","2","3","0","40","482","575.2","10","43.2","50","","","100","1","4","","575.2","","","2018-10-21 07:56:12","2018-10-21 07:56:12");
INSERT INTO sales VALUES("58","posr-20181022-032723","1","","11","2","1","2","2","0","100","1220","1220","0","0","","","","","1","4","","1220","","","2018-10-22 14:57:23","2018-10-22 14:57:23");
INSERT INTO sales VALUES("73","posr-20181023-071543","11","","11","1","5","2","5","0","500","5500","5500","0","0","","","","","1","4","","5500","","","2018-10-23 06:45:43","2018-10-23 06:45:43");
INSERT INTO sales VALUES("74","posr-20181023-071644","1","","11","2","1","3","3","0","200","2320","2320","0","0","","","","","1","4","","2320","","","2018-10-23 06:46:44","2018-10-23 06:46:44");
INSERT INTO sales VALUES("75","posr-20181101-050027","1","","11","2","1","5","12","0","626.96","6980","7678","10","698","","","","","1","4","","7678","","","2018-11-01 04:30:27","2018-11-01 04:30:27");
INSERT INTO sales VALUES("76","posr-20181101-050126","1","","11","2","1","3","6","0","100","1434","1424","0","0","10","","","0","1","4","","1424","","","2018-11-01 04:31:26","2018-11-08 09:14:51");
INSERT INTO sales VALUES("79","posr-20181105-091516","1","","11","2","1","7","52","0","1069.57","14454","14454","0","0","","","","","1","4","","14454","","","2018-11-05 08:45:16","2018-11-05 08:45:16");
INSERT INTO sales VALUES("80","posr-20181105-091958","1","","11","2","1","3","8","0","191.3","2500","2500","0","0","","","","","1","4","","2500","","","2018-11-05 08:49:58","2018-11-05 08:49:58");
INSERT INTO sales VALUES("86","posr-20181105-095948","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2018-11-05 09:29:48","2018-11-05 09:29:48");
INSERT INTO sales VALUES("88","posr-20181105-100258","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2018-11-05 09:32:58","2018-11-05 09:32:58");
INSERT INTO sales VALUES("94","posr-20181126-020534","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2018-11-26 13:35:34","2018-11-26 13:35:34");
INSERT INTO sales VALUES("95","posr-20181127-093608","1","","11","2","1","1","3","0","0","360","360","0","0","","","","","1","2","","","","","2018-11-27 09:06:08","2018-11-27 09:06:08");
INSERT INTO sales VALUES("96","posr-20181128-071509","1","","11","2","1","1","1","0","15.65","120","132","10","12","","","","","1","4","","132","","","2018-11-28 06:45:09","2018-11-28 06:45:09");
INSERT INTO sales VALUES("97","posr-20181201-060518","1","","11","2","1","2","3","0","31.3","262","262","0","0","","","","","1","2","","200","","","2018-12-01 05:35:18","2018-12-04 05:51:05");
INSERT INTO sales VALUES("98","posr-20181205-053558","1","","11","2","1","2","4","0","0","800","800","0","0","","","","","1","4","","800","","","2018-12-05 05:05:58","2018-12-05 05:05:58");
INSERT INTO sales VALUES("99","posr-20181205-053719","1","","11","1","1","2","4","0","0","800","800","0","0","","","","","1","4","","800","","","2018-12-05 05:07:19","2018-12-05 05:07:19");
INSERT INTO sales VALUES("101","posr-20181208-062026","1","","11","2","1","1","1","0","0","100","100","0","0","","","","","1","4","","100","","","2018-12-08 05:50:26","2018-12-08 05:50:26");
INSERT INTO sales VALUES("103","posr-20181224-045832","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2018-12-24 04:28:32","2018-12-24 04:28:32");
INSERT INTO sales VALUES("104","sr-20181224-091527","1","","1","1","2","2","6","0","0","2508","2518","0","0","0","","","10","1","2","","","","","2018-12-24 08:45:27","2018-12-25 03:25:23");
INSERT INTO sales VALUES("105","posr-20190101-054538","1","","1","2","1","1","1","0","0","21","21","0","0","","","","","1","4","","21","","","2019-01-01 05:15:38","2019-01-01 05:15:38");
INSERT INTO sales VALUES("106","posr-20190101-091040","1","","11","2","1","3","5","0","15.65","860","860","0","0","","","","","1","4","","860","","","2019-01-01 08:40:40","2019-01-01 08:40:40");
INSERT INTO sales VALUES("107","posr-20190103-065626","1","","11","2","1","6","10","0","395.65","5040","5040","0","0","","","","","1","4","","5040","","","2019-01-03 06:26:26","2019-01-03 06:26:26");
INSERT INTO sales VALUES("108","posr-20190120-035824","1","","11","2","1","1","1","0","15.65","120","120","0","0","","","","","1","4","","120","","","2019-01-20 15:28:24","2019-01-20 15:28:24");
INSERT INTO sales VALUES("109","posr-20190129-101443","9","","11","1","5","2","2","0","40","540","540","0","0","","","","","1","4","","540","","","2019-01-29 09:44:43","2019-01-29 09:44:43");
INSERT INTO sales VALUES("110","posr-20190129-115041","9","","11","1","5","2","3","0","100","1700","1700","0","0","","","","","1","4","","1700","","","2019-01-29 11:20:41","2019-01-29 11:20:41");
INSERT INTO sales VALUES("111","posr-20190131-110839","9","","11","1","5","2","2","0","0","271","271","0","0","","","","","1","4","","271","","","2019-01-31 10:38:39","2019-01-31 10:38:39");
INSERT INTO sales VALUES("112","posr-20190202-104045","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-02 10:10:45","2019-02-02 10:10:45");
INSERT INTO sales VALUES("113","posr-20190202-114117","1","","11","2","1","2","2","0","0","350","350","0","0","","","","","1","4","","350","","","2019-02-02 11:11:17","2019-02-02 11:11:17");
INSERT INTO sales VALUES("114","posr-20190205-030445","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-05 14:34:45","2019-02-05 14:34:45");
INSERT INTO sales VALUES("118","posr-20190207-111542","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","3","2","","","","","2019-02-07 10:45:42","2019-02-07 10:45:42");
INSERT INTO sales VALUES("120","sr-20190207-114036","1","","1","1","2","1","1","0","40","440","440","0","0","","","","","1","2","","50","","","2019-02-07 11:10:36","2019-02-07 12:39:15");
INSERT INTO sales VALUES("121","posr-20190209-104814","1","","11","2","1","7","17","0","55.65","1272","1272","0","0","","","","","1","4","","1272","","","2019-02-09 10:18:14","2019-02-09 10:18:14");
INSERT INTO sales VALUES("123","posr-20190219-023214","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2019-02-19 14:02:14","2019-02-19 14:02:14");
INSERT INTO sales VALUES("127","posr-20190303-104010","1","","11","2","1","3","3","0","200","2500","2500","0","0","","","","","1","4","","2500","","","2019-03-03 10:10:10","2019-03-03 10:10:10");
INSERT INTO sales VALUES("128","posr-20190404-095555","1","","11","2","1","2","2","0","55.65","560","560","0","0","","","","","1","4","","560","","","2019-04-04 09:25:55","2019-04-04 09:25:55");
INSERT INTO sales VALUES("129","posr-20190404-095937","1","","11","2","1","1","2","0","0","240","240","0","0","0","","","0","1","2","","120","","","2019-04-04 09:29:37","2019-04-11 10:20:16");
INSERT INTO sales VALUES("130","posr-20190421-122124","1","","11","2","1","3","3","0","58.78","586","586","0","0","","","","","1","4","","586","","","2019-04-21 11:51:24","2019-04-21 11:51:24");
INSERT INTO sales VALUES("131","posr-20190528-103229","1","","11","2","1","4","4","0","240","2890","2890","0","0","","","","","1","4","","2890","","","2019-05-28 10:02:29","2019-05-28 10:02:29");
INSERT INTO sales VALUES("132","posr-20190613-101637","1","","11","2","1","3","3","0","40","840","840","0","0","","","","","1","4","","840","","","2019-06-13 09:46:37","2019-06-13 09:46:37");
INSERT INTO sales VALUES("133","posr-20190613-101751","1","","11","2","1","3","4","0","200","2700","2700","0","0","","","","","1","4","","2700","","","2019-06-13 09:47:51","2019-06-13 09:47:51");
INSERT INTO sales VALUES("134","posr-20191019-033028","1","","11","2","1","4","4","0","240","2940","2940","0","0","","","","","1","4","","2940","","","2019-10-19 15:00:28","2019-10-19 15:00:28");
INSERT INTO sales VALUES("138","sr-20191031-122937","1","","1","1","1","1","1","0","0","120","120","0","0","","","","","1","1","","","","","2019-10-31 11:59:37","2019-10-31 11:59:37");
INSERT INTO sales VALUES("139","posr-20191103-114044","1","","11","2","1","2","102","0","37.57","488","488","0","0","","","","","1","4","","488","","","2019-11-03 11:10:44","2019-11-03 11:10:44");
INSERT INTO sales VALUES("144","posr-20191109-074131","1","","11","2","1","2","2","0","100","1220","1220","0","0","0","","","0","1","4","","1220","","","2019-11-09 19:11:31","2019-11-09 19:11:31");
INSERT INTO sales VALUES("147","posr-20191111-104008","1","","11","2","1","3","12","0","200","2220","2220","0","0","","","","","1","4","","2220","","","2019-11-11 10:10:08","2019-11-11 10:10:08");
INSERT INTO sales VALUES("172","posr-20191203-034631","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","","","","2019-12-03 15:16:31","2019-12-03 15:16:31");
INSERT INTO sales VALUES("173","sr-20191204-111940","1","","2","1","1","2","2","0","36","621","621","0","0","","","","","1","4","","621","","","2019-12-04 22:49:40","2019-12-05 08:57:12");
INSERT INTO sales VALUES("187","posr-20191222-104058","1","","11","2","1","1","2","0","37.57","288","288","0","0","","","","","1","4","","288","","","2019-12-22 10:10:58","2019-12-22 10:10:58");
INSERT INTO sales VALUES("190","posr-20191223-125946","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2019-12-23 12:29:46","2019-12-23 12:29:46");
INSERT INTO sales VALUES("193","posr-20200101-022028","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2020-01-01 13:50:28","2020-01-01 13:50:28");
INSERT INTO sales VALUES("194","posr-20200102-043947","1","","11","2","1","2","3","0","81.57","892","892","0","0","","","","","1","4","","892","","","2020-01-02 16:09:47","2020-01-02 16:09:47");
INSERT INTO sales VALUES("201","posr-20200203-035256","1","","11","2","1","1","1","0","0","120","120","0","0","","","","","1","4","","120","","","2020-02-03 15:22:56","2020-02-03 15:22:56");
INSERT INTO sales VALUES("202","posr-20200204-105853","1","","11","2","1","2","2","0","100","1400","1400","0","0","","","","","1","4","","1400","","","2020-02-04 22:28:53","2020-02-04 22:28:53");
INSERT INTO sales VALUES("203","posr-20200302-115414","1","","11","2","1","2","2","0","0","350","350","0","0","","","","","1","4","","350","","","2020-03-02 11:24:14","2020-03-02 11:24:14");
INSERT INTO sales VALUES("204","posr-20200302-115741","1","","11","2","1","1","20","0","0","40","40","0","0","","","","","1","4","","40","","","2020-03-02 11:27:41","2020-03-02 11:27:41");
INSERT INTO sales VALUES("205","posr-20200311-044641","1","","11","2","1","1","1","0","40","440","352","0","0","","1","88","","1","4","","352","","","2020-03-11 16:16:42","2020-03-11 16:16:42");
INSERT INTO sales VALUES("206","sr-20200311-045230","1","","1","1","1","1","1","0","0","120","120","0","0","0","","","0","1","2","","","","","2020-03-11 16:22:30","2020-03-11 16:24:04");
INSERT INTO sales VALUES("207","posr-20200406-074024","1","","11","2","1","3","4","0","18.78","644","644","0","0","0","","","0","1","4","","644","","","2020-04-06 19:10:24","2020-04-06 19:12:01");
INSERT INTO sales VALUES("208","posr-20200506-105950","1","","11","2","1","2","2","0","140","1540","1540","0","0","","","","","1","4","","1540","","","2020-05-06 22:29:50","2020-05-06 22:29:50");
INSERT INTO sales VALUES("209","posr-20200609-124248","1","","11","2","1","2","2","0","100","1220","1220","0","0","","","","","1","4","","1220","","","2020-06-09 12:12:48","2020-06-09 12:12:48");
INSERT INTO sales VALUES("212","posr-20200703-063914","1","","11","2","1","3","3","0","235","2585","2585","0","0","","","","","1","4","","2585","","","2020-07-03 18:09:14","2020-07-03 18:09:14");
INSERT INTO sales VALUES("213","posr-20200712-095153","1","","11","2","1","1","1","0","0","13","13","0","0","","","","","1","4","","13","","","2020-07-12 21:21:53","2020-07-12 21:21:53");
INSERT INTO sales VALUES("214","posr-20200714-115341","1","","11","2","1","1","1","0","0","250","309.5","10","24.5","5","","","40","3","2","","","","","2020-07-14 11:23:41","2020-07-14 11:23:41");
INSERT INTO sales VALUES("217","posr-20200727-083808","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 20:08:08","2020-07-27 20:08:08");
INSERT INTO sales VALUES("218","posr-20200727-084024","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 20:10:24","2020-07-27 20:10:24");
INSERT INTO sales VALUES("219","posr-20200727-084644","1","","11","2","1","1","1","0","35","385","385","0","0","","","","","1","4","","385","","","2020-07-27 20:16:45","2020-07-27 20:16:45");
INSERT INTO sales VALUES("220","posr-20200812-062804","1","","11","2","1","3","6","0","0","760","760","0","0","","","","","1","4","","760","","","2020-08-12 17:58:04","2020-08-12 17:58:04");
INSERT INTO sales VALUES("221","posr-20200812-063035","1","","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2020-08-12 18:00:35","2020-08-12 18:00:35");
INSERT INTO sales VALUES("222","posr-20200816-100424","1","","11","2","1","1","2","0","3000","23000","23000","0","0","","","","","1","4","","23000","","","2020-08-16 21:34:24","2020-08-16 21:34:24");
INSERT INTO sales VALUES("223","posr-20200816-100523","1","","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2020-08-16 21:35:23","2020-08-16 21:37:35");
INSERT INTO sales VALUES("224","sr-20200826-080139","1","","1","1","1","1","3","30","117","1287","1287","0","0","","","","","1","1","","","","","2020-08-26 19:31:39","2020-08-26 19:31:39");
INSERT INTO sales VALUES("230","posr-20201017-092852","9","2","11","1","5","1","1","0","0","250","250","0","0","","","","","1","2","","350","","","2020-10-17 20:58:52","2020-10-18 10:21:38");
INSERT INTO sales VALUES("231","sr-20201018-111333","9","2","1","1","5","1","1","0","40","440","440","0","0","","","","","1","2","","250","","","2020-10-18 10:43:33","2020-10-18 10:47:24");
INSERT INTO sales VALUES("232","posr-20201022-013014","9","2","11","1","5","1","1","0","0","100","100","0","0","","","","","1","4","","100","","","2020-10-22 13:00:14","2020-10-22 13:00:14");
INSERT INTO sales VALUES("233","posr-20201022-015604","1","3","11","1","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-22 13:26:04","2020-10-22 13:26:04");
INSERT INTO sales VALUES("234","posr-20201024-070506","1","4","11","2","1","1","1","0","1500","11500","11500","0","0","","","","","1","4","","11500","","","2020-10-24 06:35:06","2020-10-24 06:35:06");
INSERT INTO sales VALUES("235","posr-20201024-070751","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-24 06:37:51","2020-10-24 06:37:51");
INSERT INTO sales VALUES("237","posr-20201024-034601","1","4","11","2","1","3","9","0","7900","61900","61900","0","0","","","","","1","4","","61900","","","2020-10-24 15:16:01","2020-10-24 15:16:01");
INSERT INTO sales VALUES("239","posr-20201027-054002","1","3","11","1","1","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2020-10-27 05:10:02","2020-10-27 05:10:02");
INSERT INTO sales VALUES("240","posr-20201027-054206","1","3","11","1","1","1","2","0","0","6","6","0","0","","","","","1","4","","6","","","2020-10-27 05:12:06","2020-10-27 05:12:06");
INSERT INTO sales VALUES("241","posr-20201027-063200","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-27 06:02:00","2020-10-27 06:02:00");
INSERT INTO sales VALUES("242","posr-20201029-073030","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-10-29 07:00:30","2020-10-29 07:00:30");
INSERT INTO sales VALUES("243","posr-20201101-072112","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-11-01 06:51:12","2020-11-01 06:51:12");
INSERT INTO sales VALUES("245","posr-20201101-074223","1","3","11","1","5","2","3","0","80","1130","1130","","0","0","","","0","1","4","","1130","","","2020-11-01 07:12:23","2020-11-01 07:12:23");
INSERT INTO sales VALUES("246","posr-20201101-075017","1","4","11","2","1","1","1","0","40","440","440","0","0","0","","","0","1","4","","440","ssss
ssas","hhhh
kkkk","2020-11-01 07:20:17","2020-11-02 16:09:17");
INSERT INTO sales VALUES("250","posr-20201106-013041","1","4","11","2","1","1","1","0","34.4","378.4","378.4","0","0","","","","","1","4","","378.4","","","2020-11-06 13:00:41","2020-11-06 13:00:41");
INSERT INTO sales VALUES("251","posr-20201109-011524","1","4","19","2","1","2","2","0","34.4","610.6","610.6","0","0","","","","","1","2","","500","","","2020-11-09 12:45:24","2020-11-09 12:45:24");
INSERT INTO sales VALUES("252","posr-20201111-055858","1","3","11","1","1","1","1","0","0","229.5","229.5","0","0","","","","","1","4","","229.5","","","2020-11-11 05:28:58","2020-11-11 05:28:58");
INSERT INTO sales VALUES("253","posr-20201114-064736","1","4","11","2","1","3","3","0","1275","10242.5","10242.5","0","0","","","","","1","4","","10242.5","","","2020-11-14 06:17:36","2020-11-14 06:17:36");
INSERT INTO sales VALUES("256","posr-20201117-064748","1","4","11","2","1","2","2","0","65","715","715","0","0","","","","","1","4","","715","","","2020-11-17 06:17:48","2020-11-17 06:17:48");
INSERT INTO sales VALUES("257","posr-20201117-070919","1","4","11","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2020-11-17 06:39:19","2020-11-17 06:39:19");
INSERT INTO sales VALUES("258","posr-20201118-065239","1","4","11","2","1","1","3","0","4500","34500","27200","0","0","600","1","6800","100","1","4","","27200","","","2020-11-18 06:22:39","2020-11-18 06:22:39");
INSERT INTO sales VALUES("262","1111","1","3","1","1","1","1","2","0","3000","23000","23000","0","0","0","","","0","1","1","","","","","2020-11-29 04:51:30","2020-11-29 04:51:30");
INSERT INTO sales VALUES("263","posr-20201208-093957","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","2","","350","","","2020-12-08 09:09:57","2021-01-06 13:53:50");
INSERT INTO sales VALUES("270","sr-20210111-014535","1","3","1","1","1","2","2","0","137.57","1388","1388","0","0","0","","","0","1","2","","","","","2021-01-11 13:15:35","2021-01-11 13:28:44");
INSERT INTO sales VALUES("271","posr-20210111-021625","1","3","19","1","2","3","4","0","98.78","1274","1274","0","0","","","","","1","4","","1274","","","2021-01-11 13:46:25","2021-01-11 13:46:25");
INSERT INTO sales VALUES("274","posr-20210113-070243","1","4","11","2","1","4","15","40","91.65","1556","1556","0","0","","","","","1","4","","1556","","","2021-01-13 06:32:43","2021-01-13 06:32:43");
INSERT INTO sales VALUES("275","posr-20210201-023748","1","4","11","2","1","1","1","0","40","440","484","10","44","","","","","1","4","","484","","","2021-02-01 14:07:48","2021-02-01 14:07:48");
INSERT INTO sales VALUES("277","posr-20210216-070948","1","4","11","2","1","15","15","0","1758.78","15156","15156","0","0","","","","","1","4","","15156","","","2021-02-16 06:39:48","2021-02-16 06:39:48");
INSERT INTO sales VALUES("278","posr-20210217-073238","1","4","11","2","1","5","6","0","3140","24910","26949.9","10","2440.9","501","","","100","1","4","","26949.9","","","2021-02-17 07:02:38","2021-02-17 07:02:38");
INSERT INTO sales VALUES("279","sr-20210311-014034","1","3","1","1","1","1","2","0","0","4","4","0","0","","","","","1","1","","","","","2021-03-11 13:10:34","2021-03-11 13:10:34");
INSERT INTO sales VALUES("280","sr-20210317-041411","1","3","1","1","1","1","1","0","0","2","2","0","0","","","","","1","1","","","","","2021-03-17 03:44:11","2021-03-17 03:44:11");
INSERT INTO sales VALUES("282","sr-20210318-054729","1","3","1","2","1","1","1","0","0","2","2","0","0","0","","","0","1","2","","","","","2021-03-18 05:17:29","2021-03-20 10:29:57");
INSERT INTO sales VALUES("288","sr-20210412-014046","1","3","11","1","1","1","1","0","0","120","120","0","0","","","","","1","1","","","","","2021-04-12 13:10:46","2021-04-12 13:10:46");
INSERT INTO sales VALUES("289","posr-20210524-071424","1","4","11","2","1","2","2","0","40","690","640","0","0","50","","","","1","4","","640","","","2021-05-24 18:44:24","2021-05-24 18:44:24");
INSERT INTO sales VALUES("290","sr-20210524-071512","1","3","1","1","1","1","1","0","0","120","120","0","0","0","","","0","1","4","","120","","","2021-05-24 18:45:12","2021-05-24 19:16:47");
INSERT INTO sales VALUES("294","posr-20210601-123530","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-01 12:05:30","2021-06-01 12:05:30");
INSERT INTO sales VALUES("295","posr-20210601-032209","1","3","11","1","1","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2021-06-01 14:52:09","2021-06-01 14:52:09");
INSERT INTO sales VALUES("296","posr-20210601-034624","1","3","11","1","1","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2021-06-01 15:16:24","2021-06-01 15:16:24");
INSERT INTO sales VALUES("297","posr-20210601-074150","9","2","11","1","5","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2021-06-01 19:11:50","2021-06-01 19:11:50");
INSERT INTO sales VALUES("298","posr-20210601-075547","9","2","11","1","5","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2021-06-01 19:25:47","2021-06-01 19:25:47");
INSERT INTO sales VALUES("299","posr-20210616-105325","1","4","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-06-16 10:23:25","2021-06-16 10:23:25");
INSERT INTO sales VALUES("300","posr-20210616-111033","1","4","19","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-16 10:40:33","2021-06-16 10:40:33");
INSERT INTO sales VALUES("301","posr-20210616-111111","1","4","19","2","1","2","2","0","200","2200","2200","0","0","","","","","1","4","","2200","","","2021-06-16 10:41:11","2021-06-16 10:41:11");
INSERT INTO sales VALUES("302","posr-20210616-080452","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-16 19:34:52","2021-06-16 19:34:52");
INSERT INTO sales VALUES("303","posr-20210616-080543","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-16 19:35:43","2021-06-16 19:35:43");
INSERT INTO sales VALUES("304","posr-20210616-080634","1","4","19","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-16 19:36:34","2021-06-17 11:43:59");
INSERT INTO sales VALUES("305","posr-20210616-082842","1","4","19","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-16 19:58:42","2021-06-16 19:58:42");
INSERT INTO sales VALUES("306","sr-20210617-115553","1","3","19","1","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-06-17 11:25:53","2021-06-17 11:25:53");
INSERT INTO sales VALUES("307","sr-20210617-122349","1","3","19","1","1","1","2","0","200","2200","2200","0","0","0","","","0","1","2","","100","","","2021-06-17 11:53:49","2021-06-17 14:30:13");
INSERT INTO sales VALUES("308","posr-20210618-083127","1","4","11","2","1","2","5","0","157.57","1608","1608","0","0","","","","","1","4","","1608","","","2021-06-18 20:01:27","2021-06-18 20:01:27");
INSERT INTO sales VALUES("309","posr-20210618-083254","1","3","11","1","1","1","1","0","0","2","2","0","0","","","","","1","4","","2","","","2021-06-18 20:02:54","2021-06-18 20:02:54");
INSERT INTO sales VALUES("310","posr-20210619-105121","1","4","11","2","1","6","6","0","58.78","958","958","0","0","","","","","1","4","","958","","","2021-06-19 10:21:21","2021-06-19 10:21:21");
INSERT INTO sales VALUES("311","sr-20210619-105344","1","5","11","1","1","1","1","0","40","440","440","0","0","","","","","1","1","","","","","2021-06-19 10:23:44","2021-06-19 10:23:44");
INSERT INTO sales VALUES("312","posr-20210619-110231","1","4","11","2","1","1","1","0","40","440","440","0","0","","","","","1","4","","440","","","2021-06-19 10:32:31","2021-06-19 10:32:31");
INSERT INTO sales VALUES("313","posr-20210619-110628","1","4","19","2","1","1","1","0","0","250","250","0","0","","","","","1","4","","250","","","2021-06-19 10:36:28","2021-06-19 10:36:28");
INSERT INTO sales VALUES("314","posr-20210627-124247","1","4","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-06-27 12:12:47","2021-06-27 12:12:47");
INSERT INTO sales VALUES("317","posr-20210707-103455","1","4","11","2","1","1","1","0","0","18","18","0","0","","","","","1","4","","18","","","2021-07-07 10:04:55","2021-07-07 10:04:55");
INSERT INTO sales VALUES("325","posr-20210814-092805","1","4","11","2","1","1","2","0","0","2400","2400","0","0","0","","","0","1","2","","1250","","","2021-08-14 20:58:05","2021-08-14 21:04:27");
INSERT INTO sales VALUES("333","posr-20210921-010722","1","4","11","2","1","1","1","0","0","2","2","","0","0","","","0","1","4","","2","","","2021-09-21 12:37:22","2021-09-21 12:37:22");
INSERT INTO sales VALUES("334","posr-20210921-035020","1","4","11","2","1","1","1","0","0","120","120","0","0","","","","","1","4","","120","","","2021-09-21 15:20:20","2021-09-21 15:20:20");
INSERT INTO sales VALUES("335","posr-20210923-024704","1","4","11","2","1","1","0.5","0","0","11","11","0","0","","","","","1","4","","11","","","2021-09-23 14:17:04","2021-09-23 14:17:04");
INSERT INTO sales VALUES("336","posr-20211003-051829","1","4","11","2","1","2","2","0","100","1220","1220","0","0","","","","","1","4","","1220","","","2021-10-03 16:48:29","2021-10-03 16:48:29");
INSERT INTO sales VALUES("338","posr-20211003-054404","1","4","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-10-03 17:14:04","2021-10-03 17:14:04");
INSERT INTO sales VALUES("340","posr-20211007-025229","1","4","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-10-07 14:22:29","2021-10-07 14:22:29");
INSERT INTO sales VALUES("341","posr-20211007-033840","1","4","11","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-10-07 15:08:40","2021-10-07 15:08:40");
INSERT INTO sales VALUES("342","sr-20211009-121242","1","4","11","2","1","2","3","0","200","2320","2320","0","0","0","","","0","1","2","","","","","2021-10-09 11:42:42","2021-10-09 15:52:39");
INSERT INTO sales VALUES("343","sr-20211009-043232","1","4","11","2","1","1","2","0","200","2200","2200","0","0","","","","","1","1","","","","","2021-10-09 16:02:32","2021-10-09 16:02:32");
INSERT INTO sales VALUES("348","posr-20211014-035820","1","4","19","2","1","1","1","0","100","1100","1100","0","0","","","","","1","4","","1100","","","2021-10-14 15:28:20","2021-10-14 15:28:20");
INSERT INTO sales VALUES("349","posr-20211020-011209","1","4","11","2","1","1","1","0","0","102","102","0","0","","","","","1","4","","102","","","2021-10-20 12:42:09","2021-10-20 12:42:09");
INSERT INTO sales VALUES("353","posr-20211114-013929","1","4","11","2","1","1","1","0","34","374","374","","0","0","","","0","1","4","","374","","","2021-11-14 13:09:29","2021-11-14 13:09:29");
INSERT INTO sales VALUES("354","sr-20211115-120309","1","4","11","2","1","3","3","0","140","1542","1542","0","0","0","","","0","1","1","","","","","2021-11-15 11:33:09","2021-11-15 11:33:09");
INSERT INTO sales VALUES("355","posr-20211124-062857","1","4","11","2","1","5","6","0","240","3161","3161","0","0","","","","","1","4","","3161","","","2021-11-24 17:58:57","2021-11-24 17:58:57");
INSERT INTO sales VALUES("356","posr-20211207-070932","1","4","11","2","1","3","3","0","40","573","573","0","0","","","","","1","4","","573","","","2021-12-07 18:39:32","2021-12-07 18:39:32");



CREATE TABLE `stock_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20190228-124939","2","","","1","full","20190228-124939.csv","","","0","2019-02-28 12:19:39","2019-02-28 12:19:39");



CREATE TABLE `suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","abdullah","globaltouch.jpg","global touch","","abdullah@globaltouch.com","231231","fsdfs","fsdfs","","","bd","1","2018-05-13 03:36:34","2019-12-21 16:28:47");
INSERT INTO suppliers VALUES("2","test","lion.jpg","lion","","lion@gmail.com","242","gfdg","fgd","","","","0","2018-05-30 05:29:41","2018-05-30 05:30:06");
INSERT INTO suppliers VALUES("3","ismail","","techbd","","ismail@test.com","23123123","mohammadpur","dhaka","","","bangladesh","1","2018-07-20 10:04:17","2018-07-20 10:04:17");
INSERT INTO suppliers VALUES("4","modon","mogaFruit.jpg","mogaFruit","","modon@gmail.com","32321","nasirabad","chittagong","","","bd","0","2018-09-01 10:00:07","2018-09-01 10:07:20");
INSERT INTO suppliers VALUES("5","sadman","","anda boda","dsa","asd@dsa.com","3212313","dadas","sdad","Other","1312","Australia","0","2020-06-22 15:18:33","2020-06-22 15:18:52");



CREATE TABLE `taxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","vat@10","10","1","2018-05-12 15:28:30","2019-03-02 17:16:10");
INSERT INTO taxes VALUES("2","vat@15","15","1","2018-05-12 15:28:43","2018-05-28 05:05:05");
INSERT INTO taxes VALUES("3","test","6","0","2018-05-28 05:02:54","2018-05-28 05:04:44");
INSERT INTO taxes VALUES("4","vat 20","20","1","2018-09-01 06:28:57","2018-09-01 06:28:57");



CREATE TABLE `transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL,
  `from_warehouse_id` int NOT NULL,
  `to_warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transfers VALUES("1","tr-20180808-051710","1","1","2","1","1","100","0","100","0","100","","","2018-08-08 16:47:10","2018-12-25 03:46:55");
INSERT INTO transfers VALUES("6","tr-20191205-075504","1","1","1","2","1","1","0","2","0","2","","","2019-12-05 19:25:04","2019-12-05 19:39:42");
INSERT INTO transfers VALUES("8","tr-20200122-123058","1","1","1","2","1","10","0","1000","","1000","","","2020-01-22 12:00:58","2020-01-22 12:00:58");
INSERT INTO transfers VALUES("10","tr-20201008-012735","9","1","1","2","1","1","32","352","0","352","","","2020-10-08 12:57:35","2020-10-08 12:59:35");
INSERT INTO transfers VALUES("11","tr-20201018-061708","9","1","1","2","1","1","0","1","","1","","","2020-10-18 17:47:08","2020-10-18 17:47:08");
INSERT INTO transfers VALUES("12","tr-20201024-090146","1","1","2","1","1","10","4500","34500","","34500","","","2020-10-24 08:31:46","2020-10-24 08:31:46");



CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int DEFAULT NULL,
  `operator` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","kg","kilogram","","*","1","1","2022-02-10 12:55:33","2022-02-10 12:55:33");
INSERT INTO units VALUES("2","gm","gram","1","/","1000","1","2022-02-10 12:55:57","2022-02-10 12:55:57");
INSERT INTO units VALUES("3","pc","piece","","*","1","1","2022-02-10 12:58:17","2022-02-10 12:58:17");
INSERT INTO units VALUES("4","dozen","dozen","3","*","12","1","2022-02-10 12:58:57","2022-02-10 12:58:57");
INSERT INTO units VALUES("5","cartoon","cartoon","3","*","24","1","2022-02-10 12:59:24","2022-02-10 12:59:24");



CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","admin","admin@gmail.com","$2y$10$DWAHTfjcvwCpOCXaJg11MOhsqns03uvlwiSUOQwkHL2YYrtrXPcL6","wZEnOlc7SOPuGNrBNYXS3NSRLE94fIiVfulJ9uroSPdpNl0Vat3H75sUMCqb","12112","lioncoders","1","","","1","0","2018-06-02 08:54:15","2018-09-05 05:44:15");
INSERT INTO users VALUES("3","dhiman da","dhiman@gmail.com","$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.","5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt","212","lioncoders","1","","","0","1","2018-06-14 03:30:31","2020-11-05 12:36:51");
INSERT INTO users VALUES("6","test","test@gmail.com","$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS","KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm","1234","212312","4","","","0","1","2018-06-23 08:35:33","2018-06-23 08:43:45");
INSERT INTO users VALUES("8","test","test@yahoo.com","$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC","","31231","","4","","","0","1","2018-06-25 04:05:49","2018-07-02 06:37:39");
INSERT INTO users VALUES("9","staff","anda@gmail.com","$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm","dLNcktdks0IxKepKusPC61sjhCPt6UXBhYwXwxbQe89o2ZOQBJo5YZ9oteEA","3123","","4","5","1","1","0","2018-07-02 06:38:08","2018-10-24 03:11:13");
INSERT INTO users VALUES("10","abul","abul@alpha.com","$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq","x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0","1234","anda","1","","","0","0","2018-09-08 05:14:48","2018-09-08 05:14:48");
INSERT INTO users VALUES("11","teststaff","a@a.com","$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li","DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp","111","aa","4","5","1","0","1","2018-10-22 08:17:56","2018-10-23 07:40:56");
INSERT INTO users VALUES("12","john","john@gmail.com","$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe","O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg","10001","","4","2","2","0","1","2018-12-30 06:18:37","2019-03-06 10:29:49");
INSERT INTO users VALUES("13","jjj","test@test.com","$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG","","1213","","1","","","0","1","2019-01-03 05:38:31","2019-03-03 09:32:29");
INSERT INTO users VALUES("19","shakalaka","shakalaka@gmail.com","$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2","","1212","Digital image","5","","","1","0","2020-11-09 05:37:16","2020-11-09 05:37:16");
INSERT INTO users VALUES("21","modon","modon@gmail.com","$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.","","2222","modon company","5","","","1","0","2020-11-13 12:42:08","2020-11-13 12:42:08");
INSERT INTO users VALUES("22","dhiman","dhiman@gmail.com","$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq","","+8801111111101","lioncoders","5","","","1","0","2020-11-15 11:44:58","2020-11-15 11:44:58");



CREATE TABLE `variants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO variants VALUES("2","Medium","2019-11-21 12:33:04","2019-11-24 14:13:52");
INSERT INTO variants VALUES("3","Small","2019-11-21 12:33:04","2019-11-24 14:13:52");
INSERT INTO variants VALUES("5","Large","2019-11-24 11:37:20","2019-11-24 14:14:56");
INSERT INTO variants VALUES("9","a","2020-05-18 22:14:14","2020-05-18 22:14:14");
INSERT INTO variants VALUES("11","b","2020-05-18 22:23:49","2020-05-18 22:23:49");
INSERT INTO variants VALUES("12","variant 1","2020-09-27 11:38:27","2020-09-27 11:38:27");
INSERT INTO variants VALUES("13","variant 2","2020-09-27 11:38:27","2020-09-27 11:38:27");
INSERT INTO variants VALUES("15","S","2020-11-16 11:39:33","2020-11-16 11:39:33");
INSERT INTO variants VALUES("16","M","2020-11-16 11:39:33","2020-11-16 11:39:33");
INSERT INTO variants VALUES("17","L","2020-11-16 11:39:33","2020-11-16 11:39:33");



CREATE TABLE `warehouses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("1","warehouse 1","2312121","war1@lion.com","khatungonj, chittagong","1","2018-05-12 13:21:44","2019-03-02 21:10:17");
INSERT INTO warehouses VALUES("2","warehouse 2","1234","","boropul, chittagong","1","2018-05-12 13:39:03","2018-06-20 04:00:38");
INSERT INTO warehouses VALUES("3","test","","","dqwdeqw","0","2018-05-30 05:44:23","2018-05-30 05:44:47");
INSERT INTO warehouses VALUES("6","gudam","2121","","gazipur","0","2018-09-01 04:23:26","2018-09-01 04:24:48");

