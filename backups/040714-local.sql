-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ghostdev
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ed63ae2a-8cde-421b-9b89-b94fe4e291c0','Edit posts','post','edit',NULL,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(2,'eb0be228-50ec-4cdc-b18a-a000636f0fc2','Remove posts','post','remove',NULL,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(3,'715bdd65-ce35-4ab1-9bf2-806a9b4e2468','Create posts','post','create',NULL,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `html` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'558ac2ee-1404-47f1-9d69-9873907ffe0d','Welcome to Ghost','welcome-to-ghost','You\'re live! Nice. We\'ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at `<your blog URL>/ghost/`. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!\n\n## Getting Started\n\nGhost uses something called Markdown for writing. Essentially, it\'s a shorthand way to manage your post formatting as you write!\n\nWriting in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use *shortcuts* to **style** your content. For example, a list:\n\n* Item number one\n* Item number two\n    * A nested item\n* A final item\n\nor with numbers!\n\n1. Remember to buy some milk\n2. Drink the milk\n3. Tweet that I remembered to buy the milk, and drank it\n\n### Links\n\nWant to link to a source? No problem. If you paste in url, like http://ghost.org - it\'ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here\'s a link to [the Ghost website](http://ghost.org). Neat.\n\n### What about Images?\n\nImages work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:\n\n![The Ghost Logo](https://ghost.org/images/ghost.png)\n\nNot sure which image you want to use yet? That\'s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:\n\n![A bowl of bananas]\n\n\n### Quoting\n\nSometimes a link isn\'t enough, you want to quote someone on what they\'ve said. It was probably very wisdomous. Is wisdomous a word? Find out in a future release when we introduce spellcheck! For now - it\'s definitely a word.\n\n> Wisdomous - it\'s definitely a word.\n\n### Working with Code\n\nGot a streak of geek? We\'ve got you covered there, too. You can write inline `<code>` blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.\n\n    .awesome-thing {\n        display: block;\n        width: 100%;\n    }\n\n### Ready for a Break? \n\nThrow 3 or more dashes down on any new line and you\'ve got yourself a fancy new divider. Aw yeah.\n\n---\n\n### Advanced Usage\n\nThere\'s one fantastic secret about Markdown. If you want, you can  write plain old HTML and it\'ll still work! Very flexible.\n\n<input type=\"text\" placeholder=\"I\'m an input field!\" />\n\nThat should be enough to get you started. Have fun - and let us know what you think :)','<p>You\'re live! Nice. We\'ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at <code>&lt;your blog URL&gt;/ghost/</code>. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!</p>\n\n<h2 id=\"gettingstarted\">Getting Started</h2>\n\n<p>Ghost uses something called Markdown for writing. Essentially, it\'s a shorthand way to manage your post formatting as you write!</p>\n\n<p>Writing in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use <em>shortcuts</em> to <strong>style</strong> your content. For example, a list:</p>\n\n<ul>\n<li>Item number one</li>\n<li>Item number two\n<ul><li>A nested item</li></ul></li>\n<li>A final item</li>\n</ul>\n\n<p>or with numbers!</p>\n\n<ol>\n<li>Remember to buy some milk  </li>\n<li>Drink the milk  </li>\n<li>Tweet that I remembered to buy the milk, and drank it</li>\n</ol>\n\n<h3 id=\"links\">Links</h3>\n\n<p>Want to link to a source? No problem. If you paste in url, like <a href=\'http://ghost.org\'>http://ghost.org</a> - it\'ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here\'s a link to <a href=\"http://ghost.org\">the Ghost website</a>. Neat.</p>\n\n<h3 id=\"whataboutimages\">What about Images?</h3>\n\n<p>Images work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:</p>\n\n<p><img src=\"https://ghost.org/images/ghost.png\" alt=\"The Ghost Logo\" /></p>\n\n<p>Not sure which image you want to use yet? That\'s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:</p>\n\n<h3 id=\"quoting\">Quoting</h3>\n\n<p>Sometimes a link isn\'t enough, you want to quote someone on what they\'ve said. It was probably very wisdomous. Is wisdomous a word? Find out in a future release when we introduce spellcheck! For now - it\'s definitely a word.</p>\n\n<blockquote>\n  <p>Wisdomous - it\'s definitely a word.</p>\n</blockquote>\n\n<h3 id=\"workingwithcode\">Working with Code</h3>\n\n<p>Got a streak of geek? We\'ve got you covered there, too. You can write inline <code>&lt;code&gt;</code> blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.</p>\n\n<pre><code>.awesome-thing {\n    display: block;\n    width: 100%;\n}\n</code></pre>\n\n<h3 id=\"readyforabreak\">Ready for a Break?</h3>\n\n<p>Throw 3 or more dashes down on any new line and you\'ve got yourself a fancy new divider. Aw yeah.</p>\n\n<hr />\n\n<h3 id=\"advancedusage\">Advanced Usage</h3>\n\n<p>There\'s one fantastic secret about Markdown. If you want, you can  write plain old HTML and it\'ll still work! Very flexible.</p>\n\n<p><input type=\"text\" placeholder=\"I\'m an input field!\" /></p>\n\n<p>That should be enough to get you started. Have fun - and let us know what you think :)</p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (1,1,1);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'87de042d-cdc4-4561-a4a5-b9705462ad21','Administrator','Administrators','2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(2,'e530ab6c-b14f-4e09-ae6f-dce2bc2f3599','Editor','Editors','2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(3,'62cabaf6-3f57-4435-a428-3e49a76d77e3','Author','Authors','2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `sess` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('Ux2vUmLKYFgLScrtsR5oiSJL',1399050661160,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-05-02T17:11:01.160Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"user\":1,\"_csrfSecret\":\"rd4Kx1TtkryywangZmKgJqVG\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'8d414ed4-9bf7-43d6-addf-0e4a48c74537','databaseVersion','002','core','2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(2,'1169962c-d8aa-44c2-8fff-d46ff84198eb','dbHash','fa78ddbd-488a-4bf6-ba22-7403dbaca26f','core','2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1),(3,'c0ebcce3-3d8d-42ff-975c-b7c324efad5c','nextUpdateCheck','1399014606','core','2014-05-01 07:00:15',1,'2014-05-01 07:10:06',1),(4,'4e2b5789-fe92-46c0-b122-4114d195551a','displayUpdateNotification','0.4.2','core','2014-05-01 07:00:15',1,'2014-05-01 07:10:06',1),(5,'39c2c9fc-8dca-4227-954b-f2f17df172f5','title','Ghost','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(6,'3a87a447-7730-4b0b-a76b-fdbde96df579','description','Just a blogging platform.','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(7,'4c91e075-ad65-420e-b08a-43b5f01c3d19','email','owenwilliams1@gmail.com','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(8,'b7aa6081-3c2a-4886-992f-a60e2a03b87c','logo','','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(9,'1c8c5a83-a889-49e3-834c-55ea935319e1','cover','','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(10,'b6563b19-98f9-46cc-a2b1-78c69ad45550','defaultLang','en_US','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(11,'15c979a3-f83e-4536-8179-f0d299ab81f0','postsPerPage','6','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(12,'6d3c5f97-a13e-49cf-8d4b-53f999381302','forceI18n','true','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(13,'433fd6a2-c09d-47fe-a475-5b0026fa4083','permalinks','/:slug/','blog','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(14,'3ec57066-08d0-41b0-b3aa-60148c006219','activeTheme','GhostScroll-master','theme','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(15,'9f51667a-0e0f-4ec9-8809-1d2664d280c8','activeApps','[]','app','2014-05-01 07:00:15',1,'2014-05-01 07:10:17',1),(16,'baca684a-2db7-4627-83d3-8a4d40ff8b55','installedApps','[]','app','2014-05-01 07:00:15',1,'2014-07-04 01:35:39',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'b98717c6-96c9-44ac-91f4-ab86c2175e2b','Getting Started','getting-started',NULL,NULL,NULL,NULL,'2014-05-01 07:00:15',1,'2014-05-01 07:00:15',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'7a09310f-b3d5-4695-9d9b-40e38ffc729d','williamsowen','williamsowen','$2a$10$yFooexfVv6H/b1joRgaYy.qHeQ3q//oFxceQO8TcP4iBm.6uvnIzS','owenwilliams1@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'active','en_US',NULL,NULL,NULL,'2014-05-01 07:10:03',1,'2014-05-02 05:11:00',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-04  5:09:58
