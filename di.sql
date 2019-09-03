-- Adminer 4.3.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `di` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `di`;

DROP TABLE IF EXISTS `author-authority-score-tracker`;
CREATE TABLE `author-authority-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author-authority-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `author-business-category-alignments`;
CREATE TABLE `author-business-category-alignments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author-business-category` int(11) NOT NULL,
  `author-business-sub-category` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `author-content-category-counts`;
CREATE TABLE `author-content-category-counts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author-business-category-published-count` int(11) NOT NULL,
  `author-business-sub-category-published-count` int(11) NOT NULL,
  `author-domain-type-published-count` int(11) NOT NULL,
  `author-domain-sub-type-publish-count` int(11) NOT NULL,
  `author-state-content-publish-count` int(11) NOT NULL,
  `author-city-content-publish-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `author-information`;
CREATE TABLE `author-information` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author-name` varchar(200) NOT NULL,
  `author-email-address` varchar(200) NOT NULL,
  `author-twitter-handle` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `author-performance-tracker`;
CREATE TABLE `author-performance-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total-journalist-estimated-content-views` int(11) NOT NULL,
  `avg-journalist-estimated-content-views` int(11) NOT NULL,
  `total-unique-journalist-coverage-sources` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `author-relationship`;
CREATE TABLE `author-relationship` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author-relationship-30-days` int(11) NOT NULL,
  `author-relationship-90-days` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `authorship-present-tracker`;
CREATE TABLE `authorship-present-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `authorship-present` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `auxiliary-content-quality-score-page`;
CREATE TABLE `auxiliary-content-quality-score-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `auxiliary-content-quality-score-page` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `backlink-anchor-text-tracker`;
CREATE TABLE `backlink-anchor-text-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `backlink-anchor-text` varchar(200) NOT NULL,
  `backlink-anchor-branded` tinyint(4) NOT NULL,
  `backlink-anchor-hybrid` tinyint(4) NOT NULL,
  `backlink-anchor-commercial` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `backlink-budget-required-page-1`;
CREATE TABLE `backlink-budget-required-page-1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `referring-domain-budget-page-1` int(11) NOT NULL,
  `referring-domain-budget-major-page-1` int(11) NOT NULL,
  `referring-domain-budget-minor-page-1` int(11) NOT NULL,
  `referring-domain-budget-local-page-1` int(11) NOT NULL,
  `referring-domain-budget-total-page-1` int(11) NOT NULL,
  `backlink-budget-page-1` int(11) NOT NULL,
  `backlink-budget-major-page-1` int(11) NOT NULL,
  `backlink-budget-minor-page-1` int(11) NOT NULL,
  `backlink-budget-local-page-1` int(11) NOT NULL,
  `backlink-budget-total-page-1` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `backlink-budget-required-pos-1`;
CREATE TABLE `backlink-budget-required-pos-1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `referring-domain-budget-pos-1` int(11) NOT NULL,
  `referring-domain-budget-major-pos-1` int(11) NOT NULL,
  `referring-domain-budget-minor-pos-1` int(11) NOT NULL,
  `referring-domain-budget-local-pos-1` int(11) NOT NULL,
  `backlink-budget-pos-1` int(11) NOT NULL,
  `backlink-budget-major-pos-1` int(11) NOT NULL,
  `backlink-budget-minor-pos-1` int(11) NOT NULL,
  `backlink-budget-local-pos-1` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `backlink-tracker-individual`;
CREATE TABLE `backlink-tracker-individual` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `backlink-source-url` varchar(200) NOT NULL,
  `business-category-name` varchar(200) NOT NULL,
  `business-sub-category-name` varchar(200) NOT NULL,
  `domain-general-label` varchar(200) NOT NULL,
  `state-name-in-title` varchar(200) NOT NULL,
  `city-name-in-title` varchar(200) NOT NULL,
  `backlink-age` int(11) NOT NULL,
  `page-backlink-acquisition-date` date NOT NULL,
  `backlink-individual-score` int(11) NOT NULL,
  `homepage-status` tinyint(4) NOT NULL,
  `navigation-status` tinyint(4) NOT NULL,
  `backlink-syndicated-status` tinyint(4) NOT NULL,
  `backlink-sponsored-status` tinyint(4) NOT NULL,
  `unnatural-influx-flag-status` tinyint(4) NOT NULL,
  `backlink-content-depth-value` int(11) NOT NULL,
  `backlink-relevancy-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-data-tracker`;
CREATE TABLE `brand-data-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand-mention-count` int(11) NOT NULL,
  `brand-mention-linked-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-review-tracker-expert`;
CREATE TABLE `brand-review-tracker-expert` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `expert-src-url` varchar(200) NOT NULL,
  `expert-src-review-standardized-value` int(11) NOT NULL,
  `expert-src-review-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-review-tracker-public`;
CREATE TABLE `brand-review-tracker-public` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `public-src-url` varchar(200) NOT NULL,
  `public-src-review-count` int(11) NOT NULL,
  `public-src-review-standardized-value` int(11) NOT NULL,
  `public-src-review-max-current-value` int(11) NOT NULL,
  `public-src-review-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-score-tracker`;
CREATE TABLE `brand-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand-equity-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-trust-rep-score`;
CREATE TABLE `brand-trust-rep-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand-trust-rep-score` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `brand-trust-rep-values`;
CREATE TABLE `brand-trust-rep-values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total-review-count` int(11) NOT NULL,
  `total-unique-sources-reviewed` int(11) NOT NULL,
  `average-review-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `branded-search-volume-tracker`;
CREATE TABLE `branded-search-volume-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand-search-volume` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `business-category-index`;
CREATE TABLE `business-category-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `business-category-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `business-sub-category-index`;
CREATE TABLE `business-sub-category-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `business-sub-category-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `car-brand-index`;
CREATE TABLE `car-brand-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `car-brand-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `car-brand-model-index`;
CREATE TABLE `car-brand-model-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `car-brand-model` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `citation-score-tracker`;
CREATE TABLE `citation-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `citation-score` float NOT NULL,
  `citation-source-present` tinyint(4) NOT NULL,
  `citation-count-value-greater-3` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `city-index`;
CREATE TABLE `city-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `city-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clicks-per-search-static`;
CREATE TABLE `clicks-per-search-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `element-name-adjustor` int(11) NOT NULL,
  `clicks-change-percentage` int(11) NOT NULL,
  `clicks-change-points` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `client-clicks-per-search-cps`;
CREATE TABLE `client-clicks-per-search-cps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-avg-clicks-per-search-cps` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `client-group-risk-score`;
CREATE TABLE `client-group-risk-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `group-risk-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `client-organic-search-share-oss`;
CREATE TABLE `client-organic-search-share-oss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-avg-organic-search-share-oss` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `client-search-click-distribution-scd`;
CREATE TABLE `client-search-click-distribution-scd` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-avg-search-click-distribution-scd` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `client-search-impression-rate-sir`;
CREATE TABLE `client-search-impression-rate-sir` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-avg-search-impression-rate-sir` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `content-informational-values`;
CREATE TABLE `content-informational-values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `who-value-header` tinyint(4) NOT NULL,
  `what-value-header` tinyint(4) NOT NULL,
  `how-value-header` tinyint(4) NOT NULL,
  `why-value-header` tinyint(4) NOT NULL,
  `where-value-header` tinyint(4) NOT NULL,
  `when-value-header` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `content-level-analysis`;
CREATE TABLE `content-level-analysis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `reading-level-score` int(11) NOT NULL,
  `total-sentences` int(11) NOT NULL,
  `readability-level` int(11) NOT NULL,
  `automated-readability-index` int(11) NOT NULL,
  `smog-readability-index` int(11) NOT NULL,
  `flesch-kincaid-index-score` int(11) NOT NULL,
  `total-syllables` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-business-category-align`;
CREATE TABLE `domain-business-category-align` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `business-category-name` int(11) NOT NULL,
  `domain-name` int(11) NOT NULL,
  `percentage-given` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `business-category-name` (`business-category-name`),
  CONSTRAINT `domain-business-category-align_ibfk_1` FOREIGN KEY (`business-category-name`) REFERENCES `business-category-index` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-contact-information`;
CREATE TABLE `domain-contact-information` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-contact-type` varchar(200) NOT NULL,
  `domain-contact-value` varchar(200) NOT NULL,
  `domain-owner-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-general-label`;
CREATE TABLE `domain-general-label` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-general-label` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-identifier-index`;
CREATE TABLE `domain-identifier-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-identifier` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-score-tracker`;
CREATE TABLE `domain-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-sub-type-index`;
CREATE TABLE `domain-sub-type-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-sub-type-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domain-type-index`;
CREATE TABLE `domain-type-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-type-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `domains-index`;
CREATE TABLE `domains-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-name` varchar(200) NOT NULL,
  `domain-age` int(11) NOT NULL,
  `domain-registration-length` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `duplicate-content-tracker`;
CREATE TABLE `duplicate-content-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `duplicate-content-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `est-domain-sub-type-cost-backlink`;
CREATE TABLE `est-domain-sub-type-cost-backlink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-sub-type-cost` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `est-domain-type-cost-backlink`;
CREATE TABLE `est-domain-type-cost-backlink` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-type-cost` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `expert-review-sources`;
CREATE TABLE `expert-review-sources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `expert-url-source` varchar(200) NOT NULL,
  `weight-given` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `folder-structure-tracker`;
CREATE TABLE `folder-structure-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `folder-structure-tracker` int(11) NOT NULL,
  `folder-structure-level` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `general-label-1`;
CREATE TABLE `general-label-1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Level 1` varchar(200) NOT NULL,
  `Change To` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `general-label-1` (`ID`, `Level 1`, `Change To`) VALUES
(1,	'Finance',	'Finance & Money'),
(2,	'Travel',	'Travel & Tourism'),
(3,	'Sports',	'Sports & Athletes'),
(4,	'Science',	'Science & Technology'),
(5,	'Health',	'Healthy & Lifestyle');

DROP TABLE IF EXISTS `google-api-level-1`;
CREATE TABLE `google-api-level-1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Level1` varchar(200) NOT NULL,
  `AlignedTo` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `google-api-level-1` (`ID`, `Level1`, `AlignedTo`) VALUES
(1,	'Adult',	'Good Match'),
(2,	'Arts & Entertainment',	'Good Match'),
(3,	'Autos & Vehicles',	'Good Match'),
(4,	'Beauty & Fitness',	'Good Match'),
(5,	'Books & Literature',	'Good Match'),
(6,	'Business & Industrial',	'Good Match'),
(7,	'Computers & Electronics',	'Good Match'),
(8,	'Finance',	'Translate'),
(9,	'Food & Drink',	'Good Match'),
(10,	'Games',	'Good Match'),
(11,	'Health',	'Translate'),
(12,	'Hobbies & Leisure',	'Good Match'),
(13,	'Home & Garden',	'Good Match'),
(14,	'Internet & Telecom',	'Good Match'),
(15,	'Jobs & Education',	'Good Match'),
(16,	'Law & Government',	'Good Match'),
(17,	'News',	'Good Match'),
(18,	'Online Communities',	'Good Match'),
(19,	'People & Society',	'Good Match'),
(20,	'Pets & Animals',	'Good Match'),
(21,	'Real Estate',	'Good Match'),
(22,	'Reference',	'Translate'),
(23,	'Science',	'Translate'),
(24,	'Sensitive Subjects',	'Good Match'),
(25,	'Shopping',	'Good Match'),
(26,	'Sports',	'Translate'),
(27,	'Travel',	'Translate');

DROP TABLE IF EXISTS `google-match-level-1-index`;
CREATE TABLE `google-match-level-1-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-1` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-level-2-index`;
CREATE TABLE `google-match-level-2-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-2` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-level-3-index`;
CREATE TABLE `google-match-level-3-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-3` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-1-align-index`;
CREATE TABLE `google-match-levevel-1-align-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-1-align` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-1-change-index`;
CREATE TABLE `google-match-levevel-1-change-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-1-change` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-2-align-index`;
CREATE TABLE `google-match-levevel-2-align-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-2-align` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-2-change-index`;
CREATE TABLE `google-match-levevel-2-change-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-2-change` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-3-align-index`;
CREATE TABLE `google-match-levevel-3-align-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-3-align` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `google-match-levevel-3-change-index`;
CREATE TABLE `google-match-levevel-3-change-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-match-level-3-change` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `group-difficulty-score`;
CREATE TABLE `group-difficulty-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `group-difficulty-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `group-risk-score`;
CREATE TABLE `group-risk-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `group-risk-score-top-10` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `group-stability-score`;
CREATE TABLE `group-stability-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `group-stability-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `internal-keyword-link-match-tracker`;
CREATE TABLE `internal-keyword-link-match-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-linked-navigation` tinyint(4) NOT NULL,
  `keyword-nav-internal-link-exact-match` tinyint(4) NOT NULL,
  `keyword-nav-internal-link-approx-match` tinyint(4) NOT NULL,
  `keyword-linked-homepage` tinyint(4) NOT NULL,
  `keyword-homepage-internal-link-exact-match` tinyint(4) NOT NULL,
  `keyword-homepage-internal-link-approx-match` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `internal-link-anchor-text`;
CREATE TABLE `internal-link-anchor-text` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-internal-link-from-anchor-text` varchar(200) NOT NULL,
  `page-internal-link-from-exact-match` tinyint(4) NOT NULL,
  `page-internal-link-from-approx-match` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `internal-links-tracker`;
CREATE TABLE `internal-links-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-internal-link-strength-value` int(11) NOT NULL,
  `page-internal-link-from-url` varchar(200) NOT NULL,
  `page-internal-link-from-url-homepage` tinyint(4) NOT NULL,
  `page-internal-link-from-url-navigation` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-clicks-per-search-cps`;
CREATE TABLE `keyword-clicks-per-search-cps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-clicks-per-search-cps` float NOT NULL,
  `page-avg-clicks-per-search-cps` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-conversion-logic-cpc`;
CREATE TABLE `keyword-conversion-logic-cpc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-cr-variable-cpc` int(11) NOT NULL,
  `keyword-cr-variabe-adjustment` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-conversion-logic-local`;
CREATE TABLE `keyword-conversion-logic-local` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-cr-variable-location` int(11) NOT NULL,
  `keyword-cr-variabe-adjustment` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-conversion-logic-position`;
CREATE TABLE `keyword-conversion-logic-position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-cr-variable-position` int(11) NOT NULL,
  `keyword-cr-variabe-adjustment` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-conversion-logic-trend`;
CREATE TABLE `keyword-conversion-logic-trend` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-cr-variable-trend` int(11) NOT NULL,
  `keyword-cr-variabe-adjustment` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-conversion-logic-type`;
CREATE TABLE `keyword-conversion-logic-type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-cr-variable-type` int(11) NOT NULL,
  `keyword-cr-variabe-adjustment` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-current-pos-data-tracker`;
CREATE TABLE `keyword-current-pos-data-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-current-pos-estimated-clicks` int(11) NOT NULL,
  `keyword-current-pos-estimated-ctr` int(11) NOT NULL,
  `keyword-current-pos-estimated-conversions` int(11) NOT NULL,
  `keyword-current-pos-estimated-revenue` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-difficulty-score`;
CREATE TABLE `keyword-difficulty-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-difficulty-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-forecast-est-conv-rate`;
CREATE TABLE `keyword-forecast-est-conv-rate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-month-setting` date NOT NULL,
  `keyword-forecast-estimated-cr-p1` int(11) NOT NULL,
  `keyword-forecast-estimated-cr-p2` int(11) NOT NULL,
  `keyword-forecast-estimated-cr-p3` int(11) NOT NULL,
  `keyword-forecast-estimated-cr-p5` int(11) NOT NULL,
  `keyword-forecast-estimated-cr-p7` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-forecast-est-ctr`;
CREATE TABLE `keyword-forecast-est-ctr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-month-setting` date NOT NULL,
  `keyword-ctr-p1` int(11) NOT NULL,
  `keyword-ctr-p2` int(11) NOT NULL,
  `keyword-ctr-p3` int(11) NOT NULL,
  `keyword-ctr-p4` int(11) NOT NULL,
  `keyword-ctr-p5` int(11) NOT NULL,
  `keyword-ctr-p6` int(11) NOT NULL,
  `keyword-ctr-p7` int(11) NOT NULL,
  `keyword-ctr-p8` int(11) NOT NULL,
  `keyword-ctr-p9` int(11) NOT NULL,
  `keyword-ctr-p10` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-forecast-est-revenue`;
CREATE TABLE `keyword-forecast-est-revenue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-forecast-estimated-rev-p1` int(11) NOT NULL,
  `keyword-forecast-estimated-rev-p2` int(11) NOT NULL,
  `keyword-forecast-estimated-rev-p3` int(11) NOT NULL,
  `keyword-forecast-estimated-rev-p5` int(11) NOT NULL,
  `keyword-forecast-estimated-rev-p7` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-forecast-est-search-impressions`;
CREATE TABLE `keyword-forecast-est-search-impressions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-month-setting` date NOT NULL,
  `keyword-traffic-pos1` int(11) NOT NULL,
  `keyword-traffic-pos2` int(11) NOT NULL,
  `keyword-traffic-pos3` int(11) NOT NULL,
  `keyword-traffic-pos4` int(11) NOT NULL,
  `keyword-traffic-pos5` int(11) NOT NULL,
  `keyword-traffic-pos6` int(11) NOT NULL,
  `keyword-traffic-pos7` int(11) NOT NULL,
  `keyword-traffic-pos8` int(11) NOT NULL,
  `keyword-traffic-pos9` int(11) NOT NULL,
  `keyword-traffic-pos10` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-forecast-est-search-traffic`;
CREATE TABLE `keyword-forecast-est-search-traffic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-month-setting` date NOT NULL,
  `keyword-traffic-pos1` int(11) NOT NULL,
  `keyword-traffic-pos2` int(11) NOT NULL,
  `keyword-traffic-pos3` int(11) NOT NULL,
  `keyword-traffic-pos4` int(11) NOT NULL,
  `keyword-traffic-pos5` int(11) NOT NULL,
  `keyword-traffic-pos6` int(11) NOT NULL,
  `keyword-traffic-pos7` int(11) NOT NULL,
  `keyword-traffic-pos8` int(11) NOT NULL,
  `keyword-traffic-pos9` int(11) NOT NULL,
  `keyword-traffic-pos10` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-index`;
CREATE TABLE `keyword-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-name` varchar(200) NOT NULL,
  `keyword-search-volume` int(11) NOT NULL,
  `keyword-cpc` int(11) NOT NULL,
  `keyword-type` varchar(200) NOT NULL,
  `keyword-prime-status` tinyint(4) NOT NULL,
  `keyword-ltv` int(11) NOT NULL,
  `keyword-ads-top-count` int(11) NOT NULL,
  `keyword-ads-bottom-count` int(11) NOT NULL,
  `keyword-word-count` int(11) NOT NULL,
  `keyword-is-question` tinyint(4) NOT NULL,
  `keyword-local-status` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-interest-tracker`;
CREATE TABLE `keyword-interest-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-interest-year` date NOT NULL,
  `keyword-interest-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-market-share-client`;
CREATE TABLE `keyword-market-share-client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-current-pos-search-market-share` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-organic-search-share-oss`;
CREATE TABLE `keyword-organic-search-share-oss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-organic-search-share-oss` float NOT NULL,
  `keyword-range-value-scoring` int(11) NOT NULL,
  `page-avg-organic-search-share-oss` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-position-time-tracker`;
CREATE TABLE `keyword-position-time-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-time-pos-1` int(11) NOT NULL,
  `keyword-time-pos-2-3` int(11) NOT NULL,
  `keyword-time-pos-4-10` int(11) NOT NULL,
  `keyword-time-pos-11-30` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-position-tracker`;
CREATE TABLE `keyword-position-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-position-tracker` int(11) NOT NULL,
  `keyword-peak-point-difference` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h1-tracker`;
CREATE TABLE `keyword-present-h1-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h1-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h1-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h2-tracker`;
CREATE TABLE `keyword-present-h2-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h2-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h2-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h3-tracker`;
CREATE TABLE `keyword-present-h3-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h3-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h3-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h4-tracker`;
CREATE TABLE `keyword-present-h4-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h4-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h4-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h5-tracker`;
CREATE TABLE `keyword-present-h5-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h5-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h5-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-h6-tracker`;
CREATE TABLE `keyword-present-h6-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h6-keyword-group-aligned` tinyint(4) NOT NULL,
  `page-h6-keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-present-p-all-tracker`;
CREATE TABLE `keyword-present-p-all-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-paragraphs-p-order` int(11) NOT NULL,
  `page-paragraphs-keyword` varchar(200) NOT NULL,
  `page-paragraphs-keyword-prime` tinyint(4) NOT NULL,
  `page-paragraphs-keyword-group-aligned` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-rankability-score`;
CREATE TABLE `keyword-rankability-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `group-rankability-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-risk-score`;
CREATE TABLE `keyword-risk-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-risk-score-7-days` float NOT NULL,
  `keyword-risk-score-1-month` float NOT NULL,
  `keyword-risk-score-3-month` float NOT NULL,
  `keyword-risk-score-6-month` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-search-click-distribution-scd`;
CREATE TABLE `keyword-search-click-distribution-scd` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-search-click-distribution-scd` float NOT NULL,
  `keyword-range-value-scoring` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-search-impression-rate-sir`;
CREATE TABLE `keyword-search-impression-rate-sir` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-search-impression-rate-sir-adjust` float NOT NULL,
  `keyword-range-value-scoring` int(11) NOT NULL,
  `page-avg-search-impression-rate-sir` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-search-volume-trend-tracker`;
CREATE TABLE `keyword-search-volume-trend-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-search-trend-month` date NOT NULL,
  `keyword-search-trend-volume` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-serp-features-tracker`;
CREATE TABLE `keyword-serp-features-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `serp-feature-aligned` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `keyword-stability-score`;
CREATE TABLE `keyword-stability-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword-stability-score` float NOT NULL,
  `keyword-pos-1-stability-score` int(11) NOT NULL,
  `keyword-pos-2-3-stability-score` int(11) NOT NULL,
  `keyword-pos-4-10-stability-score` int(11) NOT NULL,
  `keyword-total-changes` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lead-seo-page`;
CREATE TABLE `lead-seo-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `lead-seo-page-url` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `multi-media-score-tracker`;
CREATE TABLE `multi-media-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `multi-media-presence-score` float NOT NULL,
  `total-images-used` int(11) NOT NULL,
  `image-alt-tags-from-total` float NOT NULL,
  `video-content-used` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `needs-met-score-comm-middleman-tracker`;
CREATE TABLE `needs-met-score-comm-middleman-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `needs-met-score-commercial-middleman` float NOT NULL,
  `comm-middleman-company-mention-count` int(11) NOT NULL,
  `comm-middleman-table-list-count` int(11) NOT NULL,
  `comm-middleman-word-count` int(11) NOT NULL,
  `comm-middleman-heading-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `needs-met-score-comm-single-tracker`;
CREATE TABLE `needs-met-score-comm-single-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `needs-met-score-commercial-single` float NOT NULL,
  `comm-single-cta-above-fold` int(11) NOT NULL,
  `comm-single-word-count` int(11) NOT NULL,
  `comm-single-heading-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `needs-met-score-informational`;
CREATE TABLE `needs-met-score-informational` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `needs-met-score-informational` float NOT NULL,
  `info-needs-met-score-5-w` int(11) NOT NULL,
  `info-needs-met-score-word-count` int(11) NOT NULL,
  `info-needs-met-score-page-heading-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `organic-search-share-oss-points-range`;
CREATE TABLE `organic-search-share-oss-points-range` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `organic-share-range-value` int(11) NOT NULL,
  `organic-share-point-required-range` int(11) NOT NULL,
  `distribution-share-range-value` int(11) NOT NULL,
  `distribution-share-point-required-range` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `organic-search-share-oss-static`;
CREATE TABLE `organic-search-share-oss-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `element-name-adjustor` float NOT NULL,
  `organic-change-percentage` int(11) NOT NULL,
  `organic-change-points` int(11) NOT NULL,
  `distribution-change-percentage` int(11) NOT NULL,
  `distribution-change-points` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `outgoing-backlink-spam-score-tracker`;
CREATE TABLE `outgoing-backlink-spam-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outgoing-backlink-page-spam-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `outgoing-backlink-tracker`;
CREATE TABLE `outgoing-backlink-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outbound-link-quality-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-author-tracker`;
CREATE TABLE `page-author-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-author-tracker` char(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-backlink-acquisition-estimated`;
CREATE TABLE `page-backlink-acquisition-estimated` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-backlink-acquisition-estimated-aux` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-backlink-budget-required-seo`;
CREATE TABLE `page-backlink-budget-required-seo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-backlink-budget-required-seo` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-backlink-score-tracker`;
CREATE TABLE `page-backlink-score-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-backlink-score` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-body-tracker`;
CREATE TABLE `page-body-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-tbody-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-brand-mention-tracker`;
CREATE TABLE `page-brand-mention-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `brand-mention-text` varchar(200) NOT NULL,
  `brand-mention-anchor` varchar(200) NOT NULL,
  `brand-mention-anchor-url` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-budget-spent-values`;
CREATE TABLE `page-budget-spent-values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-budget-spent-content` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-budget-update-values`;
CREATE TABLE `page-budget-update-values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-update-budget-required-content` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-budget-values`;
CREATE TABLE `page-budget-values` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-budget-required-content` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-canonical-tracker`;
CREATE TABLE `page-canonical-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-canonical-status` tinyint(4) NOT NULL,
  `page-canonical-url` tinyint(4) NOT NULL,
  `page-canonical-self-reference-status` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-category-match-level-1`;
CREATE TABLE `page-category-match-level-1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-category-match-level-1` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-category-match-level-2`;
CREATE TABLE `page-category-match-level-2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-category-match-level-2` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-category-match-level-3`;
CREATE TABLE `page-category-match-level-3` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-category-match-level-3` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-collection-identifier`;
CREATE TABLE `page-collection-identifier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-url-stripped` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-contains-features`;
CREATE TABLE `page-contains-features` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-contains-table` tinyint(4) NOT NULL,
  `page-table-count` int(11) NOT NULL,
  `page-contains-lists` tinyint(4) NOT NULL,
  `page-list-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-content-budget-required-aux`;
CREATE TABLE `page-content-budget-required-aux` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-content-budget-required-aux` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-content-budget-required-seo`;
CREATE TABLE `page-content-budget-required-seo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-content-budget-required-seo` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-content-type-index`;
CREATE TABLE `page-content-type-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-content-type` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-cpc-average-static`;
CREATE TABLE `page-cpc-average-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-cpc-avg-static` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-cta-tracker`;
CREATE TABLE `page-cta-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-cta-present` tinyint(4) NOT NULL,
  `page-cta-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-elements-storage`;
CREATE TABLE `page-elements-storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-individual-elements` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h1-tracker`;
CREATE TABLE `page-h1-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h1-value` varchar(200) NOT NULL,
  `page-h1-order-value` int(11) NOT NULL,
  `keyword-present-h1` tinyint(4) NOT NULL,
  `primary-keyword-present-h1` tinyint(4) NOT NULL,
  `heading-values-h1-word-count` int(11) NOT NULL,
  `heading-values-h1-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h2-tracker`;
CREATE TABLE `page-h2-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h2-value` varchar(200) NOT NULL,
  `page-h2-order-value` int(11) NOT NULL,
  `keyword-present-h2` tinyint(4) NOT NULL,
  `primary-keyword-present-h2` tinyint(4) NOT NULL,
  `heading-values-h2-word-count` int(11) NOT NULL,
  `heading-values-h2-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h3-tracker`;
CREATE TABLE `page-h3-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h3-value` varchar(200) NOT NULL,
  `page-h3-order-value` int(11) NOT NULL,
  `keyword-present-h3` tinyint(4) NOT NULL,
  `primary-keyword-present-h3` tinyint(4) NOT NULL,
  `heading-values-h3-word-count` int(11) NOT NULL,
  `heading-values-h3-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h4-tracker`;
CREATE TABLE `page-h4-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h4-value` varchar(200) NOT NULL,
  `page-h4-order-value` int(11) NOT NULL,
  `keyword-present-h4` tinyint(4) NOT NULL,
  `primary-keyword-present-h4` tinyint(4) NOT NULL,
  `heading-values-h4-word-count` int(11) NOT NULL,
  `heading-values-h4-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h5-tracker`;
CREATE TABLE `page-h5-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h5-value` varchar(200) NOT NULL,
  `page-h5-order-value` int(11) NOT NULL,
  `keyword-present-h5` tinyint(4) NOT NULL,
  `primary-keyword-present-h5` tinyint(4) NOT NULL,
  `heading-values-h5-word-count` int(11) NOT NULL,
  `heading-values-h5-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-h6-tracker`;
CREATE TABLE `page-h6-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-h6-value` varchar(200) NOT NULL,
  `page-h6-order-value` int(11) NOT NULL,
  `keyword-present-h6` tinyint(4) NOT NULL,
  `primary-keyword-present-h6` tinyint(4) NOT NULL,
  `heading-values-h6-word-count` int(11) NOT NULL,
  `heading-values-h6-character-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-heading-change-tracker`;
CREATE TABLE `page-heading-change-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `heading-change-amount-h1` float NOT NULL,
  `heading-change-amount-h2` float NOT NULL,
  `heading-change-amount-h3` float NOT NULL,
  `heading-change-amount-h4` float NOT NULL,
  `heading-change-amount-h5` float NOT NULL,
  `heading-change-amount-h6` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-heading-count`;
CREATE TABLE `page-heading-count` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-heading-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-html-unprocessed`;
CREATE TABLE `page-html-unprocessed` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-html-unproc` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-internal-link-keyword-group-match`;
CREATE TABLE `page-internal-link-keyword-group-match` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-keyword-group-internal-link-count-em` varchar(200) NOT NULL,
  `page-keyword-group-internal-link-count-am` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-level-search-index-tracker`;
CREATE TABLE `page-level-search-index-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `google-index-status` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-local-relevancy-link-match`;
CREATE TABLE `page-local-relevancy-link-match` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `domain-city-to-page-match` int(11) NOT NULL,
  `domain-state-to-page-match` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-ltv-client`;
CREATE TABLE `page-ltv-client` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-ltv-client` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-ltv-static`;
CREATE TABLE `page-ltv-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-ltv-static` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-meta-description-change-tracker`;
CREATE TABLE `page-meta-description-change-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-meta-description-change-amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-meta-description-tracker`;
CREATE TABLE `page-meta-description-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-meta-description` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-missing-elements-tracker`;
CREATE TABLE `page-missing-elements-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-missing-elements` tinyint(4) NOT NULL,
  `page-contains-error-elements` tinyint(4) NOT NULL,
  `page-missing-title` tinyint(4) NOT NULL,
  `page-missing-meta-description` tinyint(4) NOT NULL,
  `page-title-too-long` tinyint(4) NOT NULL,
  `page-meta-description-too-long` tinyint(4) NOT NULL,
  `page-url-too-long` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-p-tag-change-amount`;
CREATE TABLE `page-p-tag-change-amount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-p-tag-change-amount` float NOT NULL,
  `page-p-tag-count-change` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-priority-level`;
CREATE TABLE `page-priority-level` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-priority` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-publishing-dates-tracker`;
CREATE TABLE `page-publishing-dates-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-publication-date` date NOT NULL,
  `page-content-type` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-publishing-update-dates-tracker`;
CREATE TABLE `page-publishing-update-dates-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-publication-update-date` date NOT NULL,
  `page-update-count-version` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-relevancy-link-match`;
CREATE TABLE `page-relevancy-link-match` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `backlink-page-general-label-match-count` int(11) NOT NULL,
  `backlink-page-bc-match-count` int(11) NOT NULL,
  `backlink-page-bsc-match-count` int(11) NOT NULL,
  `referring-domain-general-label-match-count` int(11) NOT NULL,
  `referring-domain-bc-match-count` int(11) NOT NULL,
  `referring-domain-bsc-match-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-response-tracker`;
CREATE TABLE `page-response-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-response-code` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-search-interest-trend`;
CREATE TABLE `page-search-interest-trend` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-interest-year` int(11) NOT NULL,
  `page-interest-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-search-volume-static`;
CREATE TABLE `page-search-volume-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-group-id` int(11) NOT NULL,
  `page-group-id-sample-url` int(11) NOT NULL,
  `page-search-volume-static` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-search-volume-trend`;
CREATE TABLE `page-search-volume-trend` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-search-trend-month` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-snippet-status-static`;
CREATE TABLE `page-snippet-status-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-snippet-status-static` tinyint(4) NOT NULL,
  `page-snippet-count-static` int(11) NOT NULL,
  `page-featured-snippet-status-static` int(11) NOT NULL,
  `page-local-snippet-status-static` int(11) NOT NULL,
  `page-knowledge-snippet-status-static` int(11) NOT NULL,
  `page-news-snippet-status-static` int(11) NOT NULL,
  `page-related-question-snippet-status-static` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-support-pages-linking`;
CREATE TABLE `page-support-pages-linking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total-seo-support-pages-to-page` int(11) NOT NULL,
  `total-aux-support-pages-to-page` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-syndication-tracker`;
CREATE TABLE `page-syndication-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-total-major-backlinks-syndicated` int(11) NOT NULL,
  `page-total-local-backlinks-syndicated` int(11) NOT NULL,
  `page-total-rd-major-backlinks-syndicated` int(11) NOT NULL,
  `page-total-rd-local-backlinks-syndicated` int(11) NOT NULL,
  `page-total-backlinks-syndicated` int(11) NOT NULL,
  `page-total-rd-syndicated` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-table-body-td-tracker`;
CREATE TABLE `page-table-body-td-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-table-body-td-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-table-row-tracker`;
CREATE TABLE `page-table-row-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-table-row-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-table-th-tracker`;
CREATE TABLE `page-table-th-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-table-th-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-table-usage-tracker`;
CREATE TABLE `page-table-usage-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-table-usage-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-technical-optimization-tracker-desktop`;
CREATE TABLE `page-technical-optimization-tracker-desktop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-technical-optimization-performance-score` float NOT NULL,
  `page-speed-ssio` int(11) NOT NULL,
  `page-avg-first-paint-load-speed-ssio` int(11) NOT NULL,
  `page-first-contentful-paind-load-speed-ssio` int(11) NOT NULL,
  `page-avg-frontend-time-speed-ssio` int(11) NOT NULL,
  `page-backend-load-time-speed-ssio` int(11) NOT NULL,
  `page-google-page-speed-score-gpsapi` int(11) NOT NULL,
  `page-dom-content-load-time-ssio` int(11) NOT NULL,
  `page-dom-interactive-time-ssio` int(11) NOT NULL,
  `page-server-connections-time-ssio` int(11) NOT NULL,
  `page-server-response-time-ssio` int(11) NOT NULL,
  `page-size-ssio` int(11) NOT NULL,
  `page-image-size-transfer-ssio` int(11) NOT NULL,
  `page-js-size-transfer-ssio` int(11) NOT NULL,
  `page-css-size-transfer-ssio` int(11) NOT NULL,
  `page-html-requests-ssio` int(11) NOT NULL,
  `page-css-requests-ssio` int(11) NOT NULL,
  `page-js-requests-ssio` int(11) NOT NULL,
  `page-image-requests-ssio` int(11) NOT NULL,
  `page-document-height-ssio` int(11) NOT NULL,
  `page-dom-elements-ssio` int(11) NOT NULL,
  `page-response-code-ssio` int(11) NOT NULL,
  `page-ssl-ssio` tinyint(4) NOT NULL,
  `page-https-ssio` tinyint(4) NOT NULL,
  `page-document-structure-score-ssio` int(11) NOT NULL,
  `page-document-best-practice-score-ssio` int(11) NOT NULL,
  `page-first-visual-change-ssio` int(11) NOT NULL,
  `page-last-visual-change-ssio` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-technical-optimization-tracker-mobile`;
CREATE TABLE `page-technical-optimization-tracker-mobile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mobile-optimization-score` float NOT NULL,
  `page-speed-ssio` int(11) NOT NULL,
  `page-avg-first-paint-load-speed-ssio` int(11) NOT NULL,
  `page-avg-frontend-time-speed-ssio` int(11) NOT NULL,
  `page-backend-load-time-speed-ssio` int(11) NOT NULL,
  `page-google-page-speed-score-gpsapi` int(11) NOT NULL,
  `page-dom-content-load-time-ssio` int(11) NOT NULL,
  `page-dom-interactive-time-ssio` int(11) NOT NULL,
  `page-server-connections-time-ssio` int(11) NOT NULL,
  `page-server-response-time-ssio` int(11) NOT NULL,
  `page-size-ssio` int(11) NOT NULL,
  `page-image-size-transfer-ssio` int(11) NOT NULL,
  `page-js-size-transfer-ssio` int(11) NOT NULL,
  `page-css-size-transfer-ssio` int(11) NOT NULL,
  `page-html-requests-ssio` int(11) NOT NULL,
  `page-css-requests-ssio` int(11) NOT NULL,
  `page-js-requests-ssio` int(11) NOT NULL,
  `page-image-requests-ssio` int(11) NOT NULL,
  `page-document-height-ssio` int(11) NOT NULL,
  `page-dom-elements-ssio` int(11) NOT NULL,
  `page-response-code-ssio` int(11) NOT NULL,
  `page-ssl-ssio` tinyint(4) NOT NULL,
  `page-https-ssio` tinyint(4) NOT NULL,
  `page-document-structure-score-ssio` int(11) NOT NULL,
  `page-document-best-practice-score-ssio` int(11) NOT NULL,
  `page-first-visual-change-ssio` int(11) NOT NULL,
  `page-last-visual-change-ssio` int(11) NOT NULL,
  `page-first-contentful-paind-load-speed-ssio` int(11) NOT NULL,
  `page-mobile-friendly-design` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-thread-tracker`;
CREATE TABLE `page-thread-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-thread-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-title-change-tracker`;
CREATE TABLE `page-title-change-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-title-change-amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-title-tracker`;
CREATE TABLE `page-title-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-title` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-total-backlink-peak-point`;
CREATE TABLE `page-total-backlink-peak-point` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-total-unique-backlink-peak-point` int(11) NOT NULL,
  `page-total-unique-backlink-peak-point-difference` int(11) NOT NULL,
  `page-total-backlink-peak-point` int(11) NOT NULL,
  `page-total-backlink-peak-point-difference` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-total-tables-used`;
CREATE TABLE `page-total-tables-used` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total-page-tables-present` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-tr-tracker`;
CREATE TABLE `page-tr-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-tr-tracker` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-update-budget-required-seo`;
CREATE TABLE `page-update-budget-required-seo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-update-budget-required-seo` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-url-length-tracker`;
CREATE TABLE `page-url-length-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-url-length` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `page-word-count`;
CREATE TABLE `page-word-count` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-word-count` int(11) NOT NULL,
  `page-p-tag-count` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `public-review-source-count`;
CREATE TABLE `public-review-source-count` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `public-reviews-needed` int(11) NOT NULL,
  `max-weight-given` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `public-review-sources`;
CREATE TABLE `public-review-sources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `public-url-source` varchar(200) NOT NULL,
  `weight-given` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-aux-content-syndicated-tracker`;
CREATE TABLE `publisher-aux-content-syndicated-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-total-aux-content-linked-company` int(11) NOT NULL,
  `publisher-total-content-syndicated` int(11) NOT NULL,
  `publisher-total-content-syndicated-link-company` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-content-engagement-tracker`;
CREATE TABLE `publisher-content-engagement-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-average-content-impressions` int(11) NOT NULL,
  `publisher-average-viewership-reach` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-industry-relevance-value`;
CREATE TABLE `publisher-industry-relevance-value` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-industry-relevance-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-journalist-tracker`;
CREATE TABLE `publisher-journalist-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publicaiton-total-unique-journalists` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-post-target-tracker`;
CREATE TABLE `publisher-post-target-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-total-bc-posts` int(11) NOT NULL,
  `publisher-total-bsc-posts` int(11) NOT NULL,
  `publisher-total-bc-state-posts` int(11) NOT NULL,
  `publisher-total-bc-city-posts` int(11) NOT NULL,
  `publisher-total-bsc-state-posts` int(11) NOT NULL,
  `publisher-total-bsc-city-posts` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-quality-score`;
CREATE TABLE `publisher-quality-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-quality-score` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-seo-content-syndicated-tracker`;
CREATE TABLE `publisher-seo-content-syndicated-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-total-seo-content-linked-company` int(11) NOT NULL,
  `publisher-total-content-syndicated` int(11) NOT NULL,
  `publisher-total-content-syndicated-link-company` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `publisher-total-content-syndicated-tracker`;
CREATE TABLE `publisher-total-content-syndicated-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `publisher-total-content-syndicated` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `referring-domain-backlinks-tracker`;
CREATE TABLE `referring-domain-backlinks-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `referring-domain-publisher-quality-score` int(11) NOT NULL,
  `referring-domain-backlink-age-average` int(11) NOT NULL,
  `referring-domain-backlink-last-date` date NOT NULL,
  `referring-domain-average-backlink-page-score` int(11) NOT NULL,
  `referring-domain-backlink-homepage-status-exists` tinyint(4) NOT NULL,
  `referring-domain-backlink-navigation-status-exists` tinyint(4) NOT NULL,
  `referring-domain-backlink-dofollow-percentage` tinyint(4) NOT NULL,
  `referring-domain-backlink-syndicated-percentage` tinyint(4) NOT NULL,
  `referring-domain-backlink-sponsored-status-percentage` tinyint(4) NOT NULL,
  `referring-domain-backlink-content-depth-value-average` int(11) NOT NULL,
  `referring-domain-backlink-relevancy-value-average` int(11) NOT NULL,
  `referring-domain-backlink-match-type-hybrid-count` tinyint(4) NOT NULL,
  `referring-domain-backlink-match-type-brand-count` tinyint(4) NOT NULL,
  `referring-domain-backlink-type-commercial-count` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `search-impression-rate-points-range`;
CREATE TABLE `search-impression-rate-points-range` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `impression-range-value` int(11) NOT NULL,
  `impression-point-required-range` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `search-impression-rate-static`;
CREATE TABLE `search-impression-rate-static` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `element-name-adjustor` int(11) NOT NULL,
  `impression-reduce-percentage` int(11) NOT NULL,
  `impression-reduce-points` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `search-snippet-index`;
CREATE TABLE `search-snippet-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `serp-feature-snippet-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `seo-content-quality-score-page`;
CREATE TABLE `seo-content-quality-score-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `seo-content-quality-score-page` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `seo-page-group-url-static-id`;
CREATE TABLE `seo-page-group-url-static-id` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-group-id` int(11) NOT NULL,
  `page-group-id-sample-url` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `site-architecture-score`;
CREATE TABLE `site-architecture-score` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `site-architecture-score` int(11) NOT NULL,
  `sitemap-presence` int(11) NOT NULL,
  `breadcrumb-navigation-coverage-value` int(11) NOT NULL,
  `average-page-seo-aux-crawl-depth` int(11) NOT NULL,
  `total-folder-count` int(11) NOT NULL,
  `average-pages-per-folder` int(11) NOT NULL,
  `internal-links-to-folders-dist-deviation` int(11) NOT NULL,
  `percentage-pages-linked-from-total` int(11) NOT NULL,
  `total-pages-indexed-percentage` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `special-technical-elements`;
CREATE TABLE `special-technical-elements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `schema-tags-present` tinyint(4) NOT NULL,
  `page-crawl-depth` int(11) NOT NULL,
  `page-code-text-ratio` float NOT NULL,
  `page-w3-quality-value` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `state-index`;
CREATE TABLE `state-index` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `state-name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `supplementary-content-tracker`;
CREATE TABLE `supplementary-content-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `supplementary-content-score` float NOT NULL,
  `s-content-presence` tinyint(4) NOT NULL,
  `s-content-block-count` int(11) NOT NULL,
  `s-content-relevancy` tinyint(4) NOT NULL,
  `s-content-link-count` int(11) NOT NULL,
  `ext-ad-destination` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `support-seo-page`;
CREATE TABLE `support-seo-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `support-seo-page-url` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `syndicated-content-data-tracker`;
CREATE TABLE `syndicated-content-data-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `syndicated-content-title` int(11) NOT NULL,
  `syndicated-content-url` int(11) NOT NULL,
  `syndicated-content-count` int(11) NOT NULL,
  `syndicated-content-link-to` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `total-internal-links-tracker-page`;
CREATE TABLE `total-internal-links-tracker-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `internal-link-count-total` int(11) NOT NULL,
  `internal-link-count-no-nav` int(11) NOT NULL,
  `folder-pages-to-page-link-percentage` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `total-outgoing-backlink-tracker-page`;
CREATE TABLE `total-outgoing-backlink-tracker-page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outbound-link-count-total` int(11) NOT NULL,
  `outbound-major-backlinks-count` int(11) NOT NULL,
  `oubound-special-backlinks-count` int(11) NOT NULL,
  `outbound-link-count-no-nav` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `total-page-backlink-tracker`;
CREATE TABLE `total-page-backlink-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-total-referring-domain-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-major-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-minor-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-local-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-middleman-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-forum-comm-backlinks` int(11) NOT NULL,
  `page-total-referring-domain-company-backlinks` int(11) NOT NULL,
  `page-total-backlinks` int(11) NOT NULL,
  `page-total-major-backlinks` int(11) NOT NULL,
  `page-total-minor-backlinks` int(11) NOT NULL,
  `page-total-local-backlinks` int(11) NOT NULL,
  `page-total-middleman-backlinks` int(11) NOT NULL,
  `page-total-forum-comm-backlinks` int(11) NOT NULL,
  `page-total-company-backlinks` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `total-page-backlinks-cummulative-tracker`;
CREATE TABLE `total-page-backlinks-cummulative-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `page-total-referring-domains-gained` int(11) NOT NULL,
  `page-total-referring-domains-lost` int(11) NOT NULL,
  `page-total-referring-domains-net` int(11) NOT NULL,
  `page-total-backlinks-gained` int(11) NOT NULL,
  `page-total-backlinks-lost` int(11) NOT NULL,
  `page-total-backlinks-net` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `unnatural-backlink-influx-tracker`;
CREATE TABLE `unnatural-backlink-influx-tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `total-influx-minor-backlinks-21-days-rd` int(11) NOT NULL,
  `total-influx-minor-above-50-21-days-rd` int(11) NOT NULL,
  `total-influx-minor-backlinks-7-days-rd` int(11) NOT NULL,
  `total-influx-minor-above-15-7-days-rd` int(11) NOT NULL,
  `total-influx-minor-above-100-24-hrs-backlinks` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2019-09-02 20:20:45
