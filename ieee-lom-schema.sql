/*
 Navicat MySQL Data Transfer

 Source Server         : [DEV] Localhost
 Source Server Version : 50527
 Source Host           : localhost
 Source Database       : IEEE-LOM

 Target Server Version : 50527
 File Encoding         : utf-8

 Date: 07/03/2013 01:38:31 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `annotations`
-- ----------------------------
DROP TABLE IF EXISTS `annotations`;
CREATE TABLE `annotations` (
  `annotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `annotation_entity` varchar(1000) DEFAULT NULL,
  `annotation_date` date DEFAULT NULL,
  `annotation_description` text,
  `annotation_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`annotation_id`,`lom_id`),
  UNIQUE KEY `annotation_id_UNIQUE` (`annotation_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_idccc` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `classifications`
-- ----------------------------
DROP TABLE IF EXISTS `classifications`;
CREATE TABLE `classifications` (
  `classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `classification_purpose` varchar(1000) DEFAULT NULL,
  `classification_purpose_source` varchar(1000) DEFAULT NULL,
  `classification_description` text,
  `classification_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`classification_id`,`lom_id`),
  UNIQUE KEY `classification_id_UNIQUE` (`classification_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_id5` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `classifications_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `classifications_keywords`;
CREATE TABLE `classifications_keywords` (
  `classifications_keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_id` int(11) NOT NULL,
  `classifications_keyword_string` text,
  `classifications_keyword_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`classifications_keyword_id`,`classification_id`),
  UNIQUE KEY `classifications_keyword_id_UNIQUE` (`classifications_keyword_id`),
  KEY `classification_id_idx` (`classification_id`),
  CONSTRAINT `classification_idfsdf` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`classification_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contributes`
-- ----------------------------
DROP TABLE IF EXISTS `contributes`;
CREATE TABLE `contributes` (
  `contribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `metametadata_id` int(11) DEFAULT NULL,
  `lifecycle_id` int(11) DEFAULT NULL,
  `contribute_role` varchar(1000) DEFAULT NULL,
  `contribute_role_source` varchar(1000) DEFAULT NULL,
  `contribute_date` datetime DEFAULT NULL,
  `contribute_date_description` text,
  `contribute_date_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`contribute_id`,`lom_id`),
  UNIQUE KEY `contribute_id_UNIQUE` (`contribute_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_id33` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contributes_entitys`
-- ----------------------------
DROP TABLE IF EXISTS `contributes_entitys`;
CREATE TABLE `contributes_entitys` (
  `contributes_entity_id` int(11) NOT NULL AUTO_INCREMENT,
  `contribute_id` int(11) NOT NULL,
  `contributes_entity_string` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`contributes_entity_id`,`contribute_id`),
  UNIQUE KEY `contributes_entity_id_UNIQUE` (`contributes_entity_id`),
  KEY `contribute_id_idx` (`contribute_id`),
  CONSTRAINT `contribute_id` FOREIGN KEY (`contribute_id`) REFERENCES `contributes` (`contribute_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals`
-- ----------------------------
DROP TABLE IF EXISTS `educationals`;
CREATE TABLE `educationals` (
  `educational_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `educational_interactivitytype` varchar(1000) DEFAULT NULL,
  `educational_interactivitytype_source` varchar(1000) DEFAULT NULL,
  `educational_interactivitylevel` varchar(1000) DEFAULT NULL,
  `educational_interactivitylevel_source` varchar(1000) DEFAULT NULL,
  `educational_semanticdensity` varchar(1000) DEFAULT NULL,
  `educational_semanticdensity_source` varchar(1000) DEFAULT NULL,
  `educational_difficulty` varchar(1000) DEFAULT NULL,
  `educational_difficulty_source` varchar(1000) DEFAULT NULL,
  `educational_typicallearningtime` varchar(200) DEFAULT NULL,
  `educational_typicallearningtime_description` text,
  `educational_typicallearningtime_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educational_id`,`lom_id`),
  UNIQUE KEY `educational_id_UNIQUE` (`educational_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_idbbv` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_contexts`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_contexts`;
CREATE TABLE `educationals_contexts` (
  `educationals_context_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_context_string` varchar(1000) DEFAULT NULL,
  `educationals_context_source` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_context_id`,`educational_id`),
  UNIQUE KEY `educationals_context_id_UNIQUE` (`educationals_context_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id2` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_descriptions`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_descriptions`;
CREATE TABLE `educationals_descriptions` (
  `educationals_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_description_string` text,
  `educationals_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_description_id`,`educational_id`),
  UNIQUE KEY `educationals_description_id_UNIQUE` (`educationals_description_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id5` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_languages`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_languages`;
CREATE TABLE `educationals_languages` (
  `educationals_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_language_string` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_language_id`,`educational_id`),
  UNIQUE KEY `educationals_language_id_UNIQUE` (`educationals_language_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id6` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_types`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_types`;
CREATE TABLE `educationals_types` (
  `educationals_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_type_string` varchar(1000) DEFAULT NULL,
  `educationals_type_source` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_type_id`,`educational_id`),
  UNIQUE KEY `educationals_type_id_UNIQUE` (`educationals_type_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id4` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_typicalageranges`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_typicalageranges`;
CREATE TABLE `educationals_typicalageranges` (
  `educationals_typicalagerange_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_typicalagerange_string` text,
  `educationals_typicalagerange_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_typicalagerange_id`,`educational_id`),
  UNIQUE KEY `educationals_typicalagerange_id_UNIQUE` (`educationals_typicalagerange_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id1` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `educationals_userroles`
-- ----------------------------
DROP TABLE IF EXISTS `educationals_userroles`;
CREATE TABLE `educationals_userroles` (
  `educationals_userrole_id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_id` int(11) NOT NULL,
  `educationals_userrole_string` varchar(1000) DEFAULT NULL,
  `educationals_userrole_source` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`educationals_userrole_id`,`educational_id`),
  UNIQUE KEY `educationals_userrole_id_UNIQUE` (`educationals_userrole_id`),
  KEY `educational_id_idx` (`educational_id`),
  CONSTRAINT `educational_id3` FOREIGN KEY (`educational_id`) REFERENCES `educationals` (`educational_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals`
-- ----------------------------
DROP TABLE IF EXISTS `generals`;
CREATE TABLE `generals` (
  `general_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `general_structure` varchar(1000) NOT NULL,
  `general_structure_source` varchar(1000) DEFAULT NULL,
  `general_aggregation_level` varchar(1000) NOT NULL,
  `general_aggregation_level_source` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`general_id`,`lom_id`),
  UNIQUE KEY `general_id_UNIQUE` (`general_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`),
  CONSTRAINT `lom_id22` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_coverages`
-- ----------------------------
DROP TABLE IF EXISTS `generals_coverages`;
CREATE TABLE `generals_coverages` (
  `generals_coverage_id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_coverage_id`,`general_id`),
  UNIQUE KEY `generals_contribute_id_UNIQUE` (`generals_coverage_id`),
  KEY `general_id_idx` (`general_id`),
  CONSTRAINT `general_id444` FOREIGN KEY (`general_id`) REFERENCES `generals` (`general_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_coverages_texts`
-- ----------------------------
DROP TABLE IF EXISTS `generals_coverages_texts`;
CREATE TABLE `generals_coverages_texts` (
  `generals_coverages_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `generals_coverage_id` int(11) NOT NULL,
  `generals_coverages_text_string` text,
  `generals_coverages_text_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_coverages_text_id`,`generals_coverage_id`),
  UNIQUE KEY `generals_coverages_text_id_UNIQUE` (`generals_coverages_text_id`),
  KEY `geasd_idx` (`generals_coverage_id`),
  CONSTRAINT `geasd` FOREIGN KEY (`generals_coverage_id`) REFERENCES `generals_coverages` (`generals_coverage_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_descriptions`
-- ----------------------------
DROP TABLE IF EXISTS `generals_descriptions`;
CREATE TABLE `generals_descriptions` (
  `generals_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `generals_description_string` text,
  `generals_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_description_id`,`general_id`),
  UNIQUE KEY `generals_description_id_UNIQUE` (`generals_description_id`),
  KEY `general_id_idx` (`general_id`),
  CONSTRAINT `general_id3333` FOREIGN KEY (`general_id`) REFERENCES `generals` (`general_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `generals_keywords`;
CREATE TABLE `generals_keywords` (
  `generals_keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`generals_keyword_id`,`general_id`),
  UNIQUE KEY `generals_keyword_id_UNIQUE` (`generals_keyword_id`),
  KEY `general_idvbvbvbn_idx` (`general_id`),
  CONSTRAINT `general_idvbvbvbn` FOREIGN KEY (`general_id`) REFERENCES `generals` (`general_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_keywords_texts`
-- ----------------------------
DROP TABLE IF EXISTS `generals_keywords_texts`;
CREATE TABLE `generals_keywords_texts` (
  `generals_keywords_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `generals_keyword_id` int(11) NOT NULL,
  `generals_keywords_text_string` text,
  `generals_keywords_text_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_keywords_text_id`,`generals_keyword_id`),
  UNIQUE KEY `generals_keyword_id_UNIQUE` (`generals_keywords_text_id`),
  KEY `general_id222_idx` (`generals_keyword_id`),
  CONSTRAINT `general_id222` FOREIGN KEY (`generals_keyword_id`) REFERENCES `generals_keywords` (`generals_keyword_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_languages`
-- ----------------------------
DROP TABLE IF EXISTS `generals_languages`;
CREATE TABLE `generals_languages` (
  `generals_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `generals_language_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_language_id`,`general_id`),
  UNIQUE KEY `generals_language_id_UNIQUE` (`generals_language_id`),
  KEY `general_id_idx` (`general_id`),
  CONSTRAINT `general_id333` FOREIGN KEY (`general_id`) REFERENCES `generals` (`general_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `generals_titles`
-- ----------------------------
DROP TABLE IF EXISTS `generals_titles`;
CREATE TABLE `generals_titles` (
  `generals_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NOT NULL,
  `generals_title_string` text,
  `generals_title_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`generals_title_id`,`general_id`),
  UNIQUE KEY `generals_title_id_UNIQUE` (`generals_title_id`),
  KEY `_idx` (`general_id`),
  CONSTRAINT `general_idasd` FOREIGN KEY (`general_id`) REFERENCES `generals` (`general_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `identifiers`
-- ----------------------------
DROP TABLE IF EXISTS `identifiers`;
CREATE TABLE `identifiers` (
  `identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `general_id` int(11) DEFAULT NULL,
  `metametadata_id` int(11) DEFAULT NULL,
  `identifier_catalog` text,
  `identifier_catalog_lang` varchar(100) DEFAULT NULL,
  `identifier_entry` text,
  `identifier_entry_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`identifier_id`,`lom_id`),
  UNIQUE KEY `identifier_id_UNIQUE` (`identifier_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_id55` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lifecycles`
-- ----------------------------
DROP TABLE IF EXISTS `lifecycles`;
CREATE TABLE `lifecycles` (
  `lifecycle_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `lifecycle_status` varchar(1000) DEFAULT NULL,
  `lifecycle_status_source` varchar(1000) DEFAULT NULL,
  `lifecycle_version` text,
  `lifecycle_version_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`lifecycle_id`,`lom_id`),
  UNIQUE KEY `lifecycle_id_UNIQUE` (`lifecycle_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`),
  CONSTRAINT `lom_id77` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `loms`
-- ----------------------------
DROP TABLE IF EXISTS `loms`;
CREATE TABLE `loms` (
  `lom_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lom_original_file_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`lom_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `metametadatas`
-- ----------------------------
DROP TABLE IF EXISTS `metametadatas`;
CREATE TABLE `metametadatas` (
  `metametadata_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `metametadata_lang` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`metametadata_id`,`lom_id`),
  UNIQUE KEY `metametadata_id_UNIQUE` (`metametadata_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`),
  CONSTRAINT `lom_id11` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `metametadatas_schemas`
-- ----------------------------
DROP TABLE IF EXISTS `metametadatas_schemas`;
CREATE TABLE `metametadatas_schemas` (
  `metametadatas_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `metametadata_id` int(11) NOT NULL,
  `metametadatas_schema_text` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`metametadatas_schema_id`,`metametadata_id`),
  UNIQUE KEY `metametadatas_schema_id_UNIQUE` (`metametadatas_schema_id`),
  KEY `metametada_idxxx_idx` (`metametadata_id`),
  CONSTRAINT `metametada_idxxx` FOREIGN KEY (`metametadata_id`) REFERENCES `metametadatas` (`metametadata_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `orcomposites`
-- ----------------------------
DROP TABLE IF EXISTS `orcomposites`;
CREATE TABLE `orcomposites` (
  `orcomposite_id` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` int(11) NOT NULL,
  `orcomposite_type` varchar(1000) DEFAULT NULL,
  `orcomposite_type_source` varchar(1000) DEFAULT NULL,
  `orcomposite_name` varchar(1000) DEFAULT NULL,
  `orcomposite_name_source` varchar(1000) DEFAULT NULL,
  `orcomposite_minimumversion` varchar(30) DEFAULT NULL,
  `orcomposite_maximumversion` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`orcomposite_id`,`requirement_id`),
  UNIQUE KEY `orcomposite_id_UNIQUE` (`orcomposite_id`),
  KEY `requirement_id_idx` (`requirement_id`),
  CONSTRAINT `requirement_id` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`requirement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `relations`
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `relation_kind` varchar(1000) DEFAULT NULL,
  `relation_kind_source` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`relation_id`,`lom_id`),
  UNIQUE KEY `relation_id_UNIQUE` (`relation_id`),
  KEY `lom_id_idx` (`lom_id`),
  CONSTRAINT `lom_id2` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `requirements`
-- ----------------------------
DROP TABLE IF EXISTS `requirements`;
CREATE TABLE `requirements` (
  `requirement_id` int(11) NOT NULL AUTO_INCREMENT,
  `technical_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`requirement_id`,`technical_id`),
  UNIQUE KEY `requirement_id_UNIQUE` (`requirement_id`),
  KEY `technical_id_idx` (`technical_id`),
  CONSTRAINT `technical_id1` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`technical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `resources`
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NOT NULL,
  `resource_description` text,
  `resource_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '		',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`resource_id`,`relation_id`),
  UNIQUE KEY `resource_id_UNIQUE` (`resource_id`),
  UNIQUE KEY `relation_id_UNIQUE` (`relation_id`),
  CONSTRAINT `relation_id` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`relation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `rights`
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `right_cost` varchar(1000) DEFAULT NULL,
  `right_cost_source` varchar(1000) DEFAULT NULL,
  `right_copyright` varchar(1000) DEFAULT NULL,
  `right_copyright_source` varchar(1000) DEFAULT NULL,
  `right_description` text,
  `right_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`right_id`,`lom_id`),
  UNIQUE KEY `right_id_UNIQUE` (`right_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`),
  CONSTRAINT `lom_id4` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `taxonpaths`
-- ----------------------------
DROP TABLE IF EXISTS `taxonpaths`;
CREATE TABLE `taxonpaths` (
  `taxonpath_id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_id` int(11) NOT NULL,
  `taxonpath_source` text,
  `taxonpath_source_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxonpath_id`,`classification_id`),
  UNIQUE KEY `taxonpath_id_UNIQUE` (`taxonpath_id`),
  KEY `classification_id_idx` (`classification_id`),
  CONSTRAINT `classification_idggf` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`classification_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `taxons`
-- ----------------------------
DROP TABLE IF EXISTS `taxons`;
CREATE TABLE `taxons` (
  `taxon_id` int(11) NOT NULL AUTO_INCREMENT,
  `taxonpath_id` int(11) NOT NULL,
  `taxon_id_string` varchar(1000) DEFAULT NULL,
  `taxon_entry` text,
  `taxon_entry_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`taxon_id`,`taxonpath_id`),
  UNIQUE KEY `taxon_id_UNIQUE` (`taxon_id`),
  KEY `taxon_id_idx` (`taxonpath_id`),
  CONSTRAINT `taxon_id233` FOREIGN KEY (`taxonpath_id`) REFERENCES `taxonpaths` (`taxonpath_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `technicals`
-- ----------------------------
DROP TABLE IF EXISTS `technicals`;
CREATE TABLE `technicals` (
  `technical_id` int(11) NOT NULL AUTO_INCREMENT,
  `lom_id` int(11) NOT NULL,
  `technical_size` varchar(30) DEFAULT NULL,
  `technical_duration` varchar(200) DEFAULT NULL,
  `technical_duration_description` text,
  `technical_duration_description_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`technical_id`,`lom_id`),
  UNIQUE KEY `technical_id_UNIQUE` (`technical_id`),
  UNIQUE KEY `lom_id_UNIQUE` (`lom_id`),
  CONSTRAINT `lom_id6` FOREIGN KEY (`lom_id`) REFERENCES `loms` (`lom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `technicals_formats`
-- ----------------------------
DROP TABLE IF EXISTS `technicals_formats`;
CREATE TABLE `technicals_formats` (
  `technicals_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `technical_id` int(11) NOT NULL,
  `technicals_format_text` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`technicals_format_id`,`technical_id`),
  UNIQUE KEY `technicals_format_id_UNIQUE` (`technicals_format_id`),
  KEY `technical_id_idx` (`technical_id`),
  CONSTRAINT `technical_id1ffd` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`technical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `technicals_installationremarks`
-- ----------------------------
DROP TABLE IF EXISTS `technicals_installationremarks`;
CREATE TABLE `technicals_installationremarks` (
  `technicals_installationremark_id` int(11) NOT NULL AUTO_INCREMENT,
  `technical_id` int(11) NOT NULL,
  `technicals_installationremark_string` text,
  `technicals_installationremark_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`technicals_installationremark_id`,`technical_id`),
  UNIQUE KEY `technicals_installationremark_id_UNIQUE` (`technicals_installationremark_id`),
  KEY `technical_id_idx` (`technical_id`),
  CONSTRAINT `technical_idgg` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`technical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `technicals_locations`
-- ----------------------------
DROP TABLE IF EXISTS `technicals_locations`;
CREATE TABLE `technicals_locations` (
  `technicals_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `technical_id` int(11) NOT NULL,
  `technicals_location_text` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`technicals_location_id`,`technical_id`),
  UNIQUE KEY `technicals_location_id_UNIQUE` (`technicals_location_id`),
  KEY `technical_id_idx` (`technical_id`),
  CONSTRAINT `technical_idff` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`technical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `technicals_otherplatformrequirements`
-- ----------------------------
DROP TABLE IF EXISTS `technicals_otherplatformrequirements`;
CREATE TABLE `technicals_otherplatformrequirements` (
  `technicals_otherplatformrequirement_id` int(11) NOT NULL AUTO_INCREMENT,
  `technical_id` int(11) NOT NULL,
  `technicals_otherplatformrequirement_string` text,
  `technicals_otherplatformrequirement_lang` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`technicals_otherplatformrequirement_id`,`technical_id`),
  UNIQUE KEY `technicals_otherplatformrequirement_id_UNIQUE` (`technicals_otherplatformrequirement_id`),
  KEY `technical_id_idx` (`technical_id`),
  CONSTRAINT `technical_idw` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`technical_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
