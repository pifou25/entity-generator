-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 18 oct. 2023 à 12:48
-- Version du serveur :  10.11.5-MariaDB
-- Version de PHP : 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jeedom`
--
CREATE DATABASE IF NOT EXISTS jeedom;
-- --------------------------------------------------------
USE jeedom;
--
-- Structure de la table `calendar_event`
--

CREATE TABLE `calendar_event` (
  `id` int(11) NOT NULL,
  `eqLogic_id` int(11) NOT NULL,
  `cmd_param` text DEFAULT NULL,
  `value` varchar(127) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `until` datetime DEFAULT NULL,
  `repeat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cmd`
--

CREATE TABLE `cmd` (
  `id` int(11) NOT NULL,
  `eqLogic_id` int(11) NOT NULL,
  `eqType` varchar(127) DEFAULT NULL,
  `logicalId` varchar(255) DEFAULT NULL,
  `generic_type` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `configuration` mediumtext DEFAULT NULL,
  `template` text DEFAULT NULL,
  `isHistorized` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `subType` varchar(45) DEFAULT NULL,
  `unite` varchar(45) DEFAULT NULL,
  `display` text DEFAULT NULL,
  `isVisible` int(11) DEFAULT 1,
  `value` varchar(255) DEFAULT NULL,
  `alert` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `config`
--

CREATE TABLE `config` (
  `plugin` varchar(127) NOT NULL DEFAULT 'core',
  `key` varchar(127) NOT NULL,
  `value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cron`
--

CREATE TABLE `cron` (
  `id` int(11) NOT NULL,
  `enable` int(11) DEFAULT NULL,
  `class` varchar(127) DEFAULT NULL,
  `function` varchar(127) NOT NULL,
  `schedule` varchar(127) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `deamon` int(11) DEFAULT 0,
  `deamonSleepTime` int(11) DEFAULT NULL,
  `option` text DEFAULT NULL,
  `once` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dataStore`
--

CREATE TABLE `dataStore` (
  `id` int(11) NOT NULL,
  `type` varchar(127) NOT NULL,
  `link_id` int(11) NOT NULL,
  `key` varchar(127) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `data_amfj`
--

CREATE TABLE `data_amfj` (
  `id` int(11) NOT NULL,
  `code` varchar(256) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eqLogic`
--

CREATE TABLE `eqLogic` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `generic_type` varchar(255) DEFAULT NULL,
  `logicalId` varchar(127) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `eqType_name` varchar(127) NOT NULL,
  `configuration` mediumtext DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT NULL,
  `isEnable` tinyint(1) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `category` text DEFAULT NULL,
  `display` text DEFAULT NULL,
  `order` int(11) DEFAULT 1,
  `comment` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eqReal`
--

CREATE TABLE `eqReal` (
  `id` int(11) NOT NULL,
  `logicalId` varchar(45) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `configuration` text DEFAULT NULL,
  `cat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `cmd_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `value` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historyArch`
--

CREATE TABLE `historyArch` (
  `cmd_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `value` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interactDef`
--

CREATE TABLE `interactDef` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `enable` int(11) DEFAULT 1,
  `query` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `person` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `filtres` text DEFAULT NULL,
  `group` varchar(127) DEFAULT NULL,
  `actions` text DEFAULT NULL,
  `display` text DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interactQuery`
--

CREATE TABLE `interactQuery` (
  `id` int(11) NOT NULL,
  `interactDef_id` int(11) NOT NULL,
  `query` text DEFAULT NULL,
  `actions` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_ask`
--

CREATE TABLE `jeemate_ask` (
  `id` int(11) NOT NULL,
  `askId` text NOT NULL,
  `timeout` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `notifId` text NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_backup`
--

CREATE TABLE `jeemate_backup` (
  `id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `global` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_DBevent`
--

CREATE TABLE `jeemate_DBevent` (
  `id` int(11) NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dateExec` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_devices`
--

CREATE TABLE `jeemate_devices` (
  `id` int(11) NOT NULL,
  `link_type` varchar(127) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `geofence_name` text DEFAULT NULL,
  `jeeobject` int(11) DEFAULT NULL,
  `send` int(11) DEFAULT NULL,
  `sync_users` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_geofence`
--

CREATE TABLE `jeemate_geofence` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  `radius` int(11) NOT NULL,
  `wifi` text DEFAULT NULL,
  `unite` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_notifications`
--

CREATE TABLE `jeemate_notifications` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `channel` text DEFAULT NULL,
  `groupe` text DEFAULT NULL,
  `design` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `iconColor` text DEFAULT NULL,
  `backgroundColor` text DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `largeIcon` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `criticalAlert` text DEFAULT NULL,
  `notifAutoJeedom` text DEFAULT NULL,
  `deeplink` text DEFAULT NULL,
  `deeplinkAuto` text DEFAULT NULL,
  `notifAskAll` text DEFAULT NULL,
  `notifAskAllEqs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jeemate_phone`
--

CREATE TABLE `jeemate_phone` (
  `id` int(11) NOT NULL,
  `enable` int(11) NOT NULL,
  `udid` text NOT NULL,
  `kernelArchitecture` text NOT NULL,
  `kernelName` text NOT NULL,
  `userNameDevice` text NOT NULL,
  `totalMemory` text NOT NULL,
  `model` text NOT NULL,
  `manufacturer` text NOT NULL,
  `os` text NOT NULL,
  `macAddress` text NOT NULL,
  `eqLogicsID` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `listener`
--

CREATE TABLE `listener` (
  `id` int(11) NOT NULL,
  `class` varchar(127) DEFAULT NULL,
  `function` varchar(127) DEFAULT NULL,
  `event` varchar(511) DEFAULT NULL,
  `option` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `logicalId` varchar(127) DEFAULT NULL,
  `plugin` varchar(127) NOT NULL,
  `message` text DEFAULT NULL,
  `action` text DEFAULT NULL,
  `occurrences` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `object`
--

CREATE TABLE `object` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `father_id` int(11) DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `display` text DEFAULT NULL,
  `image` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `planHeader_id` int(11) NOT NULL,
  `link_type` varchar(127) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `position` text DEFAULT NULL,
  `display` text DEFAULT NULL,
  `css` text DEFAULT NULL,
  `configuration` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plan3d`
--

CREATE TABLE `plan3d` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plan3dHeader_id` int(11) NOT NULL,
  `link_type` varchar(127) DEFAULT NULL,
  `link_id` varchar(127) DEFAULT NULL,
  `position` text DEFAULT NULL,
  `display` text DEFAULT NULL,
  `css` text DEFAULT NULL,
  `configuration` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plan3dHeader`
--

CREATE TABLE `plan3dHeader` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `planHeader`
--

CREATE TABLE `planHeader` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `image` mediumtext DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenario`
--

CREATE TABLE `scenario` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `group` varchar(127) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  `mode` varchar(127) DEFAULT NULL,
  `schedule` text DEFAULT NULL,
  `scenarioElement` text DEFAULT NULL,
  `trigger` varchar(511) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT 1,
  `object_id` int(11) DEFAULT NULL,
  `display` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenarioElement`
--

CREATE TABLE `scenarioElement` (
  `id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `log` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenarioExpression`
--

CREATE TABLE `scenarioExpression` (
  `id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `scenarioSubElement_id` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `subtype` varchar(127) DEFAULT NULL,
  `expression` text DEFAULT NULL,
  `options` text DEFAULT NULL,
  `log` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenarioSubElement`
--

CREATE TABLE `scenarioSubElement` (
  `id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `scenarioElement_id` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `subtype` varchar(127) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `log` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `timeline`
--

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `type` varchar(27) DEFAULT NULL,
  `subtype` varchar(27) DEFAULT NULL,
  `link_id` varchar(27) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `options` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `update`
--

CREATE TABLE `update` (
  `id` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `logicalId` varchar(127) DEFAULT NULL,
  `localVersion` varchar(127) DEFAULT NULL,
  `remoteVersion` varchar(127) DEFAULT NULL,
  `source` varchar(127) DEFAULT 'market',
  `status` varchar(127) DEFAULT NULL,
  `configuration` text DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `profils` varchar(127) NOT NULL DEFAULT 'admin',
  `password` varchar(255) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `rights` text DEFAULT NULL,
  `enable` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `view`
--

CREATE TABLE `view` (
  `id` int(11) NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `display` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `image` mediumtext DEFAULT NULL,
  `configuration` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='<double-click to overwrite multiple objects>';

-- --------------------------------------------------------

--
-- Structure de la table `viewData`
--

CREATE TABLE `viewData` (
  `id` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `viewZone_id` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `configuration` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='<double-click to overwrite multiple objects>';

-- --------------------------------------------------------

--
-- Structure de la table `viewZone`
--

CREATE TABLE `viewZone` (
  `id` int(11) NOT NULL,
  `view_id` int(11) NOT NULL,
  `type` varchar(127) DEFAULT NULL,
  `name` varchar(127) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `configuration` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='<double-click to overwrite multiple objects>';

-- --------------------------------------------------------

--
-- Structure de la table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(27) DEFAULT NULL,
  `subtype` varchar(27) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `display` text DEFAULT NULL,
  `replace` text DEFAULT NULL,
  `test` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calendar_event`
--
ALTER TABLE `calendar_event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cmd`
--
ALTER TABLE `cmd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`eqLogic_id`,`name`),
  ADD KEY `isHistorized` (`isHistorized`),
  ADD KEY `type` (`type`),
  ADD KEY `name` (`name`),
  ADD KEY `subtype` (`subType`),
  ADD KEY `eqLogic_id` (`eqLogic_id`),
  ADD KEY `value` (`value`),
  ADD KEY `order` (`order`),
  ADD KEY `logicalID` (`logicalId`);

--
-- Index pour la table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`key`,`plugin`);

--
-- Index pour la table `cron`
--
ALTER TABLE `cron`
  ADD PRIMARY KEY (`id`),
  ADD KEY `function` (`function`),
  ADD KEY `deamon` (`deamon`);

--
-- Index pour la table `dataStore`
--
ALTER TABLE `dataStore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`type`,`link_id`,`key`);

--
-- Index pour la table `data_amfj`
--
ALTER TABLE `data_amfj`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `eqLogic`
--
ALTER TABLE `eqLogic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`name`,`object_id`),
  ADD KEY `eqTypeName` (`eqType_name`),
  ADD KEY `name` (`name`),
  ADD KEY `logical_id` (`logicalId`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `timeout` (`timeout`),
  ADD KEY `generic_type` (`generic_type`),
  ADD KEY `tags` (`tags`);

--
-- Index pour la table `eqReal`
--
ALTER TABLE `eqReal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `logicalId` (`logicalId`),
  ADD KEY `type` (`type`),
  ADD KEY `logicalId_Type` (`logicalId`,`type`),
  ADD KEY `name` (`name`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD UNIQUE KEY `unique` (`datetime`,`cmd_id`),
  ADD KEY `fk_history5min_commands1_idx` (`cmd_id`);

--
-- Index pour la table `historyArch`
--
ALTER TABLE `historyArch`
  ADD UNIQUE KEY `unique` (`cmd_id`,`datetime`);

--
-- Index pour la table `interactDef`
--
ALTER TABLE `interactDef`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `interactQuery`
--
ALTER TABLE `interactQuery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sarahQuery_sarahDef1_idx` (`interactDef_id`);

--
-- Index pour la table `jeemate_ask`
--
ALTER TABLE `jeemate_ask`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeemate_backup`
--
ALTER TABLE `jeemate_backup`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeemate_DBevent`
--
ALTER TABLE `jeemate_DBevent`
  ADD UNIQUE KEY `jeemate_event_id_uindex` (`id`);

--
-- Index pour la table `jeemate_devices`
--
ALTER TABLE `jeemate_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index` (`link_type`,`link_id`);

--
-- Index pour la table `jeemate_geofence`
--
ALTER TABLE `jeemate_geofence`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeemate_notifications`
--
ALTER TABLE `jeemate_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jeemate_phone`
--
ALTER TABLE `jeemate_phone`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `listener`
--
ALTER TABLE `listener`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`event`(255));

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin_logicalID` (`plugin`,`logicalId`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_object_object1_idx1` (`father_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unique` (`link_type`,`link_id`),
  ADD KEY `fk_plan_planHeader1_idx` (`planHeader_id`);

--
-- Index pour la table `plan3d`
--
ALTER TABLE `plan3d`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `link_type_link_id` (`link_type`,`link_id`),
  ADD KEY `fk_3d_3dHeader1_idx` (`plan3dHeader_id`);

--
-- Index pour la table `plan3dHeader`
--
ALTER TABLE `plan3dHeader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order` (`order`);

--
-- Index pour la table `planHeader`
--
ALTER TABLE `planHeader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order` (`order`);

--
-- Index pour la table `scenario`
--
ALTER TABLE `scenario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`group`,`object_id`,`name`),
  ADD KEY `fk_scenario_object1_idx` (`object_id`),
  ADD KEY `trigger` (`trigger`(255)),
  ADD KEY `mode` (`mode`),
  ADD KEY `modeTriger` (`mode`,`trigger`(255));

--
-- Index pour la table `scenarioElement`
--
ALTER TABLE `scenarioElement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `scenarioExpression`
--
ALTER TABLE `scenarioExpression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_scenarioExpression_scenarioSubElement1_idx` (`scenarioSubElement_id`);

--
-- Index pour la table `scenarioSubElement`
--
ALTER TABLE `scenarioSubElement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_scenarioSubElement_scenarioElement1_idx` (`scenarioElement_id`),
  ADD KEY `type` (`scenarioElement_id`,`type`);

--
-- Index pour la table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`,`datetime`),
  ADD KEY `datetime` (`datetime`);

--
-- Index pour la table `update`
--
ALTER TABLE `update`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `view`
--
ALTER TABLE `view`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Index pour la table `viewData`
--
ALTER TABLE `viewData`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`viewZone_id`,`link_id`,`type`),
  ADD KEY `order` (`order`,`viewZone_id`);

--
-- Index pour la table `viewZone`
--
ALTER TABLE `viewZone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zone_view1` (`view_id`);

--
-- Index pour la table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`type`,`subtype`,`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `calendar_event`
--
ALTER TABLE `calendar_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cmd`
--
ALTER TABLE `cmd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cron`
--
ALTER TABLE `cron`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dataStore`
--
ALTER TABLE `dataStore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `data_amfj`
--
ALTER TABLE `data_amfj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eqLogic`
--
ALTER TABLE `eqLogic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eqReal`
--
ALTER TABLE `eqReal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interactDef`
--
ALTER TABLE `interactDef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interactQuery`
--
ALTER TABLE `interactQuery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_ask`
--
ALTER TABLE `jeemate_ask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_backup`
--
ALTER TABLE `jeemate_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_DBevent`
--
ALTER TABLE `jeemate_DBevent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_devices`
--
ALTER TABLE `jeemate_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_geofence`
--
ALTER TABLE `jeemate_geofence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_notifications`
--
ALTER TABLE `jeemate_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeemate_phone`
--
ALTER TABLE `jeemate_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `listener`
--
ALTER TABLE `listener`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `object`
--
ALTER TABLE `object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plan3d`
--
ALTER TABLE `plan3d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `plan3dHeader`
--
ALTER TABLE `plan3dHeader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `planHeader`
--
ALTER TABLE `planHeader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenario`
--
ALTER TABLE `scenario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenarioElement`
--
ALTER TABLE `scenarioElement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenarioExpression`
--
ALTER TABLE `scenarioExpression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `scenarioSubElement`
--
ALTER TABLE `scenarioSubElement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `update`
--
ALTER TABLE `update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `view`
--
ALTER TABLE `view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `viewData`
--
ALTER TABLE `viewData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `viewZone`
--
ALTER TABLE `viewZone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
