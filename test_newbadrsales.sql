-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2023 at 02:27 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_newbadrsales`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postal_code` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_new_car`
--

CREATE TABLE `add_new_car` (
  `id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `barcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cylinder` tinyint(1) DEFAULT '3',
  `store_id` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int NOT NULL,
  `alert_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `para` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `client_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `info1` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(20,4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attention`
--

CREATE TABLE `attention` (
  `id` int NOT NULL,
  `attentin_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `badr_shop`
--

CREATE TABLE `badr_shop` (
  `shop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'اسم المؤسسة',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ower_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'اسم المالك',
  `serial_id` int NOT NULL,
  `active_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tel_bill` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_bill` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_bill` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_date` date DEFAULT NULL,
  `run_domian` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://shoponline.badrsystems.com/',
  `logo_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/logo.png',
  `color_option` tinyint(1) NOT NULL DEFAULT '1',
  `edit_incom_price` int NOT NULL DEFAULT '1',
  `sale_quick` tinyint(1) NOT NULL DEFAULT '0',
  `enter_quant` tinyint(1) NOT NULL DEFAULT '1',
  `return_bill` tinyint(1) NOT NULL DEFAULT '1',
  `sale_details` tinyint(1) NOT NULL,
  `sale_details_safe` tinyint(1) NOT NULL,
  `items_company` int NOT NULL DEFAULT '0',
  `alert_due_date` int NOT NULL DEFAULT '10',
  `company_ratio` int NOT NULL DEFAULT '0' COMMENT '0 = no discount, 1 = on items, 2 on invoice',
  `units_sup` tinyint(1) NOT NULL DEFAULT '0',
  `bolla` tinyint(1) NOT NULL,
  `boll_per` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bolla_gift` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bill_size` int NOT NULL DEFAULT '1',
  `billno_show` tinyint(1) NOT NULL,
  `bill_no_record` int NOT NULL DEFAULT '12',
  `barcode_size` int NOT NULL DEFAULT '1',
  `barcode_reader` tinyint(1) NOT NULL DEFAULT '1',
  `day_payment` tinyint(1) NOT NULL DEFAULT '0',
  `type_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'تصنيف',
  `type_show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `price_percent` int NOT NULL,
  `discount_type` tinyint(1) NOT NULL DEFAULT '1',
  `edit_price_bill` tinyint(1) NOT NULL DEFAULT '1',
  `spend_at_report` tinyint(1) NOT NULL,
  `incom_at_report` tinyint(1) NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'جنيه',
  `money_safe` decimal(10,2) NOT NULL,
  `netowrk_payment` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'support network payment by visa',
  `plan` int NOT NULL DEFAULT '1',
  `theme_store` int NOT NULL DEFAULT '1',
  `install_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `us_os` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_os` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_type` int DEFAULT '2',
  `huro_late` int NOT NULL DEFAULT '0' COMMENT 'عدد ساعات التاخير',
  `zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vs` decimal(10,2) DEFAULT NULL,
  `online` int DEFAULT '0',
  `module` tinyint(1) DEFAULT '1',
  `u_no` int NOT NULL DEFAULT '1',
  `notify` tinyint(1) DEFAULT '0',
  `multi_price` int NOT NULL DEFAULT '1',
  `check_lowest_price` int NOT NULL DEFAULT '0',
  `notes` tinyint(1) NOT NULL,
  `auto_print` tinyint(1) NOT NULL DEFAULT '0',
  `bill_time_alert` tinyint(1) NOT NULL DEFAULT '0',
  `style` int NOT NULL DEFAULT '0',
  `color_size` int NOT NULL DEFAULT '0',
  `badr_style` int NOT NULL DEFAULT '1',
  `language` int NOT NULL DEFAULT '0',
  `about` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_adds` tinyint(1) DEFAULT '1',
  `upload_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/logo.png',
  `decimal_num_quant` int NOT NULL DEFAULT '0',
  `decimal_num_price` int NOT NULL DEFAULT '2',
  `select_client` tinyint(1) NOT NULL DEFAULT '0',
  `client_limit` int NOT NULL DEFAULT '0',
  `insatllments` int NOT NULL DEFAULT '0',
  `screen_type` int NOT NULL DEFAULT '1',
  `country` int NOT NULL DEFAULT '63',
  `backup_time` int NOT NULL DEFAULT '120',
  `backup_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backup',
  `manufacturing` int NOT NULL DEFAULT '0',
  `distributor` int NOT NULL DEFAULT '0' COMMENT '0 none 1 mainstore 2smallshop',
  `sms_scrip` int NOT NULL DEFAULT '1',
  `show_item_serial` tinyint(1) NOT NULL DEFAULT '0',
  `upload_img_slide` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Regist_purchases` int DEFAULT NULL,
  `remain_transaction` tinyint(1) DEFAULT '1',
  `points_granted` int NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `income_saleprice` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'update sale price at income bill',
  `show_expire_date` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'show expire date',
  `expire_notification` int NOT NULL DEFAULT '30',
  `POS` int NOT NULL DEFAULT '1',
  `ecomme` int NOT NULL DEFAULT '1',
  `bell_flag` tinyint(1) NOT NULL,
  `bell_date` date DEFAULT NULL,
  `req_mandob` tinyint(1) NOT NULL DEFAULT '0',
  `new_req_bill_status` int NOT NULL DEFAULT '3',
  `mandob_bill` tinyint(1) NOT NULL DEFAULT '0',
  `incom_total_filed` int NOT NULL DEFAULT '0',
  `auto_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `start_barcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '000001',
  `client_debenture` int NOT NULL DEFAULT '1',
  `paypal_client_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_client_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `base_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_cats` int NOT NULL DEFAULT '0' COMMENT 'offers on categores 1 active',
  `trans_price` int DEFAULT '0',
  `Enter_payment` int NOT NULL DEFAULT '0' COMMENT 'Enter payment by hand ',
  `show_imag` int NOT NULL DEFAULT '1' COMMENT '0 for hide item images',
  `add_rest` int NOT NULL DEFAULT '0' COMMENT 'money reset add to client balance',
  `pay_price_update` int NOT NULL DEFAULT '1' COMMENT '1 for last price 2 for average price',
  `Profits_Calc_method` int DEFAULT '1' COMMENT '1 last pay price 2 average 3 actual pay price ',
  `client_last_saleprice` int NOT NULL DEFAULT '0',
  `show_cat_imag` int NOT NULL DEFAULT '0',
  `export` int NOT NULL DEFAULT '0',
  `spends_incomes` tinyint(1) NOT NULL DEFAULT '0',
  `fee_bill` int NOT NULL DEFAULT '0',
  `fee_type` int NOT NULL DEFAULT '0',
  `bill_lang` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ar',
  `client_code` int NOT NULL DEFAULT '0',
  `english_shop_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `back_sales` tinyint(1) DEFAULT NULL,
  `shop_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `multi_currency` tinyint(1) DEFAULT NULL,
  `identity_numbers` int NOT NULL DEFAULT '14',
  `item_factory` tinyint(1) NOT NULL DEFAULT '0',
  `discount_without_vat` int DEFAULT '0',
  `discount_vat` decimal(10,4) DEFAULT '0.0000',
  `watermark_use` int DEFAULT '0',
  `watermark_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitors_page` tinyint(1) NOT NULL DEFAULT '0',
  `tables_management` tinyint(1) NOT NULL DEFAULT '0',
  `add_cities` tinyint(1) NOT NULL DEFAULT '1',
  `bill_services` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_man` tinyint(1) NOT NULL DEFAULT '0',
  `quick_item_edit` tinyint(1) NOT NULL DEFAULT '1',
  `item_code` tinyint(1) NOT NULL DEFAULT '0',
  `send_bill_sms` tinyint(1) NOT NULL DEFAULT '0',
  `generate_qr` tinyint(1) NOT NULL DEFAULT '0',
  `advanced_car_care` tinyint(1) NOT NULL DEFAULT '0',
  `check_serial_exist` tinyint(1) NOT NULL DEFAULT '1',
  `discount_cards` tinyint DEFAULT '0',
  `item_print_ticket` tinyint NOT NULL DEFAULT '0',
  `clients_group` int DEFAULT NULL,
  `junk_bill` tinyint NOT NULL DEFAULT '0',
  `confirm_store_transfer` tinyint(1) DEFAULT '1' COMMENT '0 => confirmed',
  `repeat_client_name` int NOT NULL DEFAULT '0',
  `firm_vat_no` int NOT NULL DEFAULT '0',
  `wash_print_ticket` tinyint NOT NULL DEFAULT '0',
  `prevent_edits` tinyint NOT NULL DEFAULT '0',
  `trade_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_fee` tinyint NOT NULL DEFAULT '0',
  `driver_info` tinyint NOT NULL DEFAULT '0',
  `no_bill_type` tinyint NOT NULL DEFAULT '0',
  `coupon` tinyint NOT NULL DEFAULT '0',
  `purchase_screen_type` tinyint NOT NULL DEFAULT '1',
  `show_sales_points_sales` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_module` tinyint NOT NULL DEFAULT '0',
  `commission_type` tinyint NOT NULL DEFAULT '0',
  `einvoice` tinyint NOT NULL DEFAULT '0',
  `submit_einvoice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => auto , 1 => manual',
  `negative_money` tinyint(1) NOT NULL DEFAULT '0',
  `apply_vats` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_default_payment_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 => cash , 0 => later',
  `show_input_keys` tinyint(1) NOT NULL DEFAULT '0',
  `printing_shop_info_src` tinyint(1) NOT NULL DEFAULT '0',
  `definite_while_selling` tinyint(1) NOT NULL DEFAULT '0',
  `client_bill_increase` tinyint(1) DEFAULT '0',
  `press_screen_items_order_type` tinyint(1) NOT NULL DEFAULT '0',
  `allow_lines` tinyint(1) NOT NULL DEFAULT '0',
  `show_currency_in_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `sale_cash` int NOT NULL DEFAULT '0',
  `tracking` int NOT NULL DEFAULT '0',
  `make_bill` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `badr_shop`
--

INSERT INTO `badr_shop` (`shop_name`, `telephone`, `ower_name`, `serial_id`, `active_id`, `active_date`, `tel_bill`, `mobile_bill`, `bill_header`, `message_bill`, `run_date`, `run_domian`, `logo_path`, `color_option`, `edit_incom_price`, `sale_quick`, `enter_quant`, `return_bill`, `sale_details`, `sale_details_safe`, `items_company`, `alert_due_date`, `company_ratio`, `units_sup`, `bolla`, `boll_per`, `bolla_gift`, `bill_size`, `billno_show`, `bill_no_record`, `barcode_size`, `barcode_reader`, `day_payment`, `type_name`, `type_show_barcode`, `price_percent`, `discount_type`, `edit_price_bill`, `spend_at_report`, `incom_at_report`, `currency`, `money_safe`, `netowrk_payment`, `plan`, `theme_store`, `install_path`, `server_path`, `us_os`, `pass_os`, `date_type`, `huro_late`, `zone`, `vs`, `online`, `module`, `u_no`, `notify`, `multi_price`, `check_lowest_price`, `notes`, `auto_print`, `bill_time_alert`, `style`, `color_size`, `badr_style`, `language`, `about`, `email`, `bill_adds`, `upload_img`, `decimal_num_quant`, `decimal_num_price`, `select_client`, `client_limit`, `insatllments`, `screen_type`, `country`, `backup_time`, `backup_path`, `manufacturing`, `distributor`, `sms_scrip`, `show_item_serial`, `upload_img_slide`, `address`, `Regist_purchases`, `remain_transaction`, `points_granted`, `amount`, `income_saleprice`, `show_expire_date`, `expire_notification`, `POS`, `ecomme`, `bell_flag`, `bell_date`, `req_mandob`, `new_req_bill_status`, `mandob_bill`, `incom_total_filed`, `auto_barcode`, `start_barcode`, `client_debenture`, `paypal_client_id`, `paypal_client_secret`, `base_url`, `offer_cats`, `trans_price`, `Enter_payment`, `show_imag`, `add_rest`, `pay_price_update`, `Profits_Calc_method`, `client_last_saleprice`, `show_cat_imag`, `export`, `spends_incomes`, `fee_bill`, `fee_type`, `bill_lang`, `client_code`, `english_shop_name`, `back_sales`, `shop_terms`, `multi_currency`, `identity_numbers`, `item_factory`, `discount_without_vat`, `discount_vat`, `watermark_use`, `watermark_path`, `visitors_page`, `tables_management`, `add_cities`, `bill_services`, `delivery_man`, `quick_item_edit`, `item_code`, `send_bill_sms`, `generate_qr`, `advanced_car_care`, `check_serial_exist`, `discount_cards`, `item_print_ticket`, `clients_group`, `junk_bill`, `confirm_store_transfer`, `repeat_client_name`, `firm_vat_no`, `wash_print_ticket`, `prevent_edits`, `trade_number`, `shipping_fee`, `driver_info`, `no_bill_type`, `coupon`, `purchase_screen_type`, `show_sales_points_sales`, `maintenance_module`, `commission_type`, `einvoice`, `submit_einvoice`, `negative_money`, `apply_vats`, `invoice_default_payment_type`, `show_input_keys`, `printing_shop_info_src`, `definite_while_selling`, `client_bill_increase`, `press_screen_items_order_type`, `allow_lines`, `show_currency_in_invoices`, `sale_cash`, `tracking`, `make_bill`) VALUES
('hager', '99164680', 'hager', 1, '158b-4042-4890-b55f-4cd9-3351-1fa8-97f8-', '2016-03-18 14:46:13', '222', '222', '<h1 style=\"text-align: center;\">فاتورة</h1>\r\n<h2 style=\"text-align: right;\"><strong>الرجاء الصالح للمبيعات</strong></h2>\r\n<p style=\"text-align: right;\">القاهرة - المهندسين - ش محمد على</p>\r\n<p style=\"text-align: right;\">تليفون :01000021552</p>', '<p style=\"text-align: center;\"><strong>شكرا لزيارتكم المحل ،،الإستبدال خلال 24 ساعة فقط </strong></p>', '2023-01-15', 'http://shoponline.badrsystems.com/', 'upload/l2021-03-23-11-06-07-21036', 1, 1, 0, 0, 1, 0, 0, 0, 10, 0, 0, 2, '0.00', '1.00', 1, 1, 1, 4, 2, 0, 'الاقسام', 0, 1, 0, 1, 1, 0, 'جنيه', '5350.00', 1, 1, 1, NULL, NULL, NULL, NULL, 2, 0, 'Africa/Cairo', NULL, 1, 1, 0, 5, 1, 0, 1, 1, 0, 7, 0, 1, 0, '', '', 0, 'https://badrforsales.com/online/https://badrforsales.com/online/images/logo.png', 2, 2, 0, 0, 1, 1, 63, 120, ' backup', 2, 2, 1, 1, NULL, 'samnoud', 1, 0, 0, '0.00', 1, 0, 120, 1, 1, 0, NULL, 0, 3, 0, 0, 0, '000001', 1, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 'ar', 1, NULL, NULL, '<p>kaldsa;ls\'d</p>', 0, 14, 0, 0, '1.0000', NULL, NULL, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('marwan', '99164680', 'marwan', 2, '158b-4042-4890-b55f-4cd9-3351-1fa8-97f8-', '2016-03-18 14:46:13', '222', '222', '<h1 style=\"text-align: center;\">فاتورة</h1>\r\n<h2 style=\"text-align: right;\"><strong>الرجاء الصالح للمبيعات</strong></h2>\r\n<p style=\"text-align: right;\">القاهرة - المهندسين - ش محمد على</p>\r\n<p style=\"text-align: right;\">تليفون :01000021552</p>', '<p style=\"text-align: center;\"><strong>شكرا لزيارتكم المحل ،،الإستبدال خلال 24 ساعة فقط </strong></p>', '2023-01-15', 'http://shoponline.badrsystems.com/', 'upload/l2021-03-23-11-06-07-21036', 1, 1, 0, 0, 1, 0, 0, 0, 10, 0, 0, 2, '0.00', '1.00', 1, 1, 1, 4, 2, 0, 'الاقسام', 0, 1, 0, 1, 1, 0, 'جنيه', '5350.00', 1, 1, 1, NULL, NULL, NULL, NULL, 2, 0, 'Africa/Cairo', NULL, 1, 1, 0, 5, 1, 0, 1, 1, 0, 7, 0, 1, 0, '', '', 0, 'https://badrforsales.com/online/https://badrforsales.com/online/images/logo.png', 2, 2, 0, 0, 1, 1, 63, 120, ' backup', 2, 2, 1, 1, NULL, 'samnoud', 1, 0, 0, '0.00', 1, 0, 120, 1, 1, 0, NULL, 0, 3, 0, 0, 0, '000001', 1, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 'ar', 1, NULL, NULL, '<p>kaldsa;ls\'d</p>', 0, 14, 0, 0, '1.0000', NULL, NULL, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('store name', '123456789', 'Ahmed', 12015, ' ', '2022-11-22 11:45:03', '', '', '', '', NULL, 'http://shoponline.badrsystems.com/', 'images/logo.png', 1, 1, 0, 1, 1, 0, 0, 0, 10, 0, 0, 0, '0.00', '0.00', 1, 0, 12, 1, 1, 0, 'تصنيف', 0, 0, 1, 1, 0, 0, 'جنيه', '0.00', 0, 1, 1, NULL, NULL, NULL, NULL, 2, 0, 'Africa/Cairo', NULL, 0, 1, 20, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, '', '', 1, 'images/logo.png', 0, 2, 0, 0, 0, 1, 63, 120, 'backup', 0, 0, 1, 0, NULL, NULL, 3, 1, 0, '0.00', 0, 0, 30, 1, 1, 0, NULL, 0, 3, 0, 0, 0, '000001', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'ar', 0, NULL, NULL, NULL, NULL, 14, 0, 0, '0.0000', 0, NULL, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('metwally', '99164680', 'Ahmed AbdElaziz', 21036, '66b1-c67e-d115-9b7f-5b5c-feb5-c5b5-90b9-', '2016-03-18 14:46:13', '222', '222', '<h1 style=\"text-align: center;\">فاتورة</h1>\r\n<h2 style=\"text-align: right;\"><strong>الرجاء الصالح للمبيعات</strong></h2>\r\n<p style=\"text-align: right;\">القاهرة - المهندسين - ش محمد على</p>\r\n<p style=\"text-align: right;\">تليفون :01000021552</p>', '<p style=\"text-align: center;\"><strong>شكرا لزيارتكم المحل ،،الإستبدال خلال 24 ساعة فقط </strong></p>', '2027-02-15', 'http://shoponline.badrsystems.com/', 'logo/2022-12-11_21036_1670750776.jpg', 1, 1, 0, 1, 1, 0, 0, 1, 30, 2, 0, 0, '1.00', '1.00', 1, 0, 30, 4, 2, 0, 'الاقسام', 0, 1, 0, 1, 1, 0, 'yen', '5350.00', 0, 1, 1, NULL, NULL, NULL, NULL, 2, 0, 'Africa/Casablanca', NULL, 0, 1, 0, 5, 1, 1, 1, 1, 1, 7, 0, 1, 0, '', '', 0, 'https://badrforsales.com/online/https://badrforsales.com/online/images/logo.png', 2, 2, 0, 0, 1, 0, 142, 120, ' backup', 2, 1, 1, 1, NULL, 'samnoud', 3, 0, 0, '0.00', 0, 1, 30, 1, 1, 0, NULL, 0, 3, 0, 0, 0, '000001', 0, NULL, NULL, NULL, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 'ar', 0, NULL, NULL, '<p>kaldsa;ls\'d</p>', 0, 14, 0, 0, '0.0000', NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int NOT NULL,
  `account_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_iban` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcodesetting`
--

CREATE TABLE `barcodesetting` (
  `shop_id` int NOT NULL,
  `support` int NOT NULL,
  `price` tinyint(1) NOT NULL,
  `showitem` tinyint(1) NOT NULL,
  `show_about` int NOT NULL DEFAULT '0',
  `barcodestyle` int NOT NULL DEFAULT '1',
  `titleName` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcodecount` int NOT NULL,
  `barcodewidth` decimal(10,2) NOT NULL,
  `barcodeheight` decimal(10,2) NOT NULL,
  `itemup` decimal(10,2) NOT NULL,
  `pageup` decimal(10,2) NOT NULL,
  `itemdown` decimal(10,2) NOT NULL,
  `pagedown` decimal(10,2) NOT NULL,
  `itemright` decimal(10,2) NOT NULL,
  `pageright` decimal(10,2) NOT NULL,
  `itemleft` decimal(10,2) NOT NULL,
  `pageleft` decimal(10,2) NOT NULL,
  `logoheight` decimal(10,0) DEFAULT NULL,
  `logowidth` decimal(10,0) DEFAULT NULL,
  `codimgheight` decimal(10,0) DEFAULT NULL,
  `codimgwidth` decimal(10,0) DEFAULT NULL,
  `support_scale` int NOT NULL DEFAULT '0',
  `scale_start` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scale_item` int DEFAULT '2',
  `discount_price_list` int NOT NULL DEFAULT '-1',
  `fontsize` int NOT NULL DEFAULT '14',
  `print_barcode` int NOT NULL DEFAULT '0' COMMENT 'show barcode under image',
  `show_shop_name` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills_add`
--

CREATE TABLE `bills_add` (
  `id` int NOT NULL,
  `Addition_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_addition` int NOT NULL,
  `addition_value` decimal(10,4) NOT NULL,
  `bill_add_method` int DEFAULT NULL,
  `add_role` int DEFAULT '0',
  `add_resturant` int NOT NULL DEFAULT '1' COMMENT '0 cash only 1 all 2 hall only 3 delivery only',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_user` int NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `check_bill_type` int NOT NULL DEFAULT '0',
  `vat_operation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = add , 1 = discount',
  `tax_type` tinyint(1) DEFAULT NULL,
  `einvoice_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sub_einvoice_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills_add_history`
--

CREATE TABLE `bills_add_history` (
  `id` int NOT NULL,
  `bill_id` int NOT NULL,
  `addition_id` int NOT NULL,
  `addition_value` decimal(10,4) NOT NULL,
  `shop_id` int NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `request_id` int DEFAULT NULL,
  `spend_id` int DEFAULT NULL,
  `bill_add` int DEFAULT '15',
  `add_type` int DEFAULT '0',
  `offer_sales_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_images`
--

CREATE TABLE `bill_images` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `image_link` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_services`
--

CREATE TABLE `bill_services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int UNSIGNED NOT NULL,
  `add_user` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_setting`
--

CREATE TABLE `bill_setting` (
  `shop_id` int NOT NULL,
  `bill_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_bill` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `font_size` int NOT NULL DEFAULT '14',
  `show_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_about` tinyint(1) NOT NULL DEFAULT '1',
  `show_salesman` tinyint(1) NOT NULL DEFAULT '0',
  `show_client_balance` tinyint(1) NOT NULL DEFAULT '0',
  `smallbill_itemname` tinyint(1) NOT NULL DEFAULT '1',
  `show_item_serial` tinyint(1) DEFAULT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_name` int NOT NULL DEFAULT '1',
  `price_include_vat` int NOT NULL DEFAULT '0',
  `barcode_bill_no` int NOT NULL DEFAULT '0',
  `direct_printer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'direct printer connect server',
  `show_description` tinyint(1) NOT NULL DEFAULT '0',
  `show_phone` tinyint(1) NOT NULL DEFAULT '0',
  `show_discount` tinyint(1) NOT NULL DEFAULT '0',
  `show_unites` tinyint(1) NOT NULL DEFAULT '0',
  `notes` tinyint(1) NOT NULL DEFAULT '0',
  `place_logo` enum('right','center','left') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'center',
  `show_bill_header` tinyint(1) NOT NULL DEFAULT '0',
  `total_type` tinyint(1) NOT NULL DEFAULT '0',
  `show_bill_message` tinyint(1) NOT NULL DEFAULT '0',
  `show_vat_number` tinyint(1) NOT NULL DEFAULT '0',
  `logo_tall` int NOT NULL DEFAULT '0',
  `logo_weight` int NOT NULL DEFAULT '0',
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_client_address` tinyint(1) NOT NULL DEFAULT '0',
  `show_item_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_item_name` tinyint(1) NOT NULL DEFAULT '1',
  `item_discount` tinyint(1) NOT NULL DEFAULT '0',
  `salesman_type` tinyint(1) NOT NULL DEFAULT '0',
  `client_name_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_type` tinyint(1) NOT NULL DEFAULT '0',
  `way_total_show` tinyint(1) NOT NULL DEFAULT '0',
  `total_place` enum('right','left') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'right',
  `item_img` tinyint(1) NOT NULL DEFAULT '0',
  `img_height` int NOT NULL DEFAULT '2',
  `img_width` int NOT NULL DEFAULT '2',
  `line_height` double NOT NULL DEFAULT '1.2',
  `show_unit` int DEFAULT NULL,
  `qr_code` int NOT NULL DEFAULT '0',
  `show_bill_serial` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int UNSIGNED NOT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_comanyes`
--

CREATE TABLE `card_comanyes` (
  `id` int NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `card_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `number_digital` int NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_numbers`
--

CREATE TABLE `card_numbers` (
  `id` int NOT NULL,
  `card_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_state` int NOT NULL DEFAULT '0' COMMENT '0 not sales',
  `item_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `income_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `sale_price` int NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `add_user` int NOT NULL,
  `request_id` int DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `structure_no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars_model`
--

CREATE TABLE `cars_model` (
  `id` int NOT NULL,
  `year` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars_type`
--

CREATE TABLE `cars_type` (
  `id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_engine`
--

CREATE TABLE `car_engine` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `car_id` int NOT NULL DEFAULT '0' COMMENT '0 for no car',
  `store_id` int DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1 for country_make === 2 for pack === 3 for corrupted === 4 for insurance',
  `mechanic_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack_date` date DEFAULT NULL,
  `insurance_start` date DEFAULT NULL,
  `insurance_end` date DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bill_id` int NOT NULL DEFAULT '0',
  `cylinder_` tinyint(1) DEFAULT '3',
  `engine_types` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_sub_types`
--

CREATE TABLE `car_sub_types` (
  `id` int NOT NULL,
  `sub_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_type_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_offers`
--

CREATE TABLE `category_offers` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `items_quant` decimal(10,4) NOT NULL,
  `offer_price` decimal(10,4) NOT NULL COMMENT 'total price',
  `offer_status` int NOT NULL COMMENT '1 active 0 non active',
  `offer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_cities`
--

CREATE TABLE `charge_cities` (
  `id` int NOT NULL,
  `region_id` int DEFAULT NULL,
  `name_ar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_cities_options`
--

CREATE TABLE `charge_cities_options` (
  `id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `delivery` int DEFAULT NULL,
  `epay` int DEFAULT NULL,
  `bank` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_companies`
--

CREATE TABLE `charge_companies` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_orders`
--

CREATE TABLE `charge_orders` (
  `id` int NOT NULL,
  `order_number` int DEFAULT NULL,
  `charge_company_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charge_order_bills`
--

CREATE TABLE `charge_order_bills` (
  `id` int NOT NULL,
  `charge_order_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_settings`
--

CREATE TABLE `checkout_settings` (
  `id` int UNSIGNED NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `paypal_client_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_client_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_s_client_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_s_client_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_sandbox` tinyint(1) NOT NULL DEFAULT '1',
  `payfort_merchant_identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_access_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_SHARequest_phrase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_SHAResponse_phrase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_command` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_s_merchant_identifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_s_access_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_s_SHARequest_phrase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_s_SHAResponse_phrase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_s_command` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payfort_sandbox` tinyint(1) NOT NULL DEFAULT '1',
  `paytabs_sandbox` tinyint(1) NOT NULL DEFAULT '1',
  `paytabs_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytabs_s_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytabs_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moyasar_secret_key` varchar(100) DEFAULT NULL,
  `moyasar_s_secret_key` varchar(100) DEFAULT NULL,
  `moyasar_public_key` varchar(100) DEFAULT NULL,
  `moyasar_s_public_key` varchar(100) DEFAULT NULL,
  `moyasar_sandbox` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `city_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_up` int NOT NULL DEFAULT '0',
  `not_active` tinyint(1) NOT NULL DEFAULT '0',
  `Incentive` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `lat` decimal(11,8) DEFAULT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `client_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tele` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addition_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `credit_limit` decimal(20,4) NOT NULL,
  `date_zero` datetime NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `notify_length` int DEFAULT NULL,
  `notify_next` date DEFAULT NULL,
  `price_list_id` int NOT NULL,
  `city_id` int NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `gift_points` int NOT NULL DEFAULT '0',
  `StorePass` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StoreTransport` decimal(10,2) NOT NULL DEFAULT '0.00',
  `StoreServices` decimal(10,2) NOT NULL DEFAULT '0.00',
  `info1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'الرقم القومى',
  `info2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'اسم الضامن',
  `info3` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'عنوان الضامن',
  `info4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'تليفون الضامن',
  `info5` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'رقم قومى الضامن',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_mobile` int DEFAULT NULL,
  `device_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_code` int DEFAULT NULL,
  `api_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_area` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_home` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_elecNo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_id` int DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `lat` decimal(12,9) DEFAULT NULL,
  `lon` decimal(12,9) DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'client 0 table 1',
  `country_id` int NOT NULL DEFAULT '0',
  `job` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_treatment` int DEFAULT NULL,
  `file_no` int DEFAULT NULL,
  `info6` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'car inside plate ',
  `info7` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'car engine',
  `car_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `car_sub_type` int NOT NULL DEFAULT '0',
  `car_year` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `departure_date` date DEFAULT NULL,
  `client_bill_increase` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency_id` int DEFAULT NULL,
  `has_vat` int NOT NULL DEFAULT '0',
  `client_role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = customer, 1 = supplier, 2 = both',
  `governate` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `regionCity` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `buildingNumber` int DEFAULT NULL,
  `postalCode` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `room` int DEFAULT NULL,
  `landmark` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_groups`
--

CREATE TABLE `clients_groups` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `group_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_glasses`
--

CREATE TABLE `client_glasses` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `f_sph1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_sph1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `f_cyl1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_cyl1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `f_axis1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_axis1` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `f_sph2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_sph2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `f_cyl2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_cyl2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `f_axis2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `n_axis2` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_images`
--

CREATE TABLE `client_images` (
  `id` int UNSIGNED NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int UNSIGNED DEFAULT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_locations`
--

CREATE TABLE `client_locations` (
  `id` int UNSIGNED NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `client_id` int DEFAULT NULL,
  `lat` decimal(12,4) DEFAULT NULL,
  `lon` decimal(12,4) DEFAULT NULL,
  `detailed_address` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_notifications`
--

CREATE TABLE `client_notifications` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `notification_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_transaction`
--

CREATE TABLE `client_transaction` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `pay_day` date NOT NULL,
  `balance` decimal(20,4) NOT NULL,
  `bill_id` int NOT NULL,
  `sale_back_id` int NOT NULL,
  `bill_net_total` decimal(10,4) DEFAULT NULL,
  `problem_id` int NOT NULL,
  `effect` tinyint(1) NOT NULL COMMENT '1 للايداع وصفر للسحب ',
  `supplier_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_time` datetime DEFAULT NULL,
  `safe_type` int DEFAULT NULL,
  `safe_balance` decimal(20,4) DEFAULT NULL,
  `safe_point_id` int DEFAULT NULL,
  `effected_point` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `salary_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OutTransactionID` int NOT NULL,
  `spend_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `insured_user` int DEFAULT NULL,
  `insurance_status` int DEFAULT NULL,
  `is_deleted` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `installment_id` int NOT NULL DEFAULT '0',
  `money_percent` int NOT NULL DEFAULT '0',
  `show_transaction` int NOT NULL DEFAULT '0',
  `user_commission` decimal(10,0) NOT NULL DEFAULT '0',
  `related_to` int DEFAULT NULL,
  `check_info` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_id` int DEFAULT '0',
  `import_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `close_shift`
--

CREATE TABLE `close_shift` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `close_amnount` decimal(20,2) DEFAULT NULL,
  `close_time` datetime NOT NULL,
  `total_sales` decimal(20,2) DEFAULT NULL,
  `last_close` decimal(20,2) DEFAULT NULL,
  `sale_point` int NOT NULL,
  `shop_id` int NOT NULL,
  `sale_point_to` int NOT NULL DEFAULT '0',
  `amount_left` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `color_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `color_car`
--

CREATE TABLE `color_car` (
  `id` int NOT NULL,
  `color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `income_ratio` decimal(10,4) NOT NULL,
  `sale_ratio` decimal(10,4) NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component_request`
--

CREATE TABLE `component_request` (
  `id` int NOT NULL,
  `component_id` int NOT NULL,
  `request_id` int NOT NULL,
  `status` enum('good','broken','not_available') COLLATE utf8mb3_unicode_ci NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snap_chat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `convert_money`
--

CREATE TABLE `convert_money` (
  `id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `order_no` int NOT NULL,
  `date_convert` datetime NOT NULL,
  `total_money` decimal(10,2) NOT NULL,
  `user_id` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `convert_money_items`
--

CREATE TABLE `convert_money_items` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `convert_id` int NOT NULL,
  `item_id` int NOT NULL,
  `convert_quant` int NOT NULL,
  `convert_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `name_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_alpha2` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int DEFAULT NULL,
  `currency_code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name_en` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name_ar` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currrency_symbol` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phonecode` int NOT NULL,
  `flag` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderflag` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` decimal(10,4) DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man`
--

CREATE TABLE `delivery_man` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `add_user` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_options`
--

CREATE TABLE `delivery_options` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `with_periods` tinyint(1) NOT NULL DEFAULT '0',
  `shop_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_quantities`
--

CREATE TABLE `detail_quantities` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_cards`
--

CREATE TABLE `discount_cards` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `end_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `bill_id_used` int DEFAULT NULL,
  `date_of_used` date DEFAULT NULL,
  `bill_id_sell` int DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `einvoices`
--

CREATE TABLE `einvoices` (
  `id` int NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `submissionUUID` varchar(255) NOT NULL,
  `longId` varchar(255) NOT NULL,
  `internalId` varchar(255) NOT NULL,
  `invoice_id` int DEFAULT NULL,
  `typeName` varchar(100) NOT NULL,
  `documentTypeNamePrimaryLang` varchar(100) NOT NULL,
  `documentTypeNameSecondaryLang` varchar(100) NOT NULL,
  `typeVersionName` varchar(100) NOT NULL,
  `issuerId` int NOT NULL,
  `issuerName` varchar(100) NOT NULL,
  `issuerType` tinyint NOT NULL,
  `receiverId` int NOT NULL,
  `receiverName` varchar(100) NOT NULL,
  `receiverType` tinyint NOT NULL,
  `taxpayerActivityCode` int NOT NULL,
  `dateTimeIssued` timestamp NULL DEFAULT NULL,
  `dateTimeReceived` timestamp NULL DEFAULT NULL,
  `totalSales` decimal(20,4) NOT NULL,
  `totalDiscount` decimal(20,4) NOT NULL,
  `totalItemsDiscountAmount` decimal(20,4) NOT NULL,
  `extraDiscountAmount` decimal(20,4) NOT NULL,
  `taxTotals` decimal(20,4) NOT NULL,
  `netAmount` decimal(20,4) NOT NULL,
  `total` decimal(20,4) NOT NULL,
  `maxPercision` int NOT NULL,
  `cancelRequestDate` timestamp NULL DEFAULT NULL,
  `rejectRequestDate` timestamp NULL DEFAULT NULL,
  `cancelRequestDelayedDate` timestamp NULL DEFAULT NULL,
  `rejectRequestDelayedDate` timestamp NULL DEFAULT NULL,
  `declineCancelRequestDate` timestamp NULL DEFAULT NULL,
  `declineRejectRequestDate` timestamp NULL DEFAULT NULL,
  `canbeCancelledUntil` timestamp NULL DEFAULT NULL,
  `canbeRejectedUntil` timestamp NULL DEFAULT NULL,
  `documentStatusReason` text,
  `currenciesSold` varchar(100) NOT NULL,
  `statusId` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `createdByUserId` varchar(255) NOT NULL,
  `publicUrl` text NOT NULL,
  `validationResults` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `einvoice_details`
--

CREATE TABLE `einvoice_details` (
  `id` int NOT NULL,
  `einvoice_id` int NOT NULL,
  `itemPrimaryName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `itemPrimaryDescription` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `itemSecondaryName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `itemSecondaryDescription` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitTypePrimaryName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitTypePrimaryDescription` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitTypeSecondaryName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitTypeSecondaryDescription` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unitValue_amountSold` decimal(20,4) DEFAULT NULL,
  `unitValue_amountEGP` decimal(20,4) DEFAULT NULL,
  `unitValue_currencyExchangeRate` decimal(20,4) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `itemType` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `itemCode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `unitType` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `salesTotal` decimal(20,4) NOT NULL,
  `discount_rate` decimal(20,4) NOT NULL,
  `discount_amount` decimal(20,4) NOT NULL,
  `taxableItems` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `internalCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `itemsDiscount` decimal(20,4) NOT NULL,
  `netTotal` decimal(20,4) NOT NULL,
  `totalTaxableFees` decimal(20,4) NOT NULL,
  `valueDifference` decimal(20,4) NOT NULL,
  `total` decimal(20,4) NOT NULL,
  `einvoice_details` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `einvoice_detail_vats`
--

CREATE TABLE `einvoice_detail_vats` (
  `id` int NOT NULL,
  `einvoice_id` int NOT NULL,
  `item_id` int NOT NULL,
  `amountForeign` decimal(20,4) NOT NULL,
  `taxType` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `subType` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rate` decimal(20,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `einvoice_item_codes`
--

CREATE TABLE `einvoice_item_codes` (
  `id` int NOT NULL,
  `codeUsageRequestID` int DEFAULT NULL,
  `codeTypeName` varchar(50) DEFAULT NULL,
  `codeID` int DEFAULT NULL,
  `itemCode` varchar(255) DEFAULT NULL,
  `codeNamePrimaryLang` varchar(100) DEFAULT NULL,
  `codeNameSecondaryLang` varchar(100) DEFAULT NULL,
  `descriptionPrimaryLang` varchar(255) DEFAULT NULL,
  `descriptionSecondaryLang` varchar(255) DEFAULT NULL,
  `parentCodeID` int DEFAULT NULL,
  `parentItemCode` varchar(255) DEFAULT NULL,
  `parentCodeNamePrimaryLang` varchar(255) DEFAULT NULL,
  `parentCodeNameSecondaryLang` varchar(255) DEFAULT NULL,
  `parentLevelName` varchar(255) DEFAULT NULL,
  `levelName` varchar(255) DEFAULT NULL,
  `requestCreationDateTimeUtc` timestamp NULL DEFAULT NULL,
  `codeCreationDateTimeUtc` timestamp NULL DEFAULT NULL,
  `activeFrom` timestamp NULL DEFAULT NULL,
  `activeTo` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `status` enum('Submitted','Approved','Rejected') DEFAULT NULL,
  `statusReason` text,
  `ownerTaxpayer_rin` varchar(255) DEFAULT NULL,
  `ownerTaxpayer_name` varchar(255) DEFAULT NULL,
  `ownerTaxpayer_nameAr` varchar(255) DEFAULT NULL,
  `requesterTaxpayer_rin` varchar(255) DEFAULT NULL,
  `requesterTaxpayer_name` varchar(255) DEFAULT NULL,
  `requesterTaxpayer_nameAr` varchar(255) DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `einvoice_settings`
--

CREATE TABLE `einvoice_settings` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `activity_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `branch_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `iso_alpha2` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `registration_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `client_id` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `client_secret` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `thumbprint` varchar(151) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `governate` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `regionCity` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `buildingNumber` int DEFAULT NULL,
  `postalCode` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `room` int DEFAULT NULL,
  `landmark` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `additional_information` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `einvoice_stages`
--

CREATE TABLE `einvoice_stages` (
  `id` int NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `stage` tinyint(1) DEFAULT NULL COMMENT '0  => submit einvoice, \r\n1  => update invoice table,\r\n2  => get einvoice,\r\n3  => get einvoice details,\r\n4  => save einvoice in db,\r\n5  => save einvoice details in db,\r\n6  => save einvoice detail in vats in db,\r\n7  => save item code in einvoice solution,\r\n8  => update items table with item code,\r\n9  => get item code from einvoice solution,\r\n10 => save item code in db,',
  `request` text,
  `response` text,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => initializing,\r\n1 => pending,\r\n2 => error, \r\n3 => done',
  `request_at` timestamp NULL DEFAULT NULL,
  `response_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Table for detect which stage has error while submit invoice';

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_attendance` date NOT NULL,
  `attendance_type` int NOT NULL DEFAULT '0' COMMENT '0 none, 1 attend, 2 absen',
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_transaction`
--

CREATE TABLE `emp_transaction` (
  `id` int NOT NULL,
  `salary` decimal(10,4) NOT NULL,
  `monthe` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduct` decimal(10,4) NOT NULL,
  `em_id` int NOT NULL,
  `spend_date` date NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `resson` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` int NOT NULL,
  `client_transaction` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `shop_id` int NOT NULL,
  `month_deduct` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `addition` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factories`
--

CREATE TABLE `factories` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `client_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `type` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_history`
--

CREATE TABLE `gift_history` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `gift_balance` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google_cities`
--

CREATE TABLE `google_cities` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int NOT NULL,
  `import_id` int NOT NULL,
  `import_date` datetime NOT NULL,
  `amount` decimal(20,4) DEFAULT NULL,
  `sale_point` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paid` decimal(20,4) DEFAULT NULL,
  `Remaining` decimal(20,4) DEFAULT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `shop_id` int NOT NULL,
  `bill_add_id` int DEFAULT NULL,
  `vat_value` int DEFAULT NULL,
  `import_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirmed` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports_item`
--

CREATE TABLE `imports_item` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_bill`
--

CREATE TABLE `incoming_bill` (
  `id` int NOT NULL,
  `incom_id` int NOT NULL,
  `incoming_date` date NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int NOT NULL,
  `supplier_bill_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_bill` decimal(20,4) DEFAULT NULL,
  `discount` decimal(20,4) DEFAULT NULL,
  `discount_type` tinyint(1) NOT NULL COMMENT '0 %',
  `net_price` decimal(20,4) DEFAULT NULL,
  `payment` decimal(20,4) DEFAULT NULL,
  `supplier_balance` decimal(20,4) DEFAULT NULL,
  `pay_stat` int NOT NULL DEFAULT '1',
  `mony_safe` int NOT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_value` decimal(10,4) DEFAULT NULL,
  `vat_discount` decimal(10,4) DEFAULT '0.0000',
  `vat_discount_type` int DEFAULT '0',
  `vat_discount_value` decimal(10,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_bill_return`
--

CREATE TABLE `incoming_bill_return` (
  `id` int NOT NULL,
  `incoming_date` date NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int NOT NULL,
  `total_bill` decimal(20,4) DEFAULT NULL,
  `discount` decimal(20,4) DEFAULT NULL,
  `net_price` decimal(20,4) DEFAULT NULL,
  `payment` decimal(20,4) DEFAULT NULL,
  `supplier_balance` decimal(20,4) DEFAULT NULL,
  `pay_stat` int NOT NULL DEFAULT '1',
  `mony_safe` int NOT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `incom_id` int NOT NULL,
  `discount_type` tinyint(1) NOT NULL,
  `store_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `supplier_bill_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_details`
--

CREATE TABLE `incoming_details` (
  `id` int NOT NULL,
  `bill_id` int NOT NULL,
  `item_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int NOT NULL,
  `about_item` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `sale_price` decimal(20,4) DEFAULT NULL,
  `ratio_input_incom` decimal(20,4) DEFAULT NULL,
  `basic_price_in` decimal(20,4) DEFAULT NULL,
  `total` decimal(20,4) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `glass_height` decimal(10,2) DEFAULT NULL,
  `glass_width` decimal(10,2) DEFAULT NULL,
  `glass_number` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `main_qty` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `disc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incoming_details_return`
--

CREATE TABLE `incoming_details_return` (
  `id` int NOT NULL,
  `bill_id` int NOT NULL,
  `item_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `sale_price` decimal(20,4) DEFAULT NULL,
  `total` decimal(20,4) DEFAULT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `expire_date` date DEFAULT NULL,
  `ratio_input_incom` decimal(10,4) NOT NULL,
  `basic_price_in` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installments_list`
--

CREATE TABLE `installments_list` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `installment_amount` decimal(10,4) NOT NULL,
  `installment_date` date NOT NULL,
  `bill_id` int NOT NULL,
  `installment_pay` tinyint(1) NOT NULL DEFAULT '0',
  `pay_date` date DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `supplier_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `shop_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0 is open and 1 is closed',
  `store_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_details`
--

CREATE TABLE `inventory_details` (
  `id` int NOT NULL,
  `inventory_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `current_quantity` decimal(10,4) NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_`
--

CREATE TABLE `invoices_` (
  `id` int NOT NULL,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice_date` datetime NOT NULL,
  `store_id` int NOT NULL,
  `bill_total` decimal(20,4) DEFAULT NULL,
  `net_price` decimal(20,4) DEFAULT NULL,
  `boll_per` decimal(20,4) DEFAULT NULL,
  `sales_man` int NOT NULL DEFAULT '0',
  `payment` decimal(20,4) DEFAULT NULL,
  `bill_payment` decimal(20,4) DEFAULT NULL,
  `rest` decimal(20,4) DEFAULT NULL,
  `client_id` int NOT NULL,
  `balance` decimal(20,4) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `add_user` int NOT NULL,
  `pay_process` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int NOT NULL,
  `bill_no` int NOT NULL DEFAULT '0',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notify_time` datetime DEFAULT NULL,
  `notify_alert` tinyint(1) NOT NULL DEFAULT '0',
  `cooking` int NOT NULL DEFAULT '0',
  `insatllments_add` decimal(20,0) DEFAULT NULL,
  `StoreTransport` decimal(20,4) DEFAULT NULL,
  `StoreServices` decimal(20,4) DEFAULT NULL,
  `car_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_type` int NOT NULL DEFAULT '0' COMMENT '0 = purchases, 1 = sales, 2 = purchases back, 3 = sales back,\r\n23 = sales offers',
  `due_date` date DEFAULT NULL,
  `notes_export` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notes_export2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fee` decimal(20,4) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `done_date` datetime DEFAULT NULL,
  `type` int DEFAULT '0',
  `fee_status` int NOT NULL DEFAULT '0',
  `local_bill_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_status` int NOT NULL DEFAULT '0',
  `server_bill_no` int NOT NULL DEFAULT '0',
  `show_bill` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `city_id` int NOT NULL DEFAULT '0',
  `bill_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_service_id` int NOT NULL DEFAULT '0',
  `delivery_man_id` int NOT NULL DEFAULT '0',
  `delivery_date` timestamp NULL DEFAULT NULL,
  `bill_service_value` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `delivery_option_id` int NOT NULL DEFAULT '0',
  `delivery_period_id` int NOT NULL DEFAULT '0',
  `order_ready` int NOT NULL DEFAULT '1',
  `action_type` int NOT NULL DEFAULT '0',
  `charge_company_id` int NOT NULL DEFAULT '0',
  `request_id` int NOT NULL DEFAULT '0',
  `shipping_payment` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shipping_fee` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shipping_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `network_notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `reference_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_commission_paid` int NOT NULL DEFAULT '0',
  `reference_id` int NOT NULL DEFAULT '0',
  `effected_bill_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_value` decimal(10,4) DEFAULT NULL,
  `submissionId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `longId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `internalId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `hashKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `store_from` int NOT NULL DEFAULT '0',
  `store_to` int NOT NULL DEFAULT '0',
  `einvoice_type` enum('0','1','2','3') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `invoice_total_disc` decimal(20,5) NOT NULL,
  `invoice_total_disc_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => %, 1 => value',
  `invoice_total_disc_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => manually, 1 => automatically',
  `order_no` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

CREATE TABLE `invoices_details` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `quantity_after` decimal(20,4) DEFAULT NULL,
  `sale_price` decimal(20,4) DEFAULT NULL,
  `basic_sale_price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `basic_pay_price` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sale_ratio` decimal(20,4) DEFAULT NULL,
  `total_price` decimal(20,4) DEFAULT NULL,
  `pay_price` decimal(20,4) DEFAULT NULL,
  `av_pay_price` decimal(20,4) DEFAULT NULL,
  `ac_pay_price` decimal(20,4) DEFAULT NULL,
  `bolla` decimal(20,4) DEFAULT NULL,
  `sales_man` int NOT NULL DEFAULT '1',
  `safe_point_id` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `isservice` int NOT NULL DEFAULT '0',
  `notify_alert` tinyint(1) NOT NULL DEFAULT '0',
  `notify_time` datetime DEFAULT NULL,
  `record_type` tinyint(1) NOT NULL DEFAULT '1',
  `label_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricePercentage` decimal(20,4) DEFAULT NULL,
  `item_serial` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int NOT NULL,
  `duration_type` int DEFAULT NULL COMMENT '0 -> by hour, 1 -> by day',
  `duration` decimal(20,2) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `item_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `cards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `spare_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `glass_height` decimal(10,2) DEFAULT NULL,
  `glass_width` decimal(10,2) DEFAULT NULL,
  `glass_number` int DEFAULT NULL,
  `sales_row_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `offer_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_type` int DEFAULT NULL,
  `ratio_type` tinyint NOT NULL DEFAULT '0',
  `main_qty` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `disc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `expire_date` date DEFAULT NULL,
  `discount` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `discount_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = % , 1 = value',
  `discount_operation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = increase , 1 = decrease',
  `net_price` decimal(20,4) NOT NULL,
  `pay_vats_weight` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `not_sold` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `replaced` tinyint(1) NOT NULL DEFAULT '0',
  `item_price_with_discount` decimal(20,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details_vats`
--

CREATE TABLE `invoices_details_vats` (
  `id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `item_id` int NOT NULL,
  `vat_id` int NOT NULL,
  `vat_type` tinyint(1) NOT NULL COMMENT '0 = % , 1 = number',
  `vat_operation` tinyint(1) NOT NULL COMMENT '0 = \r\nincrease, 1 =  decrease',
  `vat_value` decimal(10,4) NOT NULL,
  `vat_weight` decimal(10,4) NOT NULL,
  `shop_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` decimal(20,4) DEFAULT NULL,
  `lowest_price` decimal(20,4) DEFAULT NULL,
  `pay_price` decimal(20,4) DEFAULT NULL,
  `disc_value` decimal(20,4) DEFAULT NULL,
  `sale_unit` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `unit_id` int NOT NULL,
  `company_id` int DEFAULT '0',
  `device_id` int DEFAULT NULL,
  `shelf` int DEFAULT NULL,
  `pur_unit` int NOT NULL,
  `pur_unit_equal` int NOT NULL,
  `expire_date` date NOT NULL,
  `item_group` int NOT NULL,
  `size_id` int DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  `incom_date` date NOT NULL,
  `min_quantity` int NOT NULL,
  `Collection` tinyint(1) NOT NULL DEFAULT '0',
  `cooking_add` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'اضافات الاضناف بالمطبخ',
  `background_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFF',
  `order_show` int NOT NULL DEFAULT '1',
  `laststoreIdOrder` int NOT NULL DEFAULT '0',
  `require_serial` tinyint(1) NOT NULL DEFAULT '0',
  `meter_ceramic` decimal(20,2) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `game` tinyint(1) NOT NULL DEFAULT '0',
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bolla` int NOT NULL DEFAULT '0',
  `supplier_id` int NOT NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `shop_id` int NOT NULL,
  `is_service` tinyint(1) DEFAULT NULL,
  `is_engine` tinyint(1) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `card_company_id` int DEFAULT NULL,
  `details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_id` int DEFAULT NULL,
  `used_for_small` double DEFAULT NULL,
  `used_for_medium` double DEFAULT NULL,
  `used_for_large` double DEFAULT NULL,
  `rent_type` int DEFAULT NULL COMMENT '0 -> by hour, 1 -> by day',
  `view` int DEFAULT '2',
  `vat_state` int NOT NULL DEFAULT '1',
  `vat_id` int NOT NULL,
  `item_add_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withDiscount` int DEFAULT NULL,
  `discount_percent` decimal(10,2) DEFAULT NULL,
  `searchCount` int DEFAULT NULL,
  `measruing_type` int NOT NULL DEFAULT '0' COMMENT '0 by unit 1 by meter , 2 meter2',
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price_befor_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'old price for offer',
  `discount_start_date` date DEFAULT NULL,
  `discount_end_date` date DEFAULT NULL,
  `damaged` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `factory_id` int DEFAULT '0',
  `medicine` int DEFAULT '0',
  `sale_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `purchase_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `is_card` tinyint DEFAULT '0',
  `additional_charge_fee` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `purchase_vat_state` int NOT NULL DEFAULT '1',
  `purchase_vat_id` int NOT NULL DEFAULT '0',
  `is_project` tinyint(1) NOT NULL DEFAULT '0',
  `project_client_id` int NOT NULL,
  `manufacturing` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `parent_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `item_einvoice_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `start_qty` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `start_pay` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `not_sold` decimal(20,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_car_types`
--

CREATE TABLE `items_car_types` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `car_type_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_collection`
--

CREATE TABLE `items_collection` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `main_item` int NOT NULL,
  `quant` decimal(10,4) NOT NULL,
  `main_result` decimal(10,2) NOT NULL DEFAULT '1.00',
  `shop_id` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_colors`
--

CREATE TABLE `items_colors` (
  `id` int NOT NULL,
  `item_id` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_execution`
--

CREATE TABLE `items_execution` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_group`
--

CREATE TABLE `items_group` (
  `id` int NOT NULL,
  `group_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `sale_price` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_group_types`
--

CREATE TABLE `items_group_types` (
  `id` int NOT NULL,
  `item_group_id` int DEFAULT NULL,
  `filed_type` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_prices`
--

CREATE TABLE `items_prices` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `list_id` int NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `list_quant` int DEFAULT '0',
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_sizes`
--

CREATE TABLE `items_sizes` (
  `id` int NOT NULL,
  `item_id` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_transaction`
--

CREATE TABLE `items_transaction` (
  `id` int NOT NULL,
  `tansaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_date` datetime NOT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `type` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `new_quantity` decimal(20,4) DEFAULT NULL,
  `old_quantity` decimal(20,4) DEFAULT NULL,
  `remain_quantity` decimal(20,4) DEFAULT NULL,
  `incom_id` int NOT NULL,
  `incom_return_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `back_id` int NOT NULL,
  `problem_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `store_from` int NOT NULL DEFAULT '0',
  `store_to` int NOT NULL DEFAULT '0',
  `replaced` tinyint NOT NULL DEFAULT '0',
  `supplier_id` int NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb3_unicode_ci,
  `manuf_order` int NOT NULL,
  `order_no` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `pay_price` decimal(20,4) DEFAULT NULL,
  `related_item_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_type`
--

CREATE TABLE `items_type` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_report` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrange_type` int NOT NULL DEFAULT '1',
  `hiddentouch` int NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `display_order` int NOT NULL DEFAULT '0',
  `mobile_id` int DEFAULT NULL,
  `published` int NOT NULL DEFAULT '1',
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `printer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kitchen_use` tinyint(1) NOT NULL DEFAULT '1',
  `show_min_qty` tinyint(1) NOT NULL DEFAULT '1',
  `maintenance_use` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_unit`
--

CREATE TABLE `items_unit` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `unit_type` int NOT NULL DEFAULT '0',
  `unit_value` decimal(10,4) NOT NULL,
  `unit_price` decimal(10,4) NOT NULL,
  `unit_barcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Screenhidden` tinyint(1) NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `unit_einvoice_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_comments`
--

CREATE TABLE `item_comments` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `comment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_user_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_edit_price`
--

CREATE TABLE `item_edit_price` (
  `id` int NOT NULL,
  `item` int DEFAULT NULL,
  `old_price` decimal(10,4) DEFAULT NULL,
  `new_price` decimal(10,4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_id` int NOT NULL,
  `image_link` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_state` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_percent`
--

CREATE TABLE `item_percent` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `percent` decimal(10,0) NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_rates`
--

CREATE TABLE `item_rates` (
  `id` int NOT NULL,
  `shop_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_serials`
--

CREATE TABLE `item_serials` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `serial` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL,
  `income_id` int NOT NULL,
  `sale_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sold_date` date DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_vat`
--

CREATE TABLE `item_vat` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `vat_id` int NOT NULL,
  `vat_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = both, 1 = sales, 2 = purchases',
  `shop_id` int NOT NULL,
  `vat_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = increase, 1 = decrease'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lines`
--

CREATE TABLE `lines` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `representative_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `line_categories`
--

CREATE TABLE `line_categories` (
  `id` int NOT NULL,
  `line_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `line_cities`
--

CREATE TABLE `line_cities` (
  `id` int NOT NULL,
  `line_id` int NOT NULL,
  `city_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `line_clients`
--

CREATE TABLE `line_clients` (
  `id` int NOT NULL,
  `line_id` int NOT NULL,
  `client_id` int NOT NULL,
  `sat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `sun` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `mon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `tues` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `wedn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `thur` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit',
  `fri` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => skip, 1 => visit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_payments`
--

CREATE TABLE `log_payments` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `no_user` int NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EGP',
  `pay_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `plan` int NOT NULL,
  `approved` int NOT NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `convert_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transactionId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_user` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_system`
--

CREATE TABLE `log_system` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_event` datetime DEFAULT NULL,
  `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int NOT NULL,
  `bill_id` int DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_details`
--

CREATE TABLE `manufacturing_details` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `shop_id` int NOT NULL,
  `pay_price` decimal(20,6) DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_order`
--

CREATE TABLE `manufacturing_order` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `add_user` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `man_order`
--

CREATE TABLE `man_order` (
  `id` int NOT NULL,
  `order_date` date NOT NULL,
  `user_id` int NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT 'صفر للصرف واحد للتوريد',
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `man_order_details`
--

CREATE TABLE `man_order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `store_id` int NOT NULL,
  `quant` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int NOT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multi_supplier`
--

CREATE TABLE `multi_supplier` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int NOT NULL,
  `active` tinyint NOT NULL COMMENT '1 => active',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_role` tinyint NOT NULL COMMENT '0 => direct , 1 => items, 2 => sequence',
  `category` tinyint NOT NULL DEFAULT '0' COMMENT '0 => same, 1 => different',
  `main_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `relative_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'quantity - discount',
  `discount_value` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `discount_type` tinyint NOT NULL COMMENT '0 => percent , 1 => money',
  `main_condition` tinyint DEFAULT NULL COMMENT '0 => or , 1 => and, 2 => no condition',
  `relative_condition` tinyint DEFAULT NULL COMMENT '0 => or , 1 => and, 2 => no condition',
  `place` tinyint NOT NULL COMMENT '0 => dashborad , 1 => store , 2 => both',
  `show_offer` tinyint NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `offer_details`
--

CREATE TABLE `offer_details` (
  `id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `quant_after` int DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `total_price` decimal(10,4) DEFAULT NULL,
  `pay_price` decimal(10,4) DEFAULT NULL,
  `bolla` decimal(10,4) DEFAULT NULL,
  `sale_man` int DEFAULT NULL,
  `sale_point` int DEFAULT NULL,
  `date_sale` datetime DEFAULT NULL,
  `isservice` tinyint(1) DEFAULT NULL,
  `add_user` int DEFAULT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_process`
--

CREATE TABLE `offer_process` (
  `id` int NOT NULL,
  `date_process` datetime DEFAULT NULL,
  `bill_no` int DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `total_price` decimal(10,4) DEFAULT NULL,
  `discount` decimal(10,4) DEFAULT NULL,
  `net_price` decimal(10,4) DEFAULT NULL,
  `payment` decimal(10,4) DEFAULT NULL,
  `client_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_stat` tinyint(1) DEFAULT NULL,
  `balance` decimal(10,4) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `add_user` int DEFAULT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pay_process` tinyint(1) DEFAULT NULL,
  `during` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `sale_point_id` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_type` int DEFAULT '1',
  `bill_id` int DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outstoreorders`
--

CREATE TABLE `outstoreorders` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `client_id` int NOT NULL,
  `delivery_date` datetime NOT NULL,
  `order_state` int NOT NULL DEFAULT '0' COMMENT '0 new 1 ready 2 delivary 3 cancel',
  `bill_id` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outstoreordersdetials`
--

CREATE TABLE `outstoreordersdetials` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_id` int NOT NULL,
  `request` decimal(10,4) NOT NULL,
  `available` decimal(10,4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `total_price` decimal(10,4) NOT NULL,
  `notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outstoresetting`
--

CREATE TABLE `outstoresetting` (
  `shop_id` int NOT NULL,
  `StoreUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `StoreID` int NOT NULL,
  `StorePass` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatfromID` int DEFAULT NULL,
  `updatfromURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UpdatfromPass` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `generalID` int NOT NULL,
  `smallshopID` int NOT NULL,
  `supplier_id` int NOT NULL,
  `StorePercentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `StoreServices` decimal(10,2) NOT NULL DEFAULT '0.00',
  `StoreTransport` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `english_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` int DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_categories`
--

CREATE TABLE `pages_categories` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices_list`
--

CREATE TABLE `prices_list` (
  `id` int NOT NULL,
  `list_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int NOT NULL,
  `order_id` int NOT NULL DEFAULT '0',
  `rate_service` int NOT NULL DEFAULT '0',
  `rate_delivery` int NOT NULL DEFAULT '0',
  `rate_order` int NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int NOT NULL,
  `name_ar` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `related_items`
--

CREATE TABLE `related_items` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `related_item_id` int DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relative_shops`
--

CREATE TABLE `relative_shops` (
  `main_id` int NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `total` decimal(10,4) DEFAULT '0.0000',
  `status` int DEFAULT NULL,
  `no_bill` int DEFAULT NULL,
  `lon` decimal(11,8) DEFAULT NULL,
  `lat` decimal(11,8) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `fee` decimal(10,4) DEFAULT NULL,
  `fee_type` int DEFAULT NULL,
  `discount` decimal(10,4) DEFAULT '0.0000',
  `net` decimal(10,4) DEFAULT '0.0000',
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `advance` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `rest` decimal(10,4) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `sales_man` int DEFAULT NULL,
  `payment_type` int DEFAULT NULL,
  `fort_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trans_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `discount_type` int NOT NULL DEFAULT '1',
  `update_status` int NOT NULL DEFAULT '0',
  `bill_id` int NOT NULL DEFAULT '0',
  `cashier_alert` int DEFAULT '0',
  `order_type` int NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb3_unicode_ci,
  `device_status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `damage` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profit` decimal(10,4) DEFAULT NULL,
  `car_id` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment` decimal(20,4) DEFAULT '0.0000',
  `serial` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `warranty` int NOT NULL DEFAULT '0',
  `guarantee` tinyint NOT NULL DEFAULT '0',
  `total_fees` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `app_device` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sale_point_id` int NOT NULL DEFAULT '0',
  `network_id` int NOT NULL DEFAULT '0',
  `network_payment` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `network_only` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_coupons`
--

CREATE TABLE `request_coupons` (
  `id` int UNSIGNED NOT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` decimal(10,4) NOT NULL,
  `discount_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for percent, 1 for money',
  `shop_id` int UNSIGNED NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '0',
  `expire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_details`
--

CREATE TABLE `request_details` (
  `id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` decimal(10,4) DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `shop_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size_id` int DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  `outgoing_done` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `order_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `sale_price` decimal(10,4) DEFAULT NULL,
  `discount_percent` decimal(10,2) DEFAULT NULL,
  `item_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT '1',
  `cashier_alert` int DEFAULT '0',
  `card_type` int DEFAULT '0',
  `pay_price` decimal(10,4) DEFAULT NULL,
  `stop_time` timestamp NULL DEFAULT NULL,
  `item_fee` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_notes`
--

CREATE TABLE `request_notes` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_settings`
--

CREATE TABLE `request_settings` (
  `id` int UNSIGNED NOT NULL,
  `min_purchase` decimal(10,4) NOT NULL,
  `max_charge` decimal(10,4) NOT NULL,
  `fee` decimal(10,4) NOT NULL,
  `fee_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for percent, 1 for money',
  `shop_id` int UNSIGNED NOT NULL,
  `back_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_cards` int DEFAULT NULL,
  `max_items` int DEFAULT NULL,
  `epay` tinyint(1) DEFAULT NULL,
  `bank` tinyint(1) DEFAULT NULL,
  `delivery` tinyint(1) DEFAULT NULL,
  `special_ad1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_ad2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(12,9) DEFAULT NULL,
  `lon` decimal(12,9) DEFAULT NULL,
  `banks_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_discount`
--

CREATE TABLE `salary_discount` (
  `id` int NOT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_id` int NOT NULL,
  `add_date` datetime NOT NULL,
  `add_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `edit_user` int NOT NULL,
  `discount_date` datetime NOT NULL COMMENT 'تاريخ تنفيذ الخصم',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT 'نفذ الخصم ام لا',
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_man`
--

CREATE TABLE `sales_man` (
  `id` int NOT NULL,
  `sales_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `client_group_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_back`
--

CREATE TABLE `sale_back` (
  `id` int NOT NULL,
  `date_back` datetime DEFAULT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int NOT NULL,
  `unit` int NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `pay_price` decimal(10,4) NOT NULL,
  `sale_ratio` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `basic_price` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `client_id` int DEFAULT NULL,
  `bill_id` int NOT NULL,
  `back_id` int NOT NULL,
  `pay_stat` tinyint(1) NOT NULL DEFAULT '1',
  `sale_point` int NOT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `item_vat_state` int NOT NULL DEFAULT '1',
  `item_serial` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_back_invoice`
--

CREATE TABLE `sale_back_invoice` (
  `id` int NOT NULL,
  `date_process` datetime NOT NULL,
  `sale_date` datetime NOT NULL,
  `store` int DEFAULT NULL,
  `total_price` decimal(10,4) NOT NULL,
  `discount` decimal(10,4) NOT NULL,
  `discount_type` tinyint(1) NOT NULL COMMENT '0 %',
  `net_price` decimal(10,4) NOT NULL,
  `boll_per` decimal(10,4) DEFAULT '0.0000',
  `sales_man` int NOT NULL DEFAULT '0',
  `payment` decimal(10,4) NOT NULL,
  `bil_payment` decimal(10,4) NOT NULL,
  `rest` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `client_id` int DEFAULT NULL,
  `clientOldBalance` decimal(10,4) DEFAULT NULL,
  `pay_stat` tinyint(1) NOT NULL DEFAULT '1',
  `balance` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `pay_date` date DEFAULT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `pay_process` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int NOT NULL,
  `bill_no` int NOT NULL DEFAULT '0',
  `notes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_time` datetime DEFAULT NULL,
  `notify_alert` tinyint(1) NOT NULL DEFAULT '0',
  `cooking` int NOT NULL DEFAULT '0',
  `insatllments_add` decimal(10,0) NOT NULL DEFAULT '0',
  `sale_id` int DEFAULT NULL,
  `local_bill_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_fee` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int NOT NULL,
  `sale_id` int NOT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items_id` int NOT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` int NOT NULL,
  `quantity` decimal(20,4) DEFAULT NULL,
  `quant_after` decimal(20,4) DEFAULT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `basic_price` decimal(20,4) DEFAULT NULL,
  `sale_ratio` decimal(20,4) DEFAULT NULL,
  `total_price` decimal(20,4) DEFAULT NULL,
  `pay_price` decimal(20,4) DEFAULT NULL,
  `av_pay_price` decimal(20,4) DEFAULT NULL,
  `ac_pay_price` decimal(20,4) DEFAULT NULL,
  `bolla` decimal(20,4) DEFAULT NULL,
  `sale_man` int NOT NULL DEFAULT '1',
  `sale_point` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `date_sale` datetime DEFAULT NULL,
  `isservice` int NOT NULL DEFAULT '0',
  `notify_alert` tinyint(1) NOT NULL DEFAULT '0',
  `notify_time` datetime DEFAULT NULL,
  `record_type` tinyint(1) NOT NULL DEFAULT '1',
  `label_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricePercentage` decimal(20,4) DEFAULT NULL,
  `item_serial` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL,
  `duration_type` int DEFAULT NULL COMMENT '0 -> by hour, 1 -> by day',
  `duration` decimal(20,2) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `item_vat_state` int NOT NULL DEFAULT '1',
  `item_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `cards` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `spare_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `glass_height` decimal(10,2) DEFAULT NULL,
  `glass_width` decimal(10,2) DEFAULT NULL,
  `glass_number` int DEFAULT NULL,
  `sales_row_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `offer_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_type` int DEFAULT NULL,
  `ratio_type` tinyint NOT NULL DEFAULT '0',
  `main_qty` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `disc_qty` decimal(10,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_points`
--

CREATE TABLE `sale_points` (
  `id` int NOT NULL,
  `point_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `money_point` decimal(20,4) DEFAULT '0.0000',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `store_id` int NOT NULL DEFAULT '0',
  `point_type` int NOT NULL DEFAULT '1' COMMENT '1 for salepoint 2 for visa account',
  `shop_id` int NOT NULL,
  `currency_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sale_points`
--

INSERT INTO `sale_points` (`id`, `point_name`, `money_point`, `add_date`, `store_id`, `point_type`, `shop_id`, `currency_text`, `currency_id`, `mobile_id`) VALUES
(1, 'Sonbol_point', '122974.0000', '2022-09-19 11:26:30', 1, 1, 21036, 'yen', 0, NULL),
(2, 'الرضا', '200.0000', '2022-10-13 13:45:03', 1, 1, 21036, 'جنيه', 0, NULL),
(3, 'تيست1', '200.0000', '2022-10-13 13:50:09', 1, 1, 21036, 'yen', 0, NULL),
(4, 'تيست2', '0.0000', '2022-10-13 13:50:21', 1, 1, 21036, 'yen', 0, NULL),
(6, 'تيست4', '0.0000', '2022-10-13 13:50:40', 1, 1, 21036, 'جنيه', 0, NULL),
(7, 'try', '0.0000', '2022-11-14 09:02:02', 1, 1, 21036, 'جنيه', 0, NULL),
(8, 'خزنة افتراضي', '0.0000', '2022-11-22 11:45:04', 1, 1, 12015, NULL, NULL, NULL),
(9, 'network safe', '600.0000', '2022-12-27 09:18:25', 1, 2, 21036, 'yen', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sale_process`
--

CREATE TABLE `sale_process` (
  `id` int NOT NULL,
  `date_process` datetime NOT NULL,
  `sale_date` datetime NOT NULL,
  `store` int DEFAULT NULL,
  `sale_point` int DEFAULT NULL,
  `total_price` decimal(20,4) DEFAULT NULL,
  `discount` decimal(20,4) DEFAULT NULL,
  `discount_type` tinyint(1) NOT NULL COMMENT '0 %',
  `net_price` decimal(20,4) DEFAULT NULL,
  `boll_per` decimal(20,4) DEFAULT NULL,
  `sales_man` int NOT NULL DEFAULT '0',
  `payment` decimal(20,4) DEFAULT NULL,
  `bil_payment` decimal(20,4) DEFAULT NULL,
  `rest` decimal(20,4) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `clientOldBalance` decimal(20,4) DEFAULT NULL,
  `pay_stat` tinyint(1) NOT NULL DEFAULT '1',
  `balance` decimal(20,4) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `pay_process` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` int NOT NULL,
  `bill_no` int NOT NULL DEFAULT '0',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notify_time` datetime DEFAULT NULL,
  `notify_alert` tinyint(1) NOT NULL DEFAULT '0',
  `cooking` int NOT NULL DEFAULT '0',
  `insatllments_add` decimal(20,0) DEFAULT NULL,
  `StoreTransport` decimal(20,4) DEFAULT NULL,
  `StoreServices` decimal(20,4) DEFAULT NULL,
  `car_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_type` int NOT NULL DEFAULT '0',
  `supplier_id` int NOT NULL DEFAULT '0',
  `supplierOldBalance` decimal(20,4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `notes_export` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notes_export2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fee` decimal(20,4) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `done_date` datetime DEFAULT NULL,
  `type` int DEFAULT '0',
  `fee_status` int NOT NULL DEFAULT '0',
  `local_bill_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_status` int NOT NULL DEFAULT '0',
  `server_bill_no` int NOT NULL DEFAULT '0',
  `show_bill` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `city_id` int NOT NULL DEFAULT '0',
  `bill_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_discount` decimal(10,4) DEFAULT '0.0000',
  `vat_discount_type` int DEFAULT '0',
  `vat_discount_value` decimal(10,4) DEFAULT '0.0000',
  `bill_service_id` int NOT NULL DEFAULT '0',
  `delivery_man_id` int NOT NULL DEFAULT '0',
  `delivery_date` timestamp NULL DEFAULT NULL,
  `bill_service_value` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `delivery_option_id` int NOT NULL DEFAULT '0',
  `delivery_period_id` int NOT NULL DEFAULT '0',
  `order_ready` int NOT NULL DEFAULT '1',
  `action_type` int NOT NULL DEFAULT '0',
  `charge_company_id` int NOT NULL DEFAULT '0',
  `checked_type` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `illegal` tinyint(1) NOT NULL DEFAULT '0',
  `request_id` int NOT NULL DEFAULT '0',
  `shipping_payment` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shipping_fee` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shipping_no` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_phone` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `network_notes` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_distances_prices`
--

CREATE TABLE `shipping_distances_prices` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `km_from` int DEFAULT NULL,
  `km_to` int DEFAULT NULL,
  `price_per_kilo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int NOT NULL,
  `size_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `src` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outside_link` tinyint(1) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_direct_messages`
--

CREATE TABLE `sms_direct_messages` (
  `id` int UNSIGNED NOT NULL,
  `message_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_history`
--

CREATE TABLE `sms_history` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `title` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_status` int NOT NULL,
  `receive_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_providers`
--

CREATE TABLE `sms_providers` (
  `id` int UNSIGNED NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_attr` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_attr` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unicode` tinyint(1) NOT NULL DEFAULT '0',
  `success_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_provider_additional_params`
--

CREATE TABLE `sms_provider_additional_params` (
  `id` int UNSIGNED NOT NULL,
  `sms_provider_id` int UNSIGNED NOT NULL,
  `parameter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_provider_messages`
--

CREATE TABLE `sms_provider_messages` (
  `id` int UNSIGNED NOT NULL,
  `sms_provider_id` int UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `status_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_provider_track_activity`
--

CREATE TABLE `sms_provider_track_activity` (
  `id` int UNSIGNED NOT NULL,
  `sms_provider_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `shop_id` int NOT NULL,
  `smsPackage` int NOT NULL,
  `SMSPass` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_title` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_welcome` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `welcome_status` int NOT NULL,
  `sms_count` int NOT NULL,
  `sms_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_status`
--

CREATE TABLE `sms_status` (
  `id` int NOT NULL,
  `code` int NOT NULL,
  `ar_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spare_parts`
--

CREATE TABLE `spare_parts` (
  `id` int NOT NULL,
  `car_id` int DEFAULT NULL COMMENT '0 for store',
  `item_id` int DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `store_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bill_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spending`
--

CREATE TABLE `spending` (
  `id` int NOT NULL,
  `spend_id` int NOT NULL,
  `spend_date` date NOT NULL,
  `amount` decimal(20,4) DEFAULT NULL,
  `Spend_for` int NOT NULL DEFAULT '0',
  `spend_type` int NOT NULL,
  `sale_point` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime NOT NULL,
  `shop_id` int NOT NULL,
  `bill_add_id` int DEFAULT NULL,
  `vat_value` decimal(20,0) DEFAULT NULL,
  `spend_file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `bill_no` int DEFAULT NULL,
  `local_id` int NOT NULL DEFAULT '0',
  `back_id` int NOT NULL DEFAULT '0',
  `sale_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spending_item`
--

CREATE TABLE `spending_item` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkitem` int NOT NULL DEFAULT '0' COMMENT '0genearl 1percetage 2service3transport ',
  `type` int DEFAULT '0' COMMENT '0 spend 1 import',
  `shop_id` int NOT NULL,
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int NOT NULL,
  `store_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `man_id` int NOT NULL DEFAULT '0',
  `for_damaged` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'التوالف',
  `shop_id` int NOT NULL,
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stop_flag` tinyint(1) DEFAULT NULL,
  `mobile_id` int DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `trade_number` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bill_header` text COLLATE utf8mb3_unicode_ci,
  `message_bill` text COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `store_name`, `man_id`, `for_damaged`, `shop_id`, `img`, `stop_flag`, `mobile_id`, `tax_number`, `trade_number`, `address`, `bill_header`, `message_bill`) VALUES
(1, 'store 0', 0, 0, 21036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'store 1', 0, 0, 21036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_items`
--

CREATE TABLE `store_items` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `store_id` int NOT NULL,
  `store_quant` decimal(20,2) DEFAULT NULL,
  `damaged` decimal(20,2) DEFAULT NULL,
  `default_quant` decimal(20,2) DEFAULT NULL,
  `shelf` int NOT NULL,
  `shop_id` int NOT NULL,
  `add_user` int NOT NULL,
  `add_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE `store_order` (
  `id` int NOT NULL,
  `order_no` int NOT NULL,
  `shop_id` int NOT NULL,
  `store_from` int NOT NULL,
  `store_to` int NOT NULL,
  `date_order` datetime NOT NULL,
  `add_user` int NOT NULL,
  `confirm` tinyint(1) NOT NULL DEFAULT '1',
  `date_confirm` datetime NOT NULL,
  `confirm_by` int NOT NULL,
  `cancel` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_shelfs`
--

CREATE TABLE `store_shelfs` (
  `id` int NOT NULL,
  `shelf_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int NOT NULL,
  `add_user` int NOT NULL,
  `Add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int NOT NULL,
  `edit_date` datetime DEFAULT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_transfer_items`
--

CREATE TABLE `store_transfer_items` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(10,4) NOT NULL,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_dates`
--

CREATE TABLE `subscription_dates` (
  `id` int NOT NULL,
  `sale_id` int NOT NULL,
  `service_id` int NOT NULL,
  `client_id` int NOT NULL,
  `session_date` date NOT NULL,
  `done` tinyint(1) NOT NULL,
  `shop_id` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_time` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_session` tinyint(1) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `recommendation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `employee_id` int NOT NULL,
  `session_price` decimal(10,0) NOT NULL DEFAULT '0',
  `employee_ratio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int NOT NULL,
  `supplier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `devices_company` int NOT NULL DEFAULT '0',
  `add_user` int DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int DEFAULT NULL,
  `edit_date` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `has_vat` int DEFAULT '0',
  `mobile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_orders`
--

CREATE TABLE `supplier_orders` (
  `id` int NOT NULL,
  `add_user` int NOT NULL,
  `edit_user` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `income_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_order_details`
--

CREATE TABLE `supplier_order_details` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_id` int NOT NULL,
  `supplier_order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_settings`
--

CREATE TABLE `sync_settings` (
  `id` int UNSIGNED NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('server','client') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_items_in_out`
--

CREATE TABLE `temp_items_in_out` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `ticket_reason_id` int UNSIGNED NOT NULL,
  `ticket_type_id` int UNSIGNED NOT NULL,
  `ticket_status_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` int UNSIGNED NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reasons`
--

CREATE TABLE `ticket_reasons` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `ticket_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types_cooking`
--

CREATE TABLE `types_cooking` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_img` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types_cooking_sales`
--

CREATE TABLE `types_cooking_sales` (
  `id` int NOT NULL,
  `sale_details_id` int NOT NULL,
  `type_id` int NOT NULL,
  `item_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_row_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int NOT NULL,
  `mobile_id` int DEFAULT NULL,
  `unit_einvoice_code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `employe_date` date NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `money_out` decimal(10,2) NOT NULL,
  `city_id` int NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `recipient` decimal(10,2) NOT NULL,
  `sale_point` int NOT NULL DEFAULT '1',
  `point_change` tinyint(1) DEFAULT '1',
  `privilege` int NOT NULL DEFAULT '1',
  `login` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_puplic` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_quick` tinyint(1) NOT NULL DEFAULT '1',
  `new_sale_disc` tinyint(1) NOT NULL DEFAULT '1',
  `return_sales_insert` tinyint(1) NOT NULL DEFAULT '1',
  `pay_sales` tinyint(1) NOT NULL DEFAULT '1',
  `cooking` int NOT NULL DEFAULT '1',
  `delivery` int NOT NULL DEFAULT '1',
  `incoming_bill` tinyint(1) NOT NULL DEFAULT '1',
  `incoming_bill_return` tinyint(1) NOT NULL DEFAULT '1',
  `incoming_show` tinyint(1) NOT NULL DEFAULT '1',
  `show_supplier` tinyint(1) NOT NULL DEFAULT '1',
  `new_supplier` tinyint(1) NOT NULL DEFAULT '1',
  `new_items` tinyint(1) NOT NULL DEFAULT '1',
  `show_items` tinyint(1) NOT NULL DEFAULT '1',
  `show_min` tinyint(1) NOT NULL DEFAULT '1',
  `show_bolla` tinyint(1) NOT NULL DEFAULT '1',
  `users` tinyint(1) NOT NULL DEFAULT '1',
  `show_clients_data` tinyint(1) NOT NULL DEFAULT '1',
  `setting` tinyint(1) NOT NULL DEFAULT '1',
  `show_clients` tinyint(1) NOT NULL DEFAULT '1',
  `change_date` tinyint(1) NOT NULL DEFAULT '1',
  `unites` tinyint(1) NOT NULL DEFAULT '1',
  `data` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Backup_copying',
  `add_user` int NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `edit_items` tinyint(1) NOT NULL DEFAULT '1',
  `show_day_total` tinyint(1) NOT NULL DEFAULT '1',
  `spending` tinyint(1) NOT NULL DEFAULT '1',
  `show_report` tinyint(1) NOT NULL DEFAULT '1',
  `show_pay_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'show pay price',
  `sale_discount` tinyint(1) NOT NULL DEFAULT '1',
  `sale_cash` tinyint(1) NOT NULL DEFAULT '1',
  `sale_price` tinyint(1) NOT NULL DEFAULT '1',
  `edit_payment` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'تعديل خانة الدفع فى صفحة المبيعات ',
  `send_alerts` int NOT NULL DEFAULT '1',
  `change_store` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'تغير مخزن البيع',
  `db_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shoes_test',
  `us_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'root',
  `fix_man` tinyint(1) NOT NULL DEFAULT '0',
  `work` tinyint(1) NOT NULL DEFAULT '1',
  `show_problems` tinyint(1) NOT NULL,
  `dbpassword` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `health_certificate` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `insurance_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `national_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `start_work` date NOT NULL,
  `shop_id` int NOT NULL,
  `enter_cards` tinyint(1) DEFAULT NULL,
  `sale_cards` tinyint(1) DEFAULT NULL,
  `type_user` tinyint(1) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `show_prices` int NOT NULL DEFAULT '1',
  `show_total_point` int NOT NULL DEFAULT '1',
  `api_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `change_shop` tinyint(1) NOT NULL DEFAULT '0',
  `search_in_shops` tinyint(1) NOT NULL DEFAULT '0',
  `clients_group` int NOT NULL DEFAULT '0',
  `month_deduct` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `type` int NOT NULL DEFAULT '0',
  `change_req_status` int NOT NULL DEFAULT '0',
  `create_req_bill` int NOT NULL DEFAULT '0',
  `assign_request` int NOT NULL DEFAULT '0',
  `manage_sms` int NOT NULL DEFAULT '1',
  `stop_flag` int NOT NULL DEFAULT '0',
  `accept_debentures` tinyint(1) NOT NULL DEFAULT '1',
  `edit_client_data` int NOT NULL DEFAULT '1',
  `covenant_value` int NOT NULL DEFAULT '0',
  `covenant_receive_date` date DEFAULT NULL,
  `covenant_destruction_date` date DEFAULT NULL,
  `covenant_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_messages` tinyint(1) DEFAULT NULL,
  `online_requests` tinyint(1) DEFAULT NULL,
  `barcode_inventory` tinyint(1) DEFAULT NULL,
  `temp_store_in_out` tinyint(1) DEFAULT NULL,
  `update_static_pages` tinyint(1) DEFAULT NULL,
  `update_socials` tinyint(1) DEFAULT NULL,
  `show_sliders` tinyint(1) DEFAULT NULL,
  `is_employee` int NOT NULL DEFAULT '0',
  `email_clients` tinyint(1) NOT NULL DEFAULT '0',
  `confirm_clients` tinyint(1) NOT NULL DEFAULT '0',
  `change_order_qty` tinyint(1) NOT NULL DEFAULT '0',
  `update_payment_gateway` int NOT NULL DEFAULT '0',
  `contact_info` int NOT NULL DEFAULT '0',
  `coupons` int NOT NULL DEFAULT '0',
  `website_discount` int NOT NULL DEFAULT '0',
  `request_settings` int NOT NULL DEFAULT '0',
  `player_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_bill_sale` tinyint(1) NOT NULL DEFAULT '1',
  `reservation_create` tinyint(1) NOT NULL DEFAULT '1',
  `reservation_edit` tinyint(1) NOT NULL DEFAULT '1',
  `reservation_show` tinyint(1) NOT NULL DEFAULT '1',
  `reservation_confirm` tinyint(1) NOT NULL DEFAULT '1',
  `reservation_delete` tinyint(1) NOT NULL DEFAULT '1',
  `add_spend` tinyint(1) NOT NULL DEFAULT '1',
  `confirm_spend` tinyint(1) NOT NULL DEFAULT '1',
  `edit_client` tinyint(1) NOT NULL DEFAULT '1',
  `delete_client` tinyint(1) NOT NULL DEFAULT '1',
  `money_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `receipt` tinyint(1) NOT NULL DEFAULT '1',
  `watch` tinyint(1) NOT NULL DEFAULT '1',
  `activate_multi_price` tinyint(1) NOT NULL DEFAULT '1',
  `commission` decimal(10,0) NOT NULL DEFAULT '0',
  `manufacture` int NOT NULL DEFAULT '1',
  `define_commissions` int DEFAULT '1',
  `tables_operations` tinyint(1) NOT NULL DEFAULT '0',
  `cities_operations` tinyint(1) NOT NULL DEFAULT '1',
  `client_prices_list` tinyint(1) NOT NULL DEFAULT '0',
  `offer_sales` tinyint(1) NOT NULL DEFAULT '0',
  `bill_services` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_man` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_periods` tinyint(1) NOT NULL DEFAULT '0',
  `show_vat_report` tinyint(1) NOT NULL DEFAULT '1',
  `save_bill` tinyint(1) NOT NULL DEFAULT '1',
  `print_ticket` tinyint(1) NOT NULL DEFAULT '1',
  `delivery_man_operations` tinyint(1) NOT NULL DEFAULT '0',
  `bill_services_operations` tinyint(1) NOT NULL DEFAULT '0',
  `tracking` tinyint NOT NULL DEFAULT '1',
  `make_bill` tinyint NOT NULL DEFAULT '1',
  `show_points` int NOT NULL DEFAULT '1',
  `sale_points_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `supervisor_can_edit_lines` tinyint(1) NOT NULL DEFAULT '0',
  `user_role` tinyint(1) NOT NULL DEFAULT '0',
  `supervisor_id` int NOT NULL DEFAULT '0',
  `show_maintenance_details` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `name`, `email`, `address`, `tel`, `birth_date`, `employe_date`, `salary`, `money_out`, `city_id`, `credit`, `recipient`, `sale_point`, `point_change`, `privilege`, `login`, `new_sale_puplic`, `new_sale_quick`, `new_sale_disc`, `return_sales_insert`, `pay_sales`, `cooking`, `delivery`, `incoming_bill`, `incoming_bill_return`, `incoming_show`, `show_supplier`, `new_supplier`, `new_items`, `show_items`, `show_min`, `show_bolla`, `users`, `show_clients_data`, `setting`, `show_clients`, `change_date`, `unites`, `data`, `add_user`, `add_date`, `edit_user`, `edit_date`, `edit_items`, `show_day_total`, `spending`, `show_report`, `show_pay_price`, `sale_discount`, `sale_cash`, `sale_price`, `edit_payment`, `send_alerts`, `change_store`, `db_name`, `us_name`, `fix_man`, `work`, `show_problems`, `dbpassword`, `job`, `job_number`, `health_certificate`, `insurance_number`, `national_id`, `start_work`, `shop_id`, `enter_cards`, `sale_cards`, `type_user`, `country_id`, `store_id`, `show_prices`, `show_total_point`, `api_token`, `change_shop`, `search_in_shops`, `clients_group`, `month_deduct`, `type`, `change_req_status`, `create_req_bill`, `assign_request`, `manage_sms`, `stop_flag`, `accept_debentures`, `edit_client_data`, `covenant_value`, `covenant_receive_date`, `covenant_destruction_date`, `covenant_description`, `show_messages`, `online_requests`, `barcode_inventory`, `temp_store_in_out`, `update_static_pages`, `update_socials`, `show_sliders`, `is_employee`, `email_clients`, `confirm_clients`, `change_order_qty`, `update_payment_gateway`, `contact_info`, `coupons`, `website_discount`, `request_settings`, `player_id`, `change_bill_sale`, `reservation_create`, `reservation_edit`, `reservation_show`, `reservation_confirm`, `reservation_delete`, `add_spend`, `confirm_spend`, `edit_client`, `delete_client`, `money_percent`, `receipt`, `watch`, `activate_multi_price`, `commission`, `manufacture`, `define_commissions`, `tables_operations`, `cities_operations`, `client_prices_list`, `offer_sales`, `bill_services`, `delivery_man`, `delivery_periods`, `show_vat_report`, `save_bill`, `print_ticket`, `delivery_man_operations`, `bill_services_operations`, `tracking`, `make_bill`, `show_points`, `sale_points_transfer`, `supervisor_can_edit_lines`, `user_role`, `supervisor_id`, `show_maintenance_details`) VALUES
(2, 'admin1', '$2y$10$nxKU/qNeik3P1w94f4df8.ZA80gRlUPs0cyOFqVqzQDtf4JRcmb0C', 'admin', '', '', '', '2021-01-20', '2021-01-05', '2000.00', '970.00', 2, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '2014-06-15 13:11:03', 2, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', '', NULL, NULL, NULL, NULL, '2021-02-02', 21036, 0, 0, 1, NULL, NULL, 0, 1, 'asd', 1, 0, 0, '0.0000', 0, 1, 1, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, '1234', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '10', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1),
(3, 'mahmoudkon', '$2y$10$dgag0hwiOyvZXK1UDEimsOzN1DfEC8NexK5WAmsO8d2DgI20/k.xS', 'Mahmoud Kon', '', '', '', '2021-01-20', '2021-01-05', '2000.00', '970.00', 2, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '2014-06-15 13:11:03', 2, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', '', NULL, NULL, NULL, NULL, '2021-02-02', 21036, 0, 0, 1, NULL, NULL, 1, 1, 'asd', 1, 0, 0, '0.0000', 0, 1, 1, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, '1234', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '10', 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1),
(35, 'hager71', '$2y$10$b8j6hdmqTMyQlbgARk60quBMYBQtqpXTkmfRXEk1Eg/5vwplUxkU6', 'hager', '', '', '', '0000-00-00', '0000-00-00', '3000.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '2021-05-30 10:39:08', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '', '', 0, 1, 0, '', 'teacher', NULL, NULL, NULL, NULL, '2021-05-30', 21036, NULL, NULL, NULL, NULL, 2, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(38, 'hassan95', '$2y$10$qrlw9SuTGXwOO0lDq2F.C.FJbUqzAFkYY4QW.P.4XngqdhqilcdIK', 'hassan', '', '', '', '0000-00-00', '0000-00-00', '3000.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '2021-12-11 06:35:17', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 'shoes_test', 'root', 0, 1, 0, '', '', NULL, NULL, NULL, NULL, '2021-12-01', 21036, NULL, NULL, NULL, NULL, 6, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(39, 'reda63', '$2y$10$qrlw9SuTGXwOO0lDq2F.C.FJbUqzAFkYY4QW.P.4XngqdhqilcdIK', 'reda', '', '', '', '0000-00-00', '0000-00-00', '1000.00', '0.00', 0, '0.00', '0.00', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, '2022-07-05 07:48:14', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 'shoes_test', 'root', 0, 0, 0, '', '', NULL, NULL, NULL, NULL, '2022-07-05', 21036, NULL, NULL, NULL, NULL, 0, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(47, 'Ahmed', '$2y$10$BhP2ytg8Ae4We/f9dDAZVO4w8frPFBW./6.Aeaf2mKe5YvT1OgTz6', 'Ahmed AbdElaziz', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-02 13:08:53', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(48, 'Adel', '$2y$10$MJZdU857c8GdjydHRx7go.4m/wrO4BJtE62kukibIZAhGT1CErf4a', 'Adel Ezzat', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, '2022-08-02 14:32:43', NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 0, 0, '', 0, 0, 3, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1),
(49, 'Ali', '$2y$10$/.ucrhP3.jCCW3sppSiIsu0hjUkR8MZw5LiMR0T8S4G3G2KUyzp6i', 'Mohamed', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-08 06:50:38', NULL, NULL, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 3, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(50, 'reda_123', '$2y$10$wInacx/DovdolS4L7pLZduhUiijE5TaGN7VR9SQRqrRMmdXrR5L8y', 'Reda Ahmed', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-15 06:54:58', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(51, 'Ali_gh', '$2y$10$BhP2ytg8Ae4We/f9dDAZVO4w8frPFBW./6.Aeaf2mKe5YvT1OgTz6', 'Ali Ebrahim', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-15 06:59:38', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 3, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(52, 'Ebrahim', '$2y$10$5mQTGJOUmqf8s1z/dVpJdunLb0IpxLa/FJi9AdYk8EE4bLyRgtnCW', 'Ebrahim Ali', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, '2022-08-15 07:14:39', NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 0, 0, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1),
(53, 'Emy_12', '$2y$10$OrYKFf0zw95DsG0lPPCsGumhOXd8kvxBwgooO9ciW/5xxuqTUP3k6', 'Emy mohamed', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-15 07:16:54', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(54, 'ramadan', '$2y$10$39DZgXARy0RDojvNuVizMOCvBv7pK5wxn8.bzHI.EWxHrfhunCKhi', 'Mohammed ramadan', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-25 13:12:14', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(55, 'reda_deutsch', '$2y$10$LuHSwZB6oAJJCzV55moFnu4.68WRHV7K4X3hiogE7tN2JTwKAdVkK', 'reda ahmed', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-09-01 11:41:00', NULL, NULL, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(56, 'Sonbol', '$2y$10$BhP2ytg8Ae4We/f9dDAZVO4w8frPFBW./6.Aeaf2mKe5YvT1OgTz6', 'Hussein Sonbol', 'sehssonbol2016@gmail.com', 'El-Mahalla El-Kubra', '01003795292', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-08-02 13:08:53', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(57, 'training', '$2y$10$c21/FO3Hv1e1.jt9LVBJpO5iQMVE1km6DAMs2Fs6qeyTePVx9F2mO', 'training', '', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-10-06 11:13:32', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 21036, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1),
(58, 'Ahmed_1', '$2y$10$DOPv0Me.2q04jBoME5fzO.Qy0tyDozrcaOUMLxDacZtgrfgKmFr.q', 'Ahmed', 'Ahmed', '', '', '0000-00-00', '0000-00-00', '0.00', '0.00', 0, '0.00', '0.00', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2022-11-22 11:45:04', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'shoes_test', 'root', 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 12015, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, 0, 0, '0.0000', 0, 0, 0, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '0.00', 1, 1, 1, '0', 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_location`
--

CREATE TABLE `user_location` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `shop_id` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lon` decimal(11,8) DEFAULT NULL,
  `lat` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int UNSIGNED NOT NULL,
  `src` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_back`
-- (See below for the actual view)
--
CREATE TABLE `view_back` (
`back_pay_price` decimal(63,8)
,`back_pay_price_without_vat` decimal(63,8)
,`date_back` varchar(10)
,`net_back` decimal(61,6)
,`net_back_without_vat` decimal(61,6)
,`quantity_back` decimal(42,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_destroyed_items`
-- (See below for the actual view)
--
CREATE TABLE `view_destroyed_items` (
`action_date` varchar(10)
,`total_detroyed` decimal(62,8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_imports`
-- (See below for the actual view)
--
CREATE TABLE `view_imports` (
`import_date` varchar(10)
,`total_import` decimal(42,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_net_sales`
-- (See below for the actual view)
--
CREATE TABLE `view_net_sales` (
`back_pay_price` decimal(63,8)
,`back_pay_price_without_vat` decimal(63,8)
,`date_back` varchar(10)
,`net_back` decimal(61,6)
,`net_back_without_vat` decimal(61,6)
,`netpayprice` decimal(63,8)
,`netpayprice_withoutvat` decimal(63,8)
,`netprice` decimal(61,6)
,`netprice_withoutvat` decimal(61,6)
,`quantity_back` decimal(42,4)
,`quantity_sales` decimal(42,4)
,`sale_date` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_sale`
-- (See below for the actual view)
--
CREATE TABLE `view_sale` (
`netpayprice` decimal(63,8)
,`netpayprice_withoutvat` decimal(63,8)
,`netprice` decimal(61,6)
,`netprice_withoutvat` decimal(61,6)
,`quantity_sales` decimal(42,4)
,`sale_date` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_sales_spend`
-- (See below for the actual view)
--
CREATE TABLE `view_sales_spend` (
`action_date` varchar(10)
,`amount` decimal(64,4)
,`import_date` varchar(10)
,`sale_date` varchar(10)
,`spend_date` varchar(10)
,`total_detroyed` decimal(62,8)
,`total_earn` decimal(65,8)
,`total_import` decimal(42,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_spend`
-- (See below for the actual view)
--
CREATE TABLE `view_spend` (
`amount` decimal(64,4)
,`spend_date` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_spend_prepare`
-- (See below for the actual view)
--
CREATE TABLE `view_spend_prepare` (
`amount` decimal(42,4)
,`spend_date` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_total_earn`
-- (See below for the actual view)
--
CREATE TABLE `view_total_earn` (
`sale_date` varchar(10)
,`total_earn` decimal(65,8)
);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` int NOT NULL,
  `visit_date` date NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int NOT NULL,
  `country_code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `view_back`
--
DROP TABLE IF EXISTS `view_back`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_back`  AS SELECT date_format(`i`.`invoice_date`,'%Y/%m/%d') AS `date_back`, sum(if((`items`.`vat_state` = 1),((truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`) + (select ifnull(sum(`invoices_details_vats`.`vat_weight`),0) from ((`invoices_details_vats` left join `invoices_details` on(((`invoices_details_vats`.`invoice_id` = `invoices_details`.`invoice_id`) and (`invoices_details_vats`.`shop_id` = 21036) and (`invoices_details_vats`.`item_id` = `invoices_details`.`item_id`)))) left join `invoices_` on((`invoices_`.`id` = `invoices_details`.`invoice_id`))) where ((`invoices_details`.`item_id` = `items`.`id`) and (`invoices_details`.`invoice_id` = `invoices_`.`id`) and (`invoices_`.`invoice_type` = 3) and (`invoices_details_vats`.`invoice_id` = `i`.`id`) and (`invoices_details`.`id` = `i_d`.`id`) and (`i_d`.`unit_id` = `invoices_details_vats`.`unit_id`)))),(truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`))) AS `net_back`, sum(if((`items`.`vat_state` = 2),((truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`) - (select ifnull(sum(`invoices_details_vats`.`vat_weight`),0) from ((`invoices_details_vats` left join `invoices_details` on(((`invoices_details_vats`.`invoice_id` = `invoices_details`.`invoice_id`) and (`invoices_details_vats`.`shop_id` = 21036) and (`invoices_details_vats`.`item_id` = `invoices_details`.`item_id`)))) left join `invoices_` on((`invoices_`.`id` = `invoices_details`.`invoice_id`))) where ((`invoices_details`.`item_id` = `items`.`id`) and (`invoices_details`.`invoice_id` = `invoices_`.`id`) and (`invoices_`.`invoice_type` = 1) and (`invoices_details_vats`.`invoice_id` = `i`.`id`) and (`invoices_details`.`id` = `i_d`.`id`) and (`i_d`.`unit_id` = `invoices_details_vats`.`unit_id`)))),(truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`))) AS `net_back_without_vat`, sum(if((`items`.`purchase_vat_state` = 1),((truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`) + (`i_d`.`pay_vats_weight` * `i_d`.`quantity`)),(truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`))) AS `back_pay_price`, sum(if((`items`.`purchase_vat_state` = 2),((truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`) - (`i_d`.`pay_vats_weight` * `i_d`.`quantity`)),(truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`))) AS `back_pay_price_without_vat`, sum(`i_d`.`quantity`) AS `quantity_back` FROM (`invoices_` `i` join (`items` join `invoices_details` `i_d`)) WHERE ((`items`.`id` = `i_d`.`item_id`) AND (`i`.`shop_id` = 21036) AND (`i`.`id` = `i_d`.`invoice_id`) AND (cast(`i`.`invoice_date` as date) = '') AND (`i`.`invoice_type` = 3)) GROUP BY cast(`date_back` as date) ORDER BY `date_back` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_destroyed_items`
--
DROP TABLE IF EXISTS `view_destroyed_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_destroyed_items`  AS SELECT date_format(`invoices_`.`transaction_date`,'%Y/%m/%d') AS `action_date`, sum((`invoices_details`.`pay_price` * `invoices_details`.`quantity`)) AS `total_detroyed` FROM (`invoices_` left join `invoices_details` on((`invoices_details`.`invoice_id` = `invoices_`.`id`))) WHERE ((`invoices_`.`shop_id` = 21036) AND (`invoices_`.`invoice_type` = 18) AND (cast(`invoices_`.`transaction_date` as date) = '')) GROUP BY cast(`invoices_`.`transaction_date` as date)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_imports`
--
DROP TABLE IF EXISTS `view_imports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_imports`  AS SELECT date_format(`imports`.`import_date`,'%Y/%m/%d') AS `import_date`, sum(`imports`.`amount`) AS `total_import` FROM `imports` WHERE ((`imports`.`shop_id` = 21036) AND (cast(`imports`.`import_date` as date) = '')) GROUP BY cast(`imports`.`import_date` as date)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_net_sales`
--
DROP TABLE IF EXISTS `view_net_sales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_net_sales`  AS SELECT `view_sale`.`sale_date` AS `sale_date`, `view_sale`.`netprice` AS `netprice`, `view_sale`.`netprice_withoutvat` AS `netprice_withoutvat`, `view_sale`.`netpayprice` AS `netpayprice`, `view_sale`.`netpayprice_withoutvat` AS `netpayprice_withoutvat`, `view_sale`.`quantity_sales` AS `quantity_sales`, `view_back`.`date_back` AS `date_back`, `view_back`.`net_back` AS `net_back`, `view_back`.`net_back_without_vat` AS `net_back_without_vat`, `view_back`.`back_pay_price` AS `back_pay_price`, `view_back`.`back_pay_price_without_vat` AS `back_pay_price_without_vat`, `view_back`.`quantity_back` AS `quantity_back` FROM (`view_sale` left join `view_back` on((`view_sale`.`sale_date` = `view_back`.`date_back`))) union select `view_sale`.`sale_date` AS `sale_date`,`view_sale`.`netprice` AS `netprice`,`view_sale`.`netprice_withoutvat` AS `netprice_withoutvat`,`view_sale`.`netpayprice` AS `netpayprice`,`view_sale`.`netpayprice_withoutvat` AS `netpayprice_withoutvat`,`view_sale`.`quantity_sales` AS `quantity_sales`,`view_back`.`date_back` AS `date_back`,`view_back`.`net_back` AS `net_back`,`view_back`.`net_back_without_vat` AS `net_back_without_vat`,`view_back`.`back_pay_price` AS `back_pay_price`,`view_back`.`back_pay_price_without_vat` AS `back_pay_price_without_vat`,`view_back`.`quantity_back` AS `quantity_back` from (`view_back` left join `view_sale` on((`view_back`.`date_back` = `view_sale`.`sale_date`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_sale`
--
DROP TABLE IF EXISTS `view_sale`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sale`  AS SELECT date_format(`i`.`invoice_date`,'%Y/%m/%d') AS `sale_date`, sum(if((`items`.`vat_state` = 1),((truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`) + (select ifnull(sum(`invoices_details_vats`.`vat_weight`),0) from ((`invoices_details_vats` left join `invoices_details` on(((`invoices_details_vats`.`invoice_id` = `invoices_details`.`invoice_id`) and (`invoices_details_vats`.`shop_id` = 21036) and (`invoices_details_vats`.`item_id` = `invoices_details`.`item_id`)))) left join `invoices_` on((`invoices_`.`id` = `invoices_details`.`invoice_id`))) where ((`invoices_details`.`item_id` = `items`.`id`) and (`invoices_details`.`invoice_id` = `invoices_`.`id`) and (`invoices_`.`invoice_type` = 1) and (`invoices_details_vats`.`invoice_id` = `i`.`id`) and (`invoices_details`.`id` = `i_d`.`id`) and (`i_d`.`unit_id` = `invoices_details_vats`.`unit_id`)))),(truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`))) AS `netprice`, sum(if((`items`.`vat_state` = 2),((truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`) - (select ifnull(sum(`invoices_details_vats`.`vat_weight`),0) from ((`invoices_details_vats` left join `invoices_details` on(((`invoices_details_vats`.`invoice_id` = `invoices_details`.`invoice_id`) and (`invoices_details_vats`.`shop_id` = 21036) and (`invoices_details_vats`.`item_id` = `invoices_details`.`item_id`)))) left join `invoices_` on((`invoices_`.`id` = `invoices_details`.`invoice_id`))) where ((`invoices_details`.`item_id` = `items`.`id`) and (`invoices_details`.`invoice_id` = `invoices_`.`id`) and (`invoices_`.`invoice_type` = 1) and (`invoices_details_vats`.`invoice_id` = `i`.`id`) and (`invoices_details`.`id` = `i_d`.`id`) and (`i_d`.`unit_id` = `invoices_details_vats`.`unit_id`)))),(truncate(`i_d`.`sale_price`,2) * `i_d`.`quantity`))) AS `netprice_withoutvat`, sum(if((`items`.`purchase_vat_state` = 1),((truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`) + (`i_d`.`pay_vats_weight` * `i_d`.`quantity`)),(truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`))) AS `netpayprice`, sum(if((`items`.`purchase_vat_state` = 2),((truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`) - (`i_d`.`pay_vats_weight` * `i_d`.`quantity`)),(truncate(`i_d`.`pay_price`,2) * `i_d`.`quantity`))) AS `netpayprice_withoutvat`, sum(`i_d`.`quantity`) AS `quantity_sales` FROM (`invoices_` `i` join (`items` join `invoices_details` `i_d`)) WHERE ((`items`.`id` = `i_d`.`item_id`) AND (`i`.`shop_id` = 21036) AND (`i`.`id` = `i_d`.`invoice_id`) AND (cast(`i`.`invoice_date` as date) = '') AND (`i`.`invoice_type` = 1)) GROUP BY cast(`sale_date` as date) ORDER BY `sale_date` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_sales_spend`
--
DROP TABLE IF EXISTS `view_sales_spend`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sales_spend`  AS SELECT `view_spend`.`spend_date` AS `spend_date`, `view_spend`.`amount` AS `amount`, `view_total_earn`.`sale_date` AS `sale_date`, `view_total_earn`.`total_earn` AS `total_earn`, `view_imports`.`import_date` AS `import_date`, `view_imports`.`total_import` AS `total_import`, `view_destroyed_items`.`action_date` AS `action_date`, `view_destroyed_items`.`total_detroyed` AS `total_detroyed` FROM (((`view_spend` left join `view_total_earn` on((`view_spend`.`spend_date` = `view_total_earn`.`sale_date`))) left join `view_imports` on((`view_spend`.`spend_date` = `view_imports`.`import_date`))) left join `view_destroyed_items` on((`view_destroyed_items`.`action_date` = `view_spend`.`spend_date`))) union select `view_spend`.`spend_date` AS `spend_date`,`view_spend`.`amount` AS `amount`,`view_total_earn`.`sale_date` AS `sale_date`,`view_total_earn`.`total_earn` AS `total_earn`,`view_imports`.`import_date` AS `import_date`,`view_imports`.`total_import` AS `total_import`,`view_destroyed_items`.`action_date` AS `action_date`,`view_destroyed_items`.`total_detroyed` AS `total_detroyed` from (((`view_total_earn` left join `view_spend` on((`view_spend`.`spend_date` = `view_total_earn`.`sale_date`))) left join `view_imports` on((`view_imports`.`import_date` = `view_total_earn`.`sale_date`))) left join `view_destroyed_items` on((`view_destroyed_items`.`action_date` = `view_total_earn`.`sale_date`))) union select `view_spend`.`spend_date` AS `spend_date`,`view_spend`.`amount` AS `amount`,`view_total_earn`.`sale_date` AS `sale_date`,`view_total_earn`.`total_earn` AS `total_earn`,`view_imports`.`import_date` AS `import_date`,`view_imports`.`total_import` AS `total_import`,`view_destroyed_items`.`action_date` AS `action_date`,`view_destroyed_items`.`total_detroyed` AS `total_detroyed` from (((`view_imports` left join `view_spend` on((`view_imports`.`import_date` = `view_spend`.`spend_date`))) left join `view_total_earn` on((`view_imports`.`import_date` = `view_total_earn`.`sale_date`))) left join `view_destroyed_items` on((`view_destroyed_items`.`action_date` = `view_imports`.`import_date`))) union select `view_spend`.`spend_date` AS `spend_date`,`view_spend`.`amount` AS `amount`,`view_total_earn`.`sale_date` AS `sale_date`,`view_total_earn`.`total_earn` AS `total_earn`,`view_imports`.`import_date` AS `import_date`,`view_imports`.`total_import` AS `total_import`,`view_destroyed_items`.`action_date` AS `action_date`,`view_destroyed_items`.`total_detroyed` AS `total_detroyed` from (((`view_destroyed_items` left join `view_spend` on((`view_destroyed_items`.`action_date` = `view_spend`.`spend_date`))) left join `view_total_earn` on((`view_destroyed_items`.`action_date` = `view_total_earn`.`sale_date`))) left join `view_imports` on((`view_destroyed_items`.`action_date` = `view_imports`.`import_date`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_spend`
--
DROP TABLE IF EXISTS `view_spend`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_spend`  AS SELECT sum(`spending`.`amount`) AS `amount`, `spending`.`spend_date` AS `spend_date` FROM `view_spend_prepare` AS `spending` GROUP BY cast(`spending`.`spend_date` as date) ORDER BY `spending`.`spend_date` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_spend_prepare`
--
DROP TABLE IF EXISTS `view_spend_prepare`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_spend_prepare`  AS SELECT date_format(`spending`.`spend_date`,'%Y/%m/%d') AS `spend_date`, sum(`spending`.`amount`) AS `amount` FROM `spending` WHERE ((`spending`.`shop_id` = 21036) AND (cast(`spending`.`spend_date` as date) = '')) GROUP BY cast(`spending`.`spend_date` as date) union all select date_format(`emp_transaction`.`spend_date`,'%Y/%m/%d') AS `spend_date`,sum(`emp_transaction`.`amount`) AS `amount` from (`emp_transaction` join `client_transaction`) where ((`emp_transaction`.`shop_id` = 21036) and (`emp_transaction`.`type` in (42,43)) and (cast(`emp_transaction`.`spend_date` as date) = '') and (`emp_transaction`.`client_transaction` = `client_transaction`.`id`) and (`client_transaction`.`shop_id` = 21036)) group by cast(`emp_transaction`.`spend_date` as date)  ;

-- --------------------------------------------------------

--
-- Structure for view `view_total_earn`
--
DROP TABLE IF EXISTS `view_total_earn`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total_earn`  AS SELECT ifnull(`view_net_sales`.`sale_date`,`view_net_sales`.`date_back`) AS `sale_date`, ((ifnull(`view_net_sales`.`netprice`,0) - ifnull(`view_net_sales`.`netpayprice`,0)) - (ifnull(`view_net_sales`.`net_back`,0) - ifnull(`view_net_sales`.`back_pay_price`,0))) AS `total_earn` FROM `view_net_sales` ORDER BY ifnull(`view_net_sales`.`sale_date`,`view_net_sales`.`date_back`) ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_new_car`
--
ALTER TABLE `add_new_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `add_user` (`add_user`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attention`
--
ALTER TABLE `attention`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `badr_shop`
--
ALTER TABLE `badr_shop`
  ADD PRIMARY KEY (`serial_id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcodesetting`
--
ALTER TABLE `barcodesetting`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `bills_add`
--
ALTER TABLE `bills_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills_add_history`
--
ALTER TABLE `bills_add_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_images`
--
ALTER TABLE `bill_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_services`
--
ALTER TABLE `bill_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_setting`
--
ALTER TABLE `bill_setting`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `card_comanyes`
--
ALTER TABLE `card_comanyes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_numbers`
--
ALTER TABLE `card_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars_model`
--
ALTER TABLE `cars_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars_type`
--
ALTER TABLE `cars_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_engine`
--
ALTER TABLE `car_engine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_sub_types`
--
ALTER TABLE `car_sub_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_offers`
--
ALTER TABLE `category_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_cities`
--
ALTER TABLE `charge_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_cities_options`
--
ALTER TABLE `charge_cities_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_companies`
--
ALTER TABLE `charge_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_orders`
--
ALTER TABLE `charge_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_order_bills`
--
ALTER TABLE `charge_order_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_settings`
--
ALTER TABLE `checkout_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientid` (`id`,`shop_id`);

--
-- Indexes for table `clients_groups`
--
ALTER TABLE `clients_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_glasses`
--
ALTER TABLE `client_glasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_images`
--
ALTER TABLE `client_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_notifications`
--
ALTER TABLE `client_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_transaction`
--
ALTER TABLE `client_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `close_shift`
--
ALTER TABLE `close_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_car`
--
ALTER TABLE `color_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `component_request`
--
ALTER TABLE `component_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convert_money`
--
ALTER TABLE `convert_money`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convert_money_items`
--
ALTER TABLE `convert_money_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_options`
--
ALTER TABLE `delivery_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_quantities`
--
ALTER TABLE `detail_quantities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_cards`
--
ALTER TABLE `discount_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `einvoices`
--
ALTER TABLE `einvoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `submissionUUID` (`submissionUUID`),
  ADD UNIQUE KEY `longId` (`longId`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `einvoice_details`
--
ALTER TABLE `einvoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `einvoices_einvoice_id_foreign` (`einvoice_id`);

--
-- Indexes for table `einvoice_detail_vats`
--
ALTER TABLE `einvoice_detail_vats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `einvoices_details_item_id_foreign` (`item_id`),
  ADD KEY `einvoices_einvoice_id_foreign` (`einvoice_id`);

--
-- Indexes for table `einvoice_item_codes`
--
ALTER TABLE `einvoice_item_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `einvoice_settings`
--
ALTER TABLE `einvoice_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `einvoice_stages`
--
ALTER TABLE `einvoice_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_att` (`user_id`,`shop_id`,`date_attendance`);

--
-- Indexes for table `emp_transaction`
--
ALTER TABLE `emp_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factories`
--
ALTER TABLE `factories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_history`
--
ALTER TABLE `gift_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports_item`
--
ALTER TABLE `imports_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incoming_bill`
--
ALTER TABLE `incoming_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `incoming_date` (`incoming_date`),
  ADD KEY `add_user` (`add_user`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `supplier_bill_no` (`supplier_bill_no`);

--
-- Indexes for table `incoming_bill_return`
--
ALTER TABLE `incoming_bill_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `add_user` (`add_user`),
  ADD KEY `incom_id` (`incom_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `incoming_date` (`incoming_date`);

--
-- Indexes for table `incoming_details`
--
ALTER TABLE `incoming_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incoming_details_return`
--
ALTER TABLE `incoming_details_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installments_list`
--
ALTER TABLE `installments_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_details`
--
ALTER TABLE `inventory_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_`
--
ALTER TABLE `invoices_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_date` (`invoice_date`,`shop_id`),
  ADD KEY `sale_date_2` (`invoice_date`),
  ADD KEY `store` (`store_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `add_user` (`add_user`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `bill_no` (`bill_no`),
  ADD KEY `action_type` (`action_type`),
  ADD KEY `sales_man` (`sales_man`);

--
-- Indexes for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `unit` (`unit_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `safe_point_id` (`safe_point_id`),
  ADD KEY `add_user` (`add_user`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `invoices_details_vats`
--
ALTER TABLE `invoices_details_vats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `vat_id` (`vat_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`,`barcode`),
  ADD KEY `expire_date` (`expire_date`),
  ADD KEY `available` (`available`),
  ADD KEY `shop_id_2` (`shop_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `vat_id` (`vat_id`);

--
-- Indexes for table `items_car_types`
--
ALTER TABLE `items_car_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_collection`
--
ALTER TABLE `items_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_colors`
--
ALTER TABLE `items_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_execution`
--
ALTER TABLE `items_execution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_group`
--
ALTER TABLE `items_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_group_types`
--
ALTER TABLE `items_group_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_prices`
--
ALTER TABLE `items_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_id` (`item_id`,`list_id`);

--
-- Indexes for table `items_sizes`
--
ALTER TABLE `items_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_transaction`
--
ALTER TABLE `items_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_date` (`action_date`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `type` (`type`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `store_to` (`store_to`),
  ADD KEY `store_from` (`store_from`),
  ADD KEY `back_id` (`back_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `incom_return_id` (`incom_return_id`);

--
-- Indexes for table `items_type`
--
ALTER TABLE `items_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items_unit`
--
ALTER TABLE `items_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_comments`
--
ALTER TABLE `item_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_edit_price`
--
ALTER TABLE `item_edit_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_percent`
--
ALTER TABLE `item_percent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_rates`
--
ALTER TABLE `item_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_serials`
--
ALTER TABLE `item_serials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_vat`
--
ALTER TABLE `item_vat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_categories`
--
ALTER TABLE `line_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_cities`
--
ALTER TABLE `line_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_clients`
--
ALTER TABLE `line_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_payments`
--
ALTER TABLE `log_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_system`
--
ALTER TABLE `log_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_details`
--
ALTER TABLE `manufacturing_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturing_order`
--
ALTER TABLE `manufacturing_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `man_order`
--
ALTER TABLE `man_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `man_order_details`
--
ALTER TABLE `man_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_supplier`
--
ALTER TABLE `multi_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_details`
--
ALTER TABLE `offer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_process`
--
ALTER TABLE `offer_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outstoreorders`
--
ALTER TABLE `outstoreorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outstoreordersdetials`
--
ALTER TABLE `outstoreordersdetials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices_list`
--
ALTER TABLE `prices_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_items`
--
ALTER TABLE `related_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_coupons`
--
ALTER TABLE `request_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_details`
--
ALTER TABLE `request_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_notes`
--
ALTER TABLE `request_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_settings`
--
ALTER TABLE `request_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_discount`
--
ALTER TABLE `salary_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_man`
--
ALTER TABLE `sales_man`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_back`
--
ALTER TABLE `sale_back`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_back_invoice`
--
ALTER TABLE `sale_back_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_points`
--
ALTER TABLE `sale_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_process`
--
ALTER TABLE `sale_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_distances_prices`
--
ALTER TABLE `shipping_distances_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_direct_messages`
--
ALTER TABLE `sms_direct_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_history`
--
ALTER TABLE `sms_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_providers`
--
ALTER TABLE `sms_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_provider_additional_params`
--
ALTER TABLE `sms_provider_additional_params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_provider_messages`
--
ALTER TABLE `sms_provider_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_provider_track_activity`
--
ALTER TABLE `sms_provider_track_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `sms_status`
--
ALTER TABLE `sms_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spare_parts`
--
ALTER TABLE `spare_parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spending`
--
ALTER TABLE `spending`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spending_item`
--
ALTER TABLE `spending_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_items`
--
ALTER TABLE `store_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_order`
--
ALTER TABLE `store_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_shelfs`
--
ALTER TABLE `store_shelfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_transfer_items`
--
ALTER TABLE `store_transfer_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_dates`
--
ALTER TABLE `subscription_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_order_details`
--
ALTER TABLE `supplier_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sync_settings`
--
ALTER TABLE `sync_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_items_in_out`
--
ALTER TABLE `temp_items_in_out`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_reasons`
--
ALTER TABLE `ticket_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types_cooking`
--
ALTER TABLE `types_cooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types_cooking_sales`
--
ALTER TABLE `types_cooking_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_location`
--
ALTER TABLE `user_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_new_car`
--
ALTER TABLE `add_new_car`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attention`
--
ALTER TABLE `attention`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills_add`
--
ALTER TABLE `bills_add`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills_add_history`
--
ALTER TABLE `bills_add_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_images`
--
ALTER TABLE `bill_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_services`
--
ALTER TABLE `bill_services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_comanyes`
--
ALTER TABLE `card_comanyes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_numbers`
--
ALTER TABLE `card_numbers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars_model`
--
ALTER TABLE `cars_model`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars_type`
--
ALTER TABLE `cars_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_engine`
--
ALTER TABLE `car_engine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_sub_types`
--
ALTER TABLE `car_sub_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_offers`
--
ALTER TABLE `category_offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_cities`
--
ALTER TABLE `charge_cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_cities_options`
--
ALTER TABLE `charge_cities_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_companies`
--
ALTER TABLE `charge_companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_orders`
--
ALTER TABLE `charge_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_order_bills`
--
ALTER TABLE `charge_order_bills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkout_settings`
--
ALTER TABLE `checkout_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_groups`
--
ALTER TABLE `clients_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_glasses`
--
ALTER TABLE `client_glasses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_images`
--
ALTER TABLE `client_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_locations`
--
ALTER TABLE `client_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_notifications`
--
ALTER TABLE `client_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_transaction`
--
ALTER TABLE `client_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `close_shift`
--
ALTER TABLE `close_shift`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color_car`
--
ALTER TABLE `color_car`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component_request`
--
ALTER TABLE `component_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `convert_money`
--
ALTER TABLE `convert_money`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `convert_money_items`
--
ALTER TABLE `convert_money_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man`
--
ALTER TABLE `delivery_man`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_options`
--
ALTER TABLE `delivery_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_quantities`
--
ALTER TABLE `detail_quantities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_cards`
--
ALTER TABLE `discount_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoices`
--
ALTER TABLE `einvoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoice_details`
--
ALTER TABLE `einvoice_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoice_detail_vats`
--
ALTER TABLE `einvoice_detail_vats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoice_item_codes`
--
ALTER TABLE `einvoice_item_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoice_settings`
--
ALTER TABLE `einvoice_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `einvoice_stages`
--
ALTER TABLE `einvoice_stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_transaction`
--
ALTER TABLE `emp_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factories`
--
ALTER TABLE `factories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_history`
--
ALTER TABLE `gift_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports_item`
--
ALTER TABLE `imports_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incoming_bill`
--
ALTER TABLE `incoming_bill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incoming_bill_return`
--
ALTER TABLE `incoming_bill_return`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incoming_details`
--
ALTER TABLE `incoming_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incoming_details_return`
--
ALTER TABLE `incoming_details_return`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installments_list`
--
ALTER TABLE `installments_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_details`
--
ALTER TABLE `inventory_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_`
--
ALTER TABLE `invoices_`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_details_vats`
--
ALTER TABLE `invoices_details_vats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_car_types`
--
ALTER TABLE `items_car_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_collection`
--
ALTER TABLE `items_collection`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_colors`
--
ALTER TABLE `items_colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_execution`
--
ALTER TABLE `items_execution`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_group`
--
ALTER TABLE `items_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_group_types`
--
ALTER TABLE `items_group_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_prices`
--
ALTER TABLE `items_prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_sizes`
--
ALTER TABLE `items_sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_transaction`
--
ALTER TABLE `items_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_type`
--
ALTER TABLE `items_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_unit`
--
ALTER TABLE `items_unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_comments`
--
ALTER TABLE `item_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_edit_price`
--
ALTER TABLE `item_edit_price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_percent`
--
ALTER TABLE `item_percent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_rates`
--
ALTER TABLE `item_rates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_serials`
--
ALTER TABLE `item_serials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_vat`
--
ALTER TABLE `item_vat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lines`
--
ALTER TABLE `lines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_categories`
--
ALTER TABLE `line_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_cities`
--
ALTER TABLE `line_cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `line_clients`
--
ALTER TABLE `line_clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_payments`
--
ALTER TABLE `log_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_system`
--
ALTER TABLE `log_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_details`
--
ALTER TABLE `manufacturing_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturing_order`
--
ALTER TABLE `manufacturing_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `man_order`
--
ALTER TABLE `man_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `man_order_details`
--
ALTER TABLE `man_order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multi_supplier`
--
ALTER TABLE `multi_supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_details`
--
ALTER TABLE `offer_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_process`
--
ALTER TABLE `offer_process`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outstoreorders`
--
ALTER TABLE `outstoreorders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outstoreordersdetials`
--
ALTER TABLE `outstoreordersdetials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages_categories`
--
ALTER TABLE `pages_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices_list`
--
ALTER TABLE `prices_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `related_items`
--
ALTER TABLE `related_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_coupons`
--
ALTER TABLE `request_coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_details`
--
ALTER TABLE `request_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_notes`
--
ALTER TABLE `request_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_settings`
--
ALTER TABLE `request_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_discount`
--
ALTER TABLE `salary_discount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_man`
--
ALTER TABLE `sales_man`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_back`
--
ALTER TABLE `sale_back`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_back_invoice`
--
ALTER TABLE `sale_back_invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_points`
--
ALTER TABLE `sale_points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sale_process`
--
ALTER TABLE `sale_process`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_distances_prices`
--
ALTER TABLE `shipping_distances_prices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_direct_messages`
--
ALTER TABLE `sms_direct_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_history`
--
ALTER TABLE `sms_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_providers`
--
ALTER TABLE `sms_providers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_provider_additional_params`
--
ALTER TABLE `sms_provider_additional_params`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_provider_messages`
--
ALTER TABLE `sms_provider_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_provider_track_activity`
--
ALTER TABLE `sms_provider_track_activity`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `shop_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_status`
--
ALTER TABLE `sms_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spare_parts`
--
ALTER TABLE `spare_parts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spending`
--
ALTER TABLE `spending`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spending_item`
--
ALTER TABLE `spending_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `store_items`
--
ALTER TABLE `store_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_order`
--
ALTER TABLE `store_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_shelfs`
--
ALTER TABLE `store_shelfs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_transfer_items`
--
ALTER TABLE `store_transfer_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_dates`
--
ALTER TABLE `subscription_dates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_order_details`
--
ALTER TABLE `supplier_order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sync_settings`
--
ALTER TABLE `sync_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reasons`
--
ALTER TABLE `ticket_reasons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types_cooking`
--
ALTER TABLE `types_cooking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types_cooking_sales`
--
ALTER TABLE `types_cooking_sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `user_location`
--
ALTER TABLE `user_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `einvoice_details`
--
ALTER TABLE `einvoice_details`
  ADD CONSTRAINT `einvoice` FOREIGN KEY (`einvoice_id`) REFERENCES `einvoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `einvoice_detail_vats`
--
ALTER TABLE `einvoice_detail_vats`
  ADD CONSTRAINT `einvoice_id` FOREIGN KEY (`einvoice_id`) REFERENCES `einvoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `einvoice_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
