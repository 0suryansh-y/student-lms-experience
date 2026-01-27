-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE `_prisma_migrations` (
	`id` varchar(36) NOT NULL,
	`checksum` varchar(64) NOT NULL,
	`finished_at` datetime(3),
	`migration_name` varchar(255) NOT NULL,
	`logs` text,
	`rolled_back_at` datetime(3),
	`started_at` datetime(3) NOT NULL DEFAULT (CURRENT_TIMESTAMP(3)),
	`applied_steps_count` int unsigned NOT NULL DEFAULT 0,
	CONSTRAINT `_prisma_migrations_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `access_logs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`username` varchar(255) NOT NULL,
	`user_email` varchar(255) NOT NULL,
	`route_name` varchar(255) NOT NULL,
	`route_action` varchar(255) NOT NULL,
	`route_path` varchar(255) NOT NULL,
	`request_content` longtext NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `access_logs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_approvers` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`adhoc_session_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`approved` tinyint(1),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_approvers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_batches` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`adhoc_session_id` int unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_batches_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_blocks` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`adhoc_session_id` int unsigned NOT NULL,
	`block_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_blocks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_blueprints` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255),
	`priority` int NOT NULL DEFAULT 0,
	`block_count` int,
	`batch_count` int,
	`section_count` int,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_sections` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`adhoc_session_id` int unsigned NOT NULL,
	`section_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_sections_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_session_users` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`adhoc_session_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_session_users_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `adhoc_sessions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255),
	`url` varchar(255),
	`start_date` date NOT NULL,
	`end_date` date NOT NULL,
	`start_time` int NOT NULL,
	`end_time` int NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`priority` int NOT NULL DEFAULT 0,
	`approved` tinyint(1),
	`approval_notes` varchar(255),
	`cancelled` tinyint(1) NOT NULL DEFAULT 0,
	`cancellation_notes` varchar(255),
	`adhoc_session_blueprint_id` int unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `adhoc_sessions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `ai_chat_practice_questions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lectureId` int unsigned NOT NULL,
	`userId` bigint unsigned NOT NULL,
	`chatHistory` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`feedback` varchar(191),
	`feedback_time` timestamp,
	`rating` int,
	CONSTRAINT `ai_chat_practice_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `ai_feedback` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`rating` int unsigned NOT NULL,
	`userId` bigint unsigned NOT NULL,
	`type` varchar(191) NOT NULL,
	`lectureId` int unsigned NOT NULL,
	`feedback` varchar(191),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `ai_feedback_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `ai_practice_questions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lectureId` int unsigned NOT NULL,
	`userId` bigint unsigned NOT NULL,
	`options` json NOT NULL,
	`correctOption` int unsigned NOT NULL,
	`explanation` text,
	`question` text NOT NULL,
	`selectedOption` int unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `ai_practice_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `ai_tutor_sessions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`unique_id` varchar(255) NOT NULL,
	`session_id` varchar(255),
	`room_name` varchar(255),
	`token` text,
	`websocket_url` varchar(500),
	`language` varchar(50),
	`duration_minutes` int,
	`participant_name` varchar(255),
	`error_message` text,
	`rating` tinyint unsigned,
	`feedback` text,
	`feedback_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `ai_tutor_sessions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `algorithms` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `algorithms_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `announcements` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`subject` varchar(255) NOT NULL,
	`body` text NOT NULL,
	`type` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`tags` varchar(255),
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`week` tinyint unsigned NOT NULL,
	`day` tinyint unsigned NOT NULL,
	`schedule` datetime,
	`concludes` datetime,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `announcements_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `answers` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`attempt_id` int unsigned NOT NULL,
	`question_id` int unsigned NOT NULL,
	`answer` text,
	`data` json,
	`feedback` json,
	`score` tinyint unsigned NOT NULL DEFAULT 0,
	`started_at` datetime,
	`submitted_at` datetime,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `answers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `app_configs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`appName` varchar(100) NOT NULL,
	`platform` enum('android','ios','web') NOT NULL,
	`minRequiredVersion` varchar(20) NOT NULL,
	`latestVersion` varchar(20) NOT NULL,
	`forceUpdate` tinyint(1) NOT NULL DEFAULT 0,
	`updateMessage` varchar(500),
	`storeUrl` varchar(500) NOT NULL,
	`isActive` tinyint(1) NOT NULL DEFAULT 1,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `app_configs_id` PRIMARY KEY(`id`),
	CONSTRAINT `app_configs_appName_platform_unique` UNIQUE(`appName`,`platform`)
);
--> statement-breakpoint
CREATE TABLE `application_comments` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`application_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`comment` text,
	`tags` json,
	`data` json,
	`info` json,
	`read` tinyint(1) NOT NULL DEFAULT 0,
	`read_at` datetime,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `application_comments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `application_histories` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`application_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`old_status` varchar(255),
	`new_status` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `application_histories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `applications` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`status` varchar(255),
	`round` varchar(255),
	`student_preference` varchar(255),
	`student_preference_reason` text,
	`visible` tinyint(1),
	`position_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`offer_letter_shared_at` datetime,
	`verbal_offer_shared_at` datetime,
	`offer_letter_sent_to_ops_at` datetime,
	`data` json,
	`info` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`set` int,
	CONSTRAINT `applications_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `assignment_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`instructions` text,
	`optional` tinyint(1) NOT NULL,
	`blueprint_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`week` int NOT NULL,
	`day` varchar(255) NOT NULL,
	`show_scores` tinyint(1) NOT NULL,
	`settings` json,
	`data` json,
	`buckets` json,
	`weightage` int NOT NULL,
	`visible` tinyint(1) NOT NULL,
	`assignment_id` int unsigned,
	`scheduled_time` time,
	`concludes_time` time,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `assignment_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `assignment_blueprints_problems` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`assignment_blueprint_id` bigint unsigned NOT NULL,
	`problem_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `assignment_blueprints_problems_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `assignment_problem` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`assignment_id` int unsigned NOT NULL,
	`problem_id` int unsigned NOT NULL,
	`priority` tinyint unsigned NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `assignment_problem_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `assignments` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`instructions` text,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`week` tinyint unsigned NOT NULL,
	`day` tinyint unsigned NOT NULL,
	`show_scores` tinyint(1) NOT NULL DEFAULT 0,
	`schedule` datetime,
	`concludes` datetime,
	`settings` json,
	`data` json,
	`buckets` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`weightage` int NOT NULL DEFAULT 0,
	`start_date` date,
	`end_date` date,
	`start_time` int,
	`end_time` int,
	`add_to_blueprint` tinyint(1) NOT NULL DEFAULT 1,
	`enforce_deadline` tinyint(1) DEFAULT 1,
	`show_submission` tinyint(1) NOT NULL DEFAULT 0,
	`platform` varchar(191),
	`gets_remaining_time` tinyint(1) NOT NULL DEFAULT 0,
	`allow_practice` tinyint(1) NOT NULL DEFAULT 0,
	`learning_objectives` json,
	CONSTRAINT `assignments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `attempts` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`quiz_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`attempt` smallint unsigned NOT NULL DEFAULT 0,
	`correct` smallint unsigned NOT NULL DEFAULT 0,
	`wrong` smallint unsigned NOT NULL DEFAULT 0,
	`skipped` smallint unsigned NOT NULL DEFAULT 0,
	`partial` smallint unsigned NOT NULL DEFAULT 0,
	`score` smallint unsigned NOT NULL DEFAULT 0,
	`started_at` timestamp,
	`completed_at` timestamp,
	`data` json,
	`questions` json,
	`started` tinyint(1) NOT NULL DEFAULT 0,
	`completed` tinyint(1) NOT NULL DEFAULT 0,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `attempts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `attendances` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`user_id` bigint unsigned,
	`host_id` bigint unsigned,
	`category` varchar(255) NOT NULL,
	`duration` int NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`section_id` int unsigned NOT NULL,
	`type` varchar(255) NOT NULL,
	`status` int NOT NULL,
	`schedule` datetime NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`joined_late` tinyint(1) NOT NULL DEFAULT 0,
	`late_by_minutes` int unsigned,
	CONSTRAINT `attendances_id` PRIMARY KEY(`id`),
	CONSTRAINT `attendances_lecture_id_user_id_key` UNIQUE(`lecture_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `batch_info` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`item` varchar(255) NOT NULL,
	`type` varchar(50) NOT NULL,
	`value` text,
	`maker_id` bigint unsigned NOT NULL,
	`checker_id` bigint unsigned NOT NULL,
	`meta` json,
	`status` varchar(50) NOT NULL DEFAULT 'pending',
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `batch_info_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_info_history` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`entity_name` varchar(255) NOT NULL,
	`event_name` varchar(50) NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`username` varchar(255) NOT NULL,
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `batch_info_history_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_info_template_items` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`batch_info_template_id` bigint unsigned NOT NULL,
	`item` varchar(255) NOT NULL,
	`type` varchar(50) NOT NULL,
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `batch_info_template_items_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_info_templates` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` text,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `batch_info_templates_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_participants` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`zoom_id` varchar(255),
	`user_id` varchar(255),
	`name` varchar(255),
	`email` varchar(255),
	`join_time` datetime,
	`leave_time` datetime,
	`device` varchar(255),
	`ip_address` varchar(255),
	`location` varchar(255),
	`network_type` varchar(255),
	`data_center` varchar(255),
	`connection_type` varchar(255),
	`share_application` tinyint(1),
	`share_desktop` tinyint(1),
	`share_whiteboard` tinyint(1),
	`recording` tinyint(1),
	`status` varchar(255),
	`pc_name` varchar(255),
	`domain` varchar(255),
	`mac_addr` varchar(255),
	`leave_reason` varchar(255),
	`duration` int NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `batch_participants_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_user` (
	`id` int AUTO_INCREMENT NOT NULL,
	`created_at` timestamp DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` datetime DEFAULT (CURRENT_TIMESTAMP),
	`deleted_at` datetime,
	`username` varchar(300),
	`admission` varchar(300),
	`role` varchar(300),
	`in_time` datetime,
	`out_time` datetime,
	`is_active` tinyint(1),
	`meta` varchar(300),
	`user_id` bigint unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`history` json,
	`status` varchar(300),
	CONSTRAINT `batch_user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batch_user_status_logs` (
	`id` int AUTO_INCREMENT NOT NULL,
	`created_at` timestamp DEFAULT (CURRENT_TIMESTAMP),
	`user_id` bigint unsigned NOT NULL,
	`status` varchar(300),
	`history` json,
	`updated_by` varchar(191),
	`batch_id` bigint NOT NULL,
	CONSTRAINT `batch_user_status_logs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `batches` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`starting` date NOT NULL,
	`duration` varchar(255) NOT NULL,
	`program` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`options` json,
	`meta` json,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`ending` date,
	CONSTRAINT `batches_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `block_draft_unit_movements` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`draft_unit_movement_id` bigint unsigned,
	`block_id` int unsigned,
	`section_id` int unsigned,
	`new_section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`eval_score` double(8,2),
	`eval` json,
	`attendance_percent` double(8,2),
	`assignment_percent` double(8,2),
	`current_async_count` int NOT NULL DEFAULT 0,
	`terminated` tinyint(1),
	`excluded` tinyint(1),
	`completed` tinyint(1),
	`description` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	`suspect_list` tinyint(1) NOT NULL DEFAULT 0,
	`new_section_suspect_list` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `block_draft_unit_movements_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `block_unit_movement_email_templates` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`body` longtext NOT NULL,
	`subject` varchar(255) NOT NULL,
	`variables` json NOT NULL DEFAULT (json_array()),
	`created_at` timestamp,
	`updated_at` timestamp,
	`from` varchar(255),
	`cc` varchar(255),
	`bcc` varchar(255),
	CONSTRAINT `block_unit_movement_email_templates_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `block_unit_movement_emails` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`body` longtext NOT NULL,
	`subject` varchar(255) NOT NULL,
	`variables` json NOT NULL DEFAULT (json_array()),
	`block_id` int unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	`from` varchar(255),
	`cc` varchar(255),
	`bcc` varchar(255),
	CONSTRAINT `block_unit_movement_emails_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `blocks` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`starting` date NOT NULL,
	`ending` date NOT NULL,
	`duration` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`options` json,
	`meta` json,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `blocks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL,
	`type` varchar(255) NOT NULL,
	`settings` json,
	`assignment_percentage_weightage` int NOT NULL,
	`attendance_percentage_weightage` int NOT NULL,
	`day_block` varchar(255),
	`level` varchar(255),
	`section_id` int unsigned,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`user_id` bigint unsigned,
	CONSTRAINT `blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `bookmarks` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`is_bookmarked` tinyint(1) NOT NULL DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `bookmarks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `bounty_programs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`username` varchar(255) NOT NULL,
	`bounties_won` bigint unsigned NOT NULL,
	`coins` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp,
	CONSTRAINT `bounty_programs_id` PRIMARY KEY(`id`),
	CONSTRAINT `bounty_programs_username_unique` UNIQUE(`username`)
);
--> statement-breakpoint
CREATE TABLE `certificates` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`type` varchar(255) NOT NULL,
	`section_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `certificates_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `comments` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`ticket_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`message` text NOT NULL,
	`data` json,
	`status` varchar(255),
	`public` tinyint(1) NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `comments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `companies` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` text,
	`website` text,
	`category` varchar(255),
	`tags` varchar(255),
	`data` json,
	`info` json,
	`settings` json,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`industry` varchar(255),
	`social_media` json,
	`lead_source` varchar(255),
	CONSTRAINT `companies_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `disbursal_statuses` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`old_status` varchar(255),
	`new_status` varchar(255),
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`data` json,
	`info` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `disbursal_statuses_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `discussions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`title` text NOT NULL,
	`message` text NOT NULL,
	`data` json,
	`status` varchar(255),
	`is_closed` tinyint(1) NOT NULL DEFAULT 0,
	`public` tinyint(1) NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`assignee_id` bigint unsigned,
	`gpt_central_data` json,
	CONSTRAINT `discussions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `draft_unit_movements` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`unit_movement_rule_id` bigint unsigned,
	`section_id` int unsigned,
	`new_section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`priority` double(8,2) unsigned,
	`eval_score` double(8,2),
	`eval` json,
	`attendance_percent` double(8,2),
	`assignment_percent` double(8,2),
	`current_async_count` int NOT NULL DEFAULT 0,
	`terminated` tinyint(1),
	`excluded` tinyint(1),
	`completed` tinyint(1),
	`description` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	`suspect_list` tinyint(1) NOT NULL DEFAULT 0,
	`new_section_suspect_list` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `draft_unit_movements_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `elective_entity` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`elective_id` int unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`priority` tinyint unsigned NOT NULL DEFAULT 0,
	`data` json,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `elective_entity_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `elective_progress` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`elective_user_id` int unsigned NOT NULL,
	`elective_entity_id` int unsigned NOT NULL,
	`started_at` timestamp,
	`completed_at` timestamp,
	`data` json,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `elective_progress_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `elective_section` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`elective_id` int unsigned NOT NULL,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `elective_section_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `elective_user` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`elective_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`started_at` timestamp,
	`completed_at` timestamp,
	`data` json,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `elective_user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `electives` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`description` text,
	`status` varchar(255),
	`data` json,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`user_id` bigint unsigned,
	CONSTRAINT `electives_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `eligibilities` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`degree` varchar(255),
	`stream` varchar(255),
	`graduation_year` varchar(255),
	`tenth_percentage` double(8,2),
	`twelfth_percentage` double(8,2),
	`graduation_percentage` double(8,2),
	`location_domicile` varchar(255),
	`gender` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `eligibilities_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `external_offers` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`status` varchar(255),
	`user_id` bigint unsigned NOT NULL,
	`company_name` varchar(255) NOT NULL,
	`ctc` decimal(4,2) NOT NULL,
	`doj` date NOT NULL,
	`offer_letter` varchar(255),
	`offer_letter_sent_to_ops_at` datetime,
	`data` json,
	`info` json,
	`lead_id` bigint unsigned,
	`company_id` bigint unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `external_offers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `external_problem_submissions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`external_id` int NOT NULL,
	`external_problem_user_id` varchar(255),
	`username` varchar(255),
	`external_problem_id` int,
	`external_problem_title` varchar(255),
	`platform` varchar(255),
	`score` varchar(255),
	CONSTRAINT `external_problem_submissions_id` PRIMARY KEY(`id`),
	CONSTRAINT `external_problem_submissions_external_id_platform_unique` UNIQUE(`external_id`,`platform`)
);
--> statement-breakpoint
CREATE TABLE `failed_jobs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`uuid` varchar(255) NOT NULL,
	`connection` text NOT NULL,
	`queue` text NOT NULL,
	`payload` longtext NOT NULL,
	`exception` longtext NOT NULL,
	`failed_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `failed_jobs_id` PRIMARY KEY(`id`),
	CONSTRAINT `failed_jobs_uuid_unique` UNIQUE(`uuid`)
);
--> statement-breakpoint
CREATE TABLE `feedback` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`variables` json NOT NULL DEFAULT (json_array()),
	`settings` json,
	`quiz_id` int unsigned,
	`feedback_blueprint_id` bigint unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	`start_time` datetime,
	`end_time` datetime,
	CONSTRAINT `feedback_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `feedback_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`variables` json NOT NULL DEFAULT (json_array()),
	`settings` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `feedback_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `feedback_gpt_central` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`data` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `feedback_gpt_central_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `feedback_question_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`feedback_blueprint_id` bigint unsigned NOT NULL,
	`question` text NOT NULL,
	`type` varchar(255) NOT NULL,
	`options` json,
	`range` json,
	`settings` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `feedback_question_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `feedback_questions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`feedback_id` bigint unsigned NOT NULL,
	`question` text NOT NULL,
	`type` varchar(255) NOT NULL,
	`options` json,
	`range` json,
	`settings` json,
	`feedback_question_blueprint_id` bigint unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `feedback_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `feedback_responses` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`feedback_id` bigint unsigned NOT NULL,
	`feedback_question_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`response` longtext NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `feedback_responses_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `flag_query` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`flag_id` bigint unsigned NOT NULL,
	`query_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `flag_query_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `flags` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`section_id` int unsigned NOT NULL,
	`flag` varchar(255) NOT NULL,
	`flag_description` varchar(255),
	`flag_entity` varchar(255),
	`flag_entity_id` int,
	`flag_date` date NOT NULL,
	`flag_score` double(8,2),
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `flags_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `githubs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`token` varchar(255) NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`github_user_id` int NOT NULL,
	`username` varchar(255) NOT NULL,
	`repo_name` varchar(255),
	`invitation_accepted` tinyint(1) NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	`gpt_central_data` json,
	CONSTRAINT `githubs_id` PRIMARY KEY(`id`),
	CONSTRAINT `githubs_github_user_id_unique` UNIQUE(`github_user_id`),
	CONSTRAINT `githubs_repo_name_unique` UNIQUE(`repo_name`),
	CONSTRAINT `githubs_token_unique` UNIQUE(`token`),
	CONSTRAINT `githubs_username_unique` UNIQUE(`username`)
);
--> statement-breakpoint
CREATE TABLE `guardian` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`guardian_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255),
	`mobile` varchar(255),
	`address` varchar(255),
	`status` varchar(255),
	`verified` tinyint(1) NOT NULL DEFAULT 0,
	`profile_photo_path` varchar(2048),
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`meta` json,
	CONSTRAINT `guardian_id` PRIMARY KEY(`id`),
	CONSTRAINT `guardian_id_unique` UNIQUE(`guardian_id`)
);
--> statement-breakpoint
CREATE TABLE `guardian_otp` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`mobile` varchar(255) NOT NULL,
	`otp` varchar(255) NOT NULL,
	`expiryTime` timestamp NOT NULL,
	`attemptCount` int unsigned NOT NULL,
	CONSTRAINT `guardian_otp_id` PRIMARY KEY(`id`),
	CONSTRAINT `guardian_otp_mobile_unique` UNIQUE(`mobile`)
);
--> statement-breakpoint
CREATE TABLE `help_faqs` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`category` varchar(255) NOT NULL,
	`sub_category` varchar(255) NOT NULL,
	`question` text NOT NULL,
	`answer` text NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`redirection_to_pc` tinyint(1) NOT NULL DEFAULT 0,
	`is_hidden` tinyint(1) NOT NULL DEFAULT 0,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`assignees` json,
	CONSTRAINT `help_faqs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `institute_batches` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`institute_id` int unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `institute_batches_id` PRIMARY KEY(`id`),
	CONSTRAINT `institute_batches_institute_batch_unique` UNIQUE(`institute_id`,`batch_id`)
);
--> statement-breakpoint
CREATE TABLE `institutes` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`short_name` varchar(50),
	`description` text,
	`logo_url` varchar(500),
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`meta` json,
	`settings` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `institutes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `interaction_messages` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`interaction_id` int unsigned NOT NULL,
	`message` text NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`sent_at` timestamp NOT NULL,
	CONSTRAINT `interaction_messages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `interactions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255),
	`ticket_id` int unsigned,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `interactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `interviews` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_by` bigint unsigned,
	`status` varchar(255),
	`data` json,
	`info` json,
	`feedback` json,
	`starting_at` datetime,
	`ending_at` datetime,
	`application_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`round` varchar(255),
	`round_number` int,
	CONSTRAINT `interviews_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `jobs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`queue` varchar(255) NOT NULL,
	`payload` longtext NOT NULL,
	`attempts` tinyint unsigned NOT NULL,
	`reserved_at` int unsigned,
	`available_at` int unsigned NOT NULL,
	`created_at` int unsigned NOT NULL,
	CONSTRAINT `jobs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `leads` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`category` varchar(255) NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`name` varchar(255),
	`email` varchar(255),
	`phone` varchar(255),
	`data` json,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `leads_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `learning_objectives` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lo_id` varchar(255) NOT NULL,
	`lo_name` varchar(255) NOT NULL,
	`topic_id` int unsigned NOT NULL,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp,
	CONSTRAINT `learning_objectives_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `lecture_ai_generated_content` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`gpt_ai_central_data` json,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `lecture_ai_generated_content_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `lecture_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`description` varchar(255),
	`optional` tinyint(1) NOT NULL,
	`blueprint_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`week` int NOT NULL,
	`day` varchar(255) NOT NULL,
	`zoom_link` varchar(255),
	`notes` text,
	`videos` json,
	`settings` json,
	`data` json,
	`visible` tinyint(1),
	`vimeo_player_embed_url` varchar(255),
	`vimeo_download_links` json,
	`lecture_id` int unsigned,
	`scheduled_time` time,
	`concludes_time` time,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`section_feedback_blueprint_id` bigint unsigned,
	CONSTRAINT `lecture_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `lecture_feedback` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`response` json,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`feedback` varchar(191),
	`rating` int NOT NULL DEFAULT 0,
	CONSTRAINT `lecture_feedback_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `lecture_interactions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`first_opened_at` timestamp NOT NULL,
	`last_opened_at` timestamp NOT NULL,
	`total_opens` int unsigned NOT NULL DEFAULT 1,
	`content_scroll_percentage` tinyint unsigned,
	`notes_viewed` tinyint(1) NOT NULL DEFAULT 0,
	`videos_viewed` tinyint(1) NOT NULL DEFAULT 0,
	`ai_content_viewed` tinyint(1) NOT NULL DEFAULT 0,
	`time_spent_seconds` int unsigned,
	`data` json,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `lecture_interactions_id` PRIMARY KEY(`id`),
	CONSTRAINT `lecture_interactions_lecture_user_unique` UNIQUE(`lecture_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `lectures` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`description` text,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`week` tinyint unsigned NOT NULL,
	`day` tinyint unsigned NOT NULL,
	`schedule` datetime,
	`concludes` datetime,
	`zoom_link` varchar(255),
	`notes` text,
	`videos` json,
	`settings` json,
	`data` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`vimeo_player_embed_url` varchar(255),
	`vimeo_download_links` json,
	`feedback_id` bigint unsigned,
	`start_date` date,
	`end_date` date,
	`start_time` int,
	`end_time` int,
	`add_to_blueprint` tinyint(1) NOT NULL DEFAULT 1,
	`gpt_central_data` json,
	`host_id` bigint unsigned,
	`feedback_response_trousers` json,
	`learning_objectives` json,
	CONSTRAINT `lectures_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `lectures_ai` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`transcript` longtext,
	`summary` longtext,
	`concepts` json,
	`lectureId` int unsigned NOT NULL,
	`isConceptsPublished` tinyint(1),
	`isSummaryPublished` tinyint(1),
	`transcriptSegments` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`lastRefetchTime` datetime(3),
	`transcriptID` varchar(191),
	CONSTRAINT `lectures_ai_id` PRIMARY KEY(`id`),
	CONSTRAINT `lectures_ai_lectureId_key` UNIQUE(`lectureId`)
);
--> statement-breakpoint
CREATE TABLE `lectures_course` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`description` text,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`week` tinyint unsigned NOT NULL,
	`day` tinyint unsigned NOT NULL,
	`schedule` datetime,
	`concludes` datetime,
	`zoom_link` varchar(255),
	`notes` text,
	`videos` json,
	`settings` json,
	`data` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`vimeo_player_embed_url` varchar(255),
	`vimeo_download_links` json,
	CONSTRAINT `lectures_course_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `media` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`location` varchar(255),
	`type` varchar(255),
	`data` json,
	`meta` json,
	`user_id` bigint unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `media_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `meetings` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`zoom_id` varchar(255),
	`uuid` varchar(255),
	`topic` text,
	`user_name` varchar(255),
	`user_email` varchar(255),
	`start_time` datetime,
	`end_time` datetime,
	`duration` int NOT NULL DEFAULT 0,
	`total_minutes` int NOT NULL DEFAULT 0,
	`participants_count` int NOT NULL DEFAULT 0,
	`class_count` int NOT NULL DEFAULT 0,
	`tracking_fields` json,
	`title` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`category` varchar(255),
	`optional` int NOT NULL DEFAULT 0,
	`host_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `meetings_id` PRIMARY KEY(`id`),
	CONSTRAINT `meetings_lecture_id_unique` UNIQUE(`lecture_id`)
);
--> statement-breakpoint
CREATE TABLE `menus` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`category` varchar(255) NOT NULL,
	`value` varchar(255) NOT NULL,
	`ordering` mediumint NOT NULL,
	`data` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deprecated` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `menus_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `messages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`subject` varchar(255) NOT NULL,
	`body` text NOT NULL,
	`author_id` bigint unsigned NOT NULL,
	`priority` varchar(255),
	`read_at` datetime,
	`meta` json,
	`message_id` bigint unsigned,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `messages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `migrations` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`migration` varchar(255) NOT NULL,
	`batch` int NOT NULL,
	CONSTRAINT `migrations_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `notes` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255),
	`body` text,
	`data` json,
	`user_id` bigint unsigned NOT NULL,
	`author_id` bigint unsigned NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `notes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `notification_logs` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`notification_type` varchar(50) NOT NULL,
	`entity_type` varchar(50) NOT NULL,
	`entity_id` int unsigned NOT NULL,
	`title` varchar(255) NOT NULL,
	`body` text NOT NULL,
	`data` json,
	`status` varchar(50) NOT NULL,
	`sent_at` timestamp,
	`error_message` text,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `notification_logs_id` PRIMARY KEY(`id`),
	CONSTRAINT `notification_logs_unique_notification` UNIQUE(`user_id`,`notification_type`,`entity_id`)
);
--> statement-breakpoint
CREATE TABLE `notifications` (
	`id` char(36) NOT NULL,
	`type` varchar(255) NOT NULL,
	`notifiable_type` varchar(255) NOT NULL,
	`notifiable_id` bigint unsigned NOT NULL,
	`data` text NOT NULL,
	`read_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `notifications_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `nps_forms` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(191) NOT NULL,
	`description` varchar(191),
	`user_id` bigint unsigned NOT NULL,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`starts_at` datetime,
	`ends_at` datetime,
	`status` enum('DRAFT','PUBLISHED','CLOSED') NOT NULL DEFAULT 'DRAFT',
	`is_active` tinyint(1) NOT NULL DEFAULT 1,
	`allow_multiple_attempts` tinyint(1) NOT NULL DEFAULT 0,
	`max_attempts` int,
	`settings` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	`deleted_at` timestamp,
	CONSTRAINT `nps_forms_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `nps_question_responses` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`nps_submission_id` int unsigned NOT NULL,
	`nps_question_id` int unsigned NOT NULL,
	`response` json NOT NULL,
	`answered_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `nps_question_responses_id` PRIMARY KEY(`id`),
	CONSTRAINT `nps_question_responses_nps_submission_id_nps_question_id_unique` UNIQUE(`nps_submission_id`,`nps_question_id`)
);
--> statement-breakpoint
CREATE TABLE `nps_questions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`nps_form_id` int unsigned NOT NULL,
	`question_text` text NOT NULL,
	`question_type` enum('MCQ_SINGLE','MCQ_MULTIPLE','DESCRIPTION','RATING_SCALE','DATE_PICKER','TRUE_FALSE') NOT NULL,
	`sequence` int NOT NULL,
	`is_required` tinyint(1) NOT NULL DEFAULT 0,
	`is_scored` tinyint(1) NOT NULL DEFAULT 0,
	`config` json,
	`settings` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	`deleted_at` timestamp,
	CONSTRAINT `nps_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `nps_submissions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`nps_form_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`attempt_number` int NOT NULL,
	`status` enum('DRAFT','SUBMITTED','ABANDONED') NOT NULL DEFAULT 'DRAFT',
	`is_locked` tinyint(1) NOT NULL DEFAULT 0,
	`started_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`completed_at` timestamp,
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	`deleted_at` timestamp,
	CONSTRAINT `nps_submissions_id` PRIMARY KEY(`id`),
	CONSTRAINT `nps_submissions_nps_form_id_user_id_attempt_number_unique` UNIQUE(`nps_form_id`,`user_id`,`attempt_number`)
);
--> statement-breakpoint
CREATE TABLE `opinions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255),
	`body` varchar(255),
	`data` json,
	`user_id` bigint unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `opinions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `opt_in_choices` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`section_id` int unsigned NOT NULL,
	`track_name` varchar(255) NOT NULL,
	`track_description` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `opt_in_choices_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `pages` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` text,
	`content` longtext,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `pages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `participant_metrics` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`zoom_id` varchar(255),
	`user_id` varchar(255),
	`name` varchar(255),
	`email` varchar(255),
	`join_time` datetime,
	`leave_time` datetime,
	`device` varchar(255),
	`ip_address` varchar(255),
	`location` varchar(255),
	`network_type` varchar(255),
	`data_center` varchar(255),
	`connection_type` varchar(255),
	`share_application` tinyint(1),
	`share_desktop` tinyint(1),
	`share_whiteboard` tinyint(1),
	`recording` tinyint(1),
	`status` varchar(255),
	`pc_name` varchar(255),
	`domain` varchar(255),
	`mac_addr` varchar(255),
	`leave_reason` varchar(255),
	`duration` int NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	`actual_user_id` bigint unsigned,
	CONSTRAINT `participant_metrics_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `participants` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`zoom_id` varchar(255),
	`user_id` varchar(255),
	`name` varchar(255),
	`email` varchar(255),
	`join_time` datetime,
	`leave_time` datetime,
	`duration` int NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `participants_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `password_resets` (
	`email` varchar(255) NOT NULL,
	`token` varchar(255) NOT NULL,
	`created_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `personal_access_tokens` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`tokenable_type` varchar(255) NOT NULL,
	`tokenable_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	`token` varchar(64) NOT NULL,
	`abilities` text,
	`last_used_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `personal_access_tokens_id` PRIMARY KEY(`id`),
	CONSTRAINT `personal_access_tokens_token_unique` UNIQUE(`token`)
);
--> statement-breakpoint
CREATE TABLE `placement_statuses` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`status` varchar(255) NOT NULL,
	`sub_status` varchar(255),
	`entity_type` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`data` json,
	`info` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `placement_statuses_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `placement_tags` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`taggable_type` varchar(255) NOT NULL,
	`taggable_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `placement_tags_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `portfolio_feedback` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`submission_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`comment` varchar(255) NOT NULL,
	`videoURL` varchar(255),
	CONSTRAINT `portfolio_feedback_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `portfolio_student_ias` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`student_id` bigint unsigned NOT NULL,
	`ia_id` bigint unsigned NOT NULL,
	`is_active` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `portfolio_student_ias_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `portfolio_submissions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`student_id` bigint unsigned NOT NULL,
	`cpsubmissionid` int NOT NULL,
	`cpassignmentid` int NOT NULL,
	`problemInstanceid` int NOT NULL,
	`submissionURL` varchar(255) NOT NULL,
	`status` varchar(255),
	`score` int,
	`raisedForFeedback` enum('Unraised','Raised','Closed') NOT NULL DEFAULT 'Unraised',
	`newComment` enum('None','Student','IA') NOT NULL DEFAULT 'None',
	CONSTRAINT `portfolio_submissions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `position_params` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`position_id` bigint unsigned NOT NULL,
	`type` varchar(255) NOT NULL,
	`value` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`data` json,
	CONSTRAINT `position_params_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `positions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` text,
	`location` json,
	`openings` smallint NOT NULL DEFAULT 1,
	`min_salary` decimal(4,2),
	`max_salary` decimal(4,2),
	`category` varchar(255),
	`tags` varchar(255),
	`data` json,
	`info` json,
	`settings` json,
	`rounds` json,
	`status` varchar(255),
	`additional_criteria` text,
	`application_process` varchar(255),
	`working_mode` varchar(255),
	`company_id` bigint unsigned NOT NULL,
	`eligibility_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`cpid` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`relocation` varchar(255),
	`bond` tinyint(1),
	`bond_details` text,
	`openings_bd_poc` smallint,
	`sub_status` varchar(255),
	`expected_closure` int,
	`expected_closure_date` datetime,
	`difficulty_level_tech` varchar(255),
	`intent` varchar(255),
	`handbook` text,
	`opening_type` varchar(255),
	`stipend` decimal(5,2),
	`internship_duration` smallint,
	CONSTRAINT `positions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `positions_histories` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`position_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`old_status` varchar(255),
	`old_sub_status` varchar(255),
	`new_status` varchar(255),
	`new_sub_status` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `positions_histories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_interviews` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`unique_id` varchar(255) NOT NULL,
	`interview_id` varchar(255) NOT NULL,
	`token` varchar(255),
	`interview_link` varchar(500),
	`error_message` text,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `practice_interviews_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_quiz_responses` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`entity_id` int unsigned NOT NULL,
	`entity_type` varchar(255) NOT NULL,
	`data` json NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`active_practice_session` int unsigned NOT NULL DEFAULT 1,
	CONSTRAINT `practice_quiz_responses_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_test_questions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`assessQuestionId` varchar(255) NOT NULL,
	`practice_sub_topic_id` int unsigned NOT NULL,
	`difficulty` enum('Easy','Medium','Hard') NOT NULL DEFAULT 'Medium',
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `practice_test_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_test_questions_users_attempted` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`practice_test_question_id` int unsigned NOT NULL,
	`assessToken` varchar(255) NOT NULL,
	`isCorrect` tinyint(1) NOT NULL DEFAULT 0,
	`isSkipped` tinyint(1) NOT NULL DEFAULT 0,
	`score` int NOT NULL DEFAULT 0,
	`hasAvailedHint` tinyint(1) NOT NULL DEFAULT 0,
	`isAttempted` tinyint(1) NOT NULL DEFAULT 0,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `practice_test_questions_users_attempted_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_test_sub_topics` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`practice_topic_id` int unsigned NOT NULL,
	`assessTagRelationshipId` varchar(255),
	`iconsUrl` varchar(2048),
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `practice_test_sub_topics_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `practice_test_topics` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` text NOT NULL,
	`iconsUrl` varchar(2048),
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `practice_test_topics_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `problem_links` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`platform` varchar(255) NOT NULL,
	`external_problem_id` int NOT NULL,
	`problem_id` int unsigned NOT NULL,
	`assignment_id` int unsigned NOT NULL,
	CONSTRAINT `problem_links_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `problems` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`statement` text NOT NULL,
	`category` varchar(255) NOT NULL,
	`topic` varchar(255) NOT NULL,
	`tags` varchar(255),
	`description` text,
	`approach` text,
	`rubrics` text,
	`type` enum('LINK','FILE','BUTTON') NOT NULL DEFAULT 'LINK',
	`submission_proof` tinyint(1) NOT NULL DEFAULT 0,
	`submission_instructions` text,
	`marks` tinyint unsigned NOT NULL DEFAULT 1,
	`timing` smallint unsigned NOT NULL DEFAULT 0,
	`user_id` bigint unsigned NOT NULL,
	`options` json,
	`meta` json,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `problems_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `profile_verifies` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`created_by` bigint unsigned,
	`field` varchar(255),
	`value` text,
	`old_value` text,
	`verified` tinyint(1) NOT NULL DEFAULT 0,
	`verified_by` bigint unsigned,
	`verified_at` datetime,
	`rejected_by` bigint unsigned,
	`rejected_at` datetime,
	`rejected_reason` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `profile_verifies_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `profiles` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`birth_date` date,
	`gender` enum('MALE','FEMALE','OTHER') NOT NULL DEFAULT 'OTHER',
	`education` json,
	`experience` json,
	`family` json,
	`finance` json,
	`isa` json,
	`social_media` json,
	`meta` json,
	`info` json,
	`data` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`isa_status` varchar(255),
	`isa_signing_time` timestamp,
	`graduation_time` timestamp,
	`placement_time` timestamp,
	`dropout_time` timestamp,
	`placement` json,
	`address` json,
	`placement_status` varchar(255),
	`placement_sub_status` varchar(255),
	`secondary_email` varchar(255),
	`secondary_mobile` varchar(255),
	`documents` json,
	`declaration` json,
	`stage` varchar(255),
	`disbursal_status` varchar(255),
	`resume_builder_id` varchar(255),
	`personal_info` json,
	`haveAcceptedLegalAggrement` tinyint(1),
	`haveClosedModal` int unsigned,
	`legal_data` json,
	CONSTRAINT `profiles_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `queries` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`section_id` int unsigned NOT NULL,
	`query` varchar(255) NOT NULL,
	`query_description` varchar(255),
	`query_status` varchar(255) NOT NULL,
	`query_date` date NOT NULL,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `queries_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `query_comments` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`query_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`message` text NOT NULL,
	`data` json,
	`status` varchar(255),
	`public` tinyint(1) NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `query_comments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `question_quiz` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`quiz_id` int unsigned NOT NULL,
	`question_id` int unsigned NOT NULL,
	`priority` tinyint unsigned NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `question_quiz_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `questions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`question` text NOT NULL,
	`category` varchar(255) NOT NULL,
	`topic` varchar(255) NOT NULL,
	`tags` varchar(255),
	`explanation` text,
	`type` enum('MC','SHORT','LONG','TF','SC') NOT NULL DEFAULT 'MC',
	`marks` tinyint unsigned NOT NULL DEFAULT 1,
	`timing` smallint unsigned NOT NULL DEFAULT 0,
	`user_id` bigint unsigned NOT NULL,
	`options` json,
	`meta` json,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `quiz_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`instructions` text,
	`optional` tinyint(1) NOT NULL,
	`blueprint_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`week` int NOT NULL,
	`day` varchar(255) NOT NULL,
	`shuffle` tinyint(1) NOT NULL,
	`time_limit` int NOT NULL,
	`show_answers` tinyint(1) NOT NULL,
	`show_scores` tinyint(1) NOT NULL,
	`settings` json,
	`data` json,
	`visible` tinyint(1) NOT NULL,
	`quiz_id` int unsigned,
	`scheduled_time` time,
	`concludes_time` time,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `quiz_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `quiz_blueprints_questions` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`quiz_blueprint_id` bigint unsigned NOT NULL,
	`question_id` int unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `quiz_blueprints_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `quizzes` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`category` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tags` varchar(255),
	`instructions` text,
	`optional` tinyint(1) NOT NULL DEFAULT 0,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`user_id` bigint unsigned NOT NULL,
	`week` tinyint unsigned NOT NULL,
	`day` tinyint unsigned NOT NULL,
	`shuffle` tinyint(1) NOT NULL DEFAULT 0,
	`time_limit` mediumint unsigned NOT NULL DEFAULT 0,
	`show_answers` tinyint(1) NOT NULL DEFAULT 0,
	`show_scores` tinyint(1) NOT NULL DEFAULT 0,
	`schedule` datetime,
	`concludes` datetime,
	`settings` json,
	`data` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`start_date` date,
	`end_date` date,
	`start_time` int,
	`end_time` int,
	`add_to_blueprint` tinyint(1) NOT NULL DEFAULT 1,
	CONSTRAINT `quizzes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `rbac_permissions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`resource` varchar(100) NOT NULL,
	`action` varchar(100) NOT NULL,
	`description` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `rbac_permissions_id` PRIMARY KEY(`id`),
	CONSTRAINT `rbac_permissions_resource_action_key` UNIQUE(`resource`,`action`)
);
--> statement-breakpoint
CREATE TABLE `rbac_role_permissions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`role_id` int unsigned NOT NULL,
	`permission_id` int unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `rbac_role_permissions_id` PRIMARY KEY(`id`),
	CONSTRAINT `rbac_role_permissions_role_id_permission_id_key` UNIQUE(`role_id`,`permission_id`)
);
--> statement-breakpoint
CREATE TABLE `rbac_roles` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(100) NOT NULL,
	`description` text,
	`created_by` bigint unsigned,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`deleted_at` timestamp,
	CONSTRAINT `rbac_roles_id` PRIMARY KEY(`id`),
	CONSTRAINT `rbac_roles_name_key` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `rbac_user_roles` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`role_id` int unsigned NOT NULL,
	`scope_type` varchar(50) NOT NULL,
	`batch_id` int unsigned,
	`section_id` int unsigned,
	`assigned_by` bigint unsigned,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	CONSTRAINT `rbac_user_roles_id` PRIMARY KEY(`id`),
	CONSTRAINT `rbac_user_roles_user_id_role_id_scope_type_batch_id_section__key` UNIQUE(`user_id`,`role_id`,`scope_type`,`batch_id`,`section_id`)
);
--> statement-breakpoint
CREATE TABLE `scenes` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`order` int NOT NULL,
	`archived` tinyint(1) NOT NULL DEFAULT 0,
	`success_scene_id` int unsigned,
	`failure_scene_id` int unsigned,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `scenes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `section_feedback_blueprints` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`variables` json NOT NULL DEFAULT (json_array()),
	`settings` json,
	`quiz_id` int unsigned,
	`feedback_blueprint_id` bigint unsigned,
	`blueprint_id` bigint unsigned,
	`feedback_id` bigint unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `section_feedback_blueprints_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `section_user` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`section_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`manager_id` bigint unsigned,
	`role` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP) ON UPDATE CURRENT_TIMESTAMP,
	`current_async_count` int NOT NULL DEFAULT 0,
	`opt_in_choice_id` bigint unsigned,
	`permitted` tinyint(1),
	`suspect_list` tinyint(1) NOT NULL DEFAULT 0,
	`meta` json,
	CONSTRAINT `section_user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `section_user_course` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`section_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`manager_id` bigint unsigned,
	`role` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`current_async_count` int NOT NULL DEFAULT 0,
	`opt_in_choice_id` bigint unsigned,
	`permitted` tinyint(1),
	CONSTRAINT `section_user_course_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `sections` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`type` varchar(255) NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`settings` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`block_id` int unsigned,
	`assignment_percentage_weightage` double(8,2) NOT NULL DEFAULT 0,
	`attendance_percentage_weightage` double(8,2) NOT NULL DEFAULT 0,
	`opt_in_start_datetime` timestamp,
	`opt_in_end_datetime` timestamp,
	`day_block` varchar(255),
	`start_time` int,
	`end_time` int,
	`level` double(8,2),
	`course_type` varchar(255),
	`unit_movement_completed` tinyint(1) NOT NULL DEFAULT 0,
	CONSTRAINT `sections_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `segments` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`scene_id` int unsigned NOT NULL,
	`video` varchar(191),
	`slide` json,
	`subtitle` varchar(191),
	`order` int NOT NULL,
	`archived` tinyint(1) NOT NULL DEFAULT 0,
	`type` varchar(191) NOT NULL,
	`next_segment_id` int unsigned,
	`data` json,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `segments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `sessions` (
	`id` varchar(255) NOT NULL,
	`user_id` bigint unsigned,
	`ip_address` varchar(45),
	`user_agent` text,
	`payload` text NOT NULL,
	`last_activity` int NOT NULL,
	CONSTRAINT `sessions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `solutions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`submission_id` int unsigned NOT NULL,
	`problem_id` int unsigned NOT NULL,
	`submission_link` text NOT NULL,
	`submission_proof_link` text,
	`feedback` json,
	`data` json,
	`score` tinyint unsigned NOT NULL DEFAULT 0,
	`started_at` datetime,
	`submitted_at` datetime,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `solutions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `student_attendances` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned,
	`lecture_id` int unsigned NOT NULL,
	`schedule` datetime NOT NULL,
	`section_id` int unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`live_percentage` tinyint NOT NULL DEFAULT 0,
	`live_attendance_status` tinyint NOT NULL DEFAULT 0,
	`joined_late` tinyint(1) NOT NULL DEFAULT 0,
	`late_by_minutes` int unsigned,
	`video_percentage` tinyint NOT NULL DEFAULT 0,
	`video_attendance_status` tinyint NOT NULL DEFAULT 0,
	`video_last_updated_at` timestamp,
	`include_video_attendance` tinyint(1) NOT NULL DEFAULT 0,
	`catch_up_days` int unsigned,
	`status` tinyint NOT NULL DEFAULT 0,
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `student_attendances_id` PRIMARY KEY(`id`),
	CONSTRAINT `student_attendances_lecture_id_user_id_unique` UNIQUE(`lecture_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `student_tag_categories` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`category` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`meta` json,
	`parent_category_id` int unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `student_tag_categories_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `student_tag_names` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `student_tag_names_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `student_tag_relation` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`name_id` int unsigned NOT NULL,
	`type_id` int unsigned NOT NULL,
	`category_id` int unsigned NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`global` tinyint(1) NOT NULL DEFAULT 0,
	`visible_to_student` tinyint(1) NOT NULL DEFAULT 1,
	`meta` json,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `student_tag_relation_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `student_tag_types` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`type` varchar(255) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `student_tag_types_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `submissions` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`assignment_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`score` double NOT NULL DEFAULT 0,
	`started_at` timestamp,
	`completed_at` timestamp,
	`data` json,
	`problems` json,
	`started` tinyint(1) NOT NULL DEFAULT 0,
	`completed` tinyint(1) NOT NULL DEFAULT 0,
	`status` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`mark_as_completed` tinyint(1),
	CONSTRAINT `submissions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `tasks` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(255) NOT NULL,
	`entity_id` bigint unsigned NOT NULL,
	`entity_type` varchar(50) NOT NULL,
	`description` text,
	`task_type` varchar(50) NOT NULL,
	`status` varchar(50) NOT NULL,
	`assignee_id` bigint unsigned NOT NULL,
	`batch_id` int unsigned NOT NULL,
	`meta` json,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `tasks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `team_invitations` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`team_id` bigint unsigned NOT NULL,
	`email` varchar(255) NOT NULL,
	`role` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `team_invitations_id` PRIMARY KEY(`id`),
	CONSTRAINT `team_invitations_team_id_email_unique` UNIQUE(`team_id`,`email`)
);
--> statement-breakpoint
CREATE TABLE `team_user` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`team_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`role` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `team_user_id` PRIMARY KEY(`id`),
	CONSTRAINT `team_user_team_id_user_id_unique` UNIQUE(`team_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `teams` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	`personal_team` tinyint(1) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `teams_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `threads` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`discussion_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`message` text NOT NULL,
	`data` json,
	`status` varchar(255),
	`public` tinyint(1) NOT NULL DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`read_at` timestamp,
	CONSTRAINT `threads_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `ticket_templates` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`title` varchar(500) NOT NULL,
	`description` longtext NOT NULL,
	`created_by` bigint unsigned NOT NULL,
	`updated_by` bigint unsigned,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `ticket_templates_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `tickets` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`title` text NOT NULL,
	`message` text NOT NULL,
	`data` json,
	`status` varchar(255),
	`department` varchar(255),
	`priority` varchar(255),
	`is_closed` tinyint(1) NOT NULL DEFAULT 0,
	`assignee_id` bigint unsigned NOT NULL,
	`closed_at` datetime,
	`meta` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`category` varchar(255) NOT NULL,
	`agent_id` bigint unsigned,
	`rating` int unsigned NOT NULL DEFAULT 0,
	`info` json,
	`logstamps` json,
	CONSTRAINT `tickets_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `topic_objectives` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`topic_id` varchar(255) NOT NULL,
	`topic_name` varchar(255) NOT NULL,
	`topic_group` int unsigned NOT NULL,
	`meta` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp,
	CONSTRAINT `topic_objectives_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `unit_movement_rules` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`section_id` int unsigned NOT NULL,
	`new_section_id` int unsigned,
	`priority` double(8,2) unsigned NOT NULL,
	`min_weighted_score` double(8,2),
	`max_weighted_score` double(8,2),
	`min_attendance_percentage` double(8,2),
	`max_attendance_percentage` double(8,2),
	`min_assignment_percentage` double(8,2),
	`max_assignment_percentage` double(8,2),
	`min_current_async_count` int,
	`max_current_async_count` int,
	`min_strike_count` int,
	`max_strike_count` int,
	`mark_users_async_on_new_section` tinyint(1),
	`completed` tinyint(1),
	`opt_in_choice_id` bigint unsigned,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `unit_movement_rules_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `unit_movement_user_details` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`user_code` varchar(255),
	`last_active_at` datetime,
	`section_id` int unsigned NOT NULL,
	`oj_assignment_percent` int,
	`assignment_percent` int,
	`attempt_percent` int,
	`attendance_percent` int,
	`eval` json,
	`eval_one` int,
	`eval_two` int,
	`eval_three` int,
	`eval_four` int,
	`eval_five` int,
	`eval_six` int,
	`project_score` int,
	`level` int unsigned,
	`async_count` int,
	`hackerrank` int,
	`strike_count` int,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `unit_movement_user_details_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_block_emails` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`block_id` int unsigned,
	`block_unit_movement_email_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `user_block_emails_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_device_tokens` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`token` varchar(255) NOT NULL,
	`device_type` varchar(50),
	`device_name` varchar(255),
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`last_used` timestamp,
	`created_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP),
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `user_device_tokens_id` PRIMARY KEY(`id`),
	CONSTRAINT `user_device_tokens_user_id_token_unique` UNIQUE(`user_id`,`token`)
);
--> statement-breakpoint
CREATE TABLE `user_documents` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	`link` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`deleted_at` timestamp,
	CONSTRAINT `user_documents_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_guardian` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`guardian_id` bigint unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `user_guardian_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_relation` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`relation_id` int unsigned NOT NULL,
	`section_id` int unsigned NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `user_relation_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_relation_history` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_relation_id` int unsigned NOT NULL,
	`old_value` json,
	`new_value` json,
	`user_id` bigint unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `user_relation_history_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_scenes` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`scene_id` int unsigned NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`deleted_at` timestamp,
	CONSTRAINT `user_scenes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_segments` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`segment_id` int unsigned NOT NULL,
	`data` json,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	CONSTRAINT `user_segments_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_tags` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`user_id` bigint unsigned NOT NULL,
	`name` varchar(255) NOT NULL,
	CONSTRAINT `user_tags_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` bigint unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`email_verified_at` timestamp,
	`password` varchar(255) NOT NULL,
	`two_factor_secret` text,
	`two_factor_recovery_codes` text,
	`remember_token` varchar(100),
	`current_team_id` bigint unsigned,
	`profile_photo_path` varchar(2048),
	`created_at` timestamp,
	`updated_at` timestamp,
	`role` varchar(255),
	`mobile` varchar(255),
	`title` varchar(255),
	`status` varchar(255),
	`username` varchar(255),
	`last_active_at` timestamp,
	`status_time` datetime,
	`meta` json,
	CONSTRAINT `users_id` PRIMARY KEY(`id`),
	CONSTRAINT `users_email_unique` UNIQUE(`email`),
	CONSTRAINT `users_username_unique` UNIQUE(`username`)
);
--> statement-breakpoint
CREATE TABLE `users_course` (
	`id` bigint unsigned NOT NULL DEFAULT 0,
	`name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`email_verified_at` timestamp,
	`password` varchar(255) NOT NULL,
	`two_factor_secret` text,
	`two_factor_recovery_codes` text,
	`remember_token` varchar(100),
	`current_team_id` bigint unsigned,
	`profile_photo_path` varchar(2048),
	`created_at` timestamp,
	`updated_at` timestamp,
	`role` varchar(255),
	`mobile` varchar(255),
	`title` varchar(255),
	`status` varchar(255),
	`username` varchar(255),
	`last_active_at` timestamp,
	`status_time` datetime,
	`meta` json
);
--> statement-breakpoint
CREATE TABLE `video_attendances` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`lecture_id` int unsigned NOT NULL,
	`user_id` bigint unsigned NOT NULL,
	`host_id` bigint unsigned NOT NULL,
	`category` varchar(255) NOT NULL,
	`duration` int NOT NULL,
	`batch_id` int NOT NULL,
	`section_id` int NOT NULL,
	`type` varchar(255) NOT NULL,
	`status` int NOT NULL,
	`schedule` datetime NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`intervals` json,
	`totalDuration` int,
	`data` json,
	`sessionToken` varchar(191),
	CONSTRAINT `video_attendances_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `whatsnew` (
	`id` int unsigned AUTO_INCREMENT NOT NULL,
	`subject` varchar(255) NOT NULL,
	`body` text NOT NULL,
	`image` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `whatsnew_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `access_logs` ADD CONSTRAINT `access_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_approvers` ADD CONSTRAINT `adhoc_session_approvers_adhoc_session_id_foreign` FOREIGN KEY (`adhoc_session_id`) REFERENCES `adhoc_sessions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_approvers` ADD CONSTRAINT `adhoc_session_approvers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_batches` ADD CONSTRAINT `adhoc_session_batches_adhoc_session_id_foreign` FOREIGN KEY (`adhoc_session_id`) REFERENCES `adhoc_sessions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_batches` ADD CONSTRAINT `adhoc_session_batches_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_blocks` ADD CONSTRAINT `adhoc_session_blocks_adhoc_session_id_foreign` FOREIGN KEY (`adhoc_session_id`) REFERENCES `adhoc_sessions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_blocks` ADD CONSTRAINT `adhoc_session_blocks_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_sections` ADD CONSTRAINT `adhoc_session_sections_adhoc_session_id_foreign` FOREIGN KEY (`adhoc_session_id`) REFERENCES `adhoc_sessions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_sections` ADD CONSTRAINT `adhoc_session_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_users` ADD CONSTRAINT `adhoc_session_users_adhoc_session_id_foreign` FOREIGN KEY (`adhoc_session_id`) REFERENCES `adhoc_sessions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_session_users` ADD CONSTRAINT `adhoc_session_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_sessions` ADD CONSTRAINT `adhoc_sessions_adhoc_session_blueprint_id_foreign` FOREIGN KEY (`adhoc_session_blueprint_id`) REFERENCES `adhoc_session_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `adhoc_sessions` ADD CONSTRAINT `adhoc_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `ai_chat_practice_questions` ADD CONSTRAINT `ai_chat_practice_questions_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `lectures`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_chat_practice_questions` ADD CONSTRAINT `ai_chat_practice_questions_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_feedback` ADD CONSTRAINT `ai_feedback_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `lectures`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_feedback` ADD CONSTRAINT `ai_feedback_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_practice_questions` ADD CONSTRAINT `ai_practice_questions_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `lectures`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_practice_questions` ADD CONSTRAINT `ai_practice_questions_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_tutor_sessions` ADD CONSTRAINT `ai_tutor_sessions_lecture_id_fkey` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `ai_tutor_sessions` ADD CONSTRAINT `ai_tutor_sessions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `announcements` ADD CONSTRAINT `announcements_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `announcements` ADD CONSTRAINT `announcements_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `announcements` ADD CONSTRAINT `announcements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `answers` ADD CONSTRAINT `answers_attempt_id_foreign` FOREIGN KEY (`attempt_id`) REFERENCES `attempts`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `answers` ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `application_comments` ADD CONSTRAINT `application_comments_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `application_comments` ADD CONSTRAINT `application_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `application_histories` ADD CONSTRAINT `application_histories_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `application_histories` ADD CONSTRAINT `application_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `applications` ADD CONSTRAINT `applications_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `applications` ADD CONSTRAINT `applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_blueprints` ADD CONSTRAINT `assignment_blueprints_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_blueprints` ADD CONSTRAINT `assignment_blueprints_blueprint_id_foreign` FOREIGN KEY (`blueprint_id`) REFERENCES `blueprints`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_blueprints` ADD CONSTRAINT `assignment_blueprints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_blueprints_problems` ADD CONSTRAINT `assignment_blueprints_problems_assignment_blueprint_id_foreign` FOREIGN KEY (`assignment_blueprint_id`) REFERENCES `assignment_blueprints`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_blueprints_problems` ADD CONSTRAINT `assignment_blueprints_problems_problem_id_foreign` FOREIGN KEY (`problem_id`) REFERENCES `problems`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_problem` ADD CONSTRAINT `assignment_problem_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignment_problem` ADD CONSTRAINT `assignment_problem_problem_id_foreign` FOREIGN KEY (`problem_id`) REFERENCES `problems`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignments` ADD CONSTRAINT `assignments_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignments` ADD CONSTRAINT `assignments_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `assignments` ADD CONSTRAINT `assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attempts` ADD CONSTRAINT `attempts_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attempts` ADD CONSTRAINT `attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attendances` ADD CONSTRAINT `attendances_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attendances` ADD CONSTRAINT `attendances_host_id_foreign` FOREIGN KEY (`host_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attendances` ADD CONSTRAINT `attendances_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attendances` ADD CONSTRAINT `attendances_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `attendances` ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info` ADD CONSTRAINT `batch_info_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info` ADD CONSTRAINT `batch_info_checker_id_foreign` FOREIGN KEY (`checker_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info` ADD CONSTRAINT `batch_info_maker_id_foreign` FOREIGN KEY (`maker_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info_history` ADD CONSTRAINT `batch_info_history_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info_history` ADD CONSTRAINT `batch_info_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_info_template_items` ADD CONSTRAINT `batch_info_template_items_batch_info_template_id_foreign` FOREIGN KEY (`batch_info_template_id`) REFERENCES `batch_info_templates`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_participants` ADD CONSTRAINT `batch_participants_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `meetings`(`lecture_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_user` ADD CONSTRAINT `batch_user_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `batch_user` ADD CONSTRAINT `batch_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_draft_unit_movements` ADD CONSTRAINT `block_draft_unit_movements_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_draft_unit_movements` ADD CONSTRAINT `block_draft_unit_movements_draft_unit_movement_id_foreign` FOREIGN KEY (`draft_unit_movement_id`) REFERENCES `draft_unit_movements`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_draft_unit_movements` ADD CONSTRAINT `block_draft_unit_movements_new_section_id_foreign` FOREIGN KEY (`new_section_id`) REFERENCES `sections`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_draft_unit_movements` ADD CONSTRAINT `block_draft_unit_movements_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_draft_unit_movements` ADD CONSTRAINT `block_draft_unit_movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `block_unit_movement_emails` ADD CONSTRAINT `block_unit_movement_emails_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `blueprints` ADD CONSTRAINT `blueprints_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `blueprints` ADD CONSTRAINT `blueprints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `bookmarks` ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `comments` ADD CONSTRAINT `comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `comments` ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `disbursal_statuses` ADD CONSTRAINT `disbursal_statuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `discussions` ADD CONSTRAINT `discussions_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `discussions` ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `draft_unit_movements` ADD CONSTRAINT `draft_unit_movements_new_section_id_foreign` FOREIGN KEY (`new_section_id`) REFERENCES `sections`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `draft_unit_movements` ADD CONSTRAINT `draft_unit_movements_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `draft_unit_movements` ADD CONSTRAINT `draft_unit_movements_unit_movement_rule_id_foreign` FOREIGN KEY (`unit_movement_rule_id`) REFERENCES `unit_movement_rules`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `draft_unit_movements` ADD CONSTRAINT `draft_unit_movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_entity` ADD CONSTRAINT `elective_entity_elective_id_foreign` FOREIGN KEY (`elective_id`) REFERENCES `electives`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_progress` ADD CONSTRAINT `elective_progress_elective_entity_id_foreign` FOREIGN KEY (`elective_entity_id`) REFERENCES `elective_entity`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_progress` ADD CONSTRAINT `elective_progress_elective_user_id_foreign` FOREIGN KEY (`elective_user_id`) REFERENCES `elective_user`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_section` ADD CONSTRAINT `elective_section_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_section` ADD CONSTRAINT `elective_section_elective_id_foreign` FOREIGN KEY (`elective_id`) REFERENCES `electives`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_section` ADD CONSTRAINT `elective_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_user` ADD CONSTRAINT `elective_user_elective_id_foreign` FOREIGN KEY (`elective_id`) REFERENCES `electives`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `elective_user` ADD CONSTRAINT `elective_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `electives` ADD CONSTRAINT `electives_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `external_offers` ADD CONSTRAINT `external_offers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `external_offers` ADD CONSTRAINT `external_offers_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `external_offers` ADD CONSTRAINT `external_offers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback` ADD CONSTRAINT `feedback_feedback_blueprint_id_foreign` FOREIGN KEY (`feedback_blueprint_id`) REFERENCES `feedback_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback` ADD CONSTRAINT `feedback_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_question_blueprints` ADD CONSTRAINT `feedback_question_blueprints_feedback_blueprint_id_foreign` FOREIGN KEY (`feedback_blueprint_id`) REFERENCES `feedback_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_questions` ADD CONSTRAINT `feedback_questions_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_questions` ADD CONSTRAINT `feedback_questions_feedback_question_blueprint_id_foreign` FOREIGN KEY (`feedback_question_blueprint_id`) REFERENCES `feedback_question_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_responses` ADD CONSTRAINT `feedback_responses_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_responses` ADD CONSTRAINT `feedback_responses_feedback_question_id_foreign` FOREIGN KEY (`feedback_question_id`) REFERENCES `feedback_questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `feedback_responses` ADD CONSTRAINT `feedback_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `flag_query` ADD CONSTRAINT `flag_query_flag_id_foreign` FOREIGN KEY (`flag_id`) REFERENCES `flags`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `flag_query` ADD CONSTRAINT `flag_query_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `flags` ADD CONSTRAINT `flags_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `flags` ADD CONSTRAINT `flags_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `flags` ADD CONSTRAINT `flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `githubs` ADD CONSTRAINT `githubs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `guardian` ADD CONSTRAINT `guardian_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `help_faqs` ADD CONSTRAINT `help_faqs_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `institute_batches` ADD CONSTRAINT `institute_batches_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `institute_batches` ADD CONSTRAINT `institute_batches_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interaction_messages` ADD CONSTRAINT `interaction_message_interaction_id_foreign` FOREIGN KEY (`interaction_id`) REFERENCES `interactions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interaction_messages` ADD CONSTRAINT `interaction_message_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interactions` ADD CONSTRAINT `interaction_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interactions` ADD CONSTRAINT `interaction_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interviews` ADD CONSTRAINT `interviews_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interviews` ADD CONSTRAINT `interviews_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interviews` ADD CONSTRAINT `interviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `leads` ADD CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `learning_objectives` ADD CONSTRAINT `learning_objectives_topic_id_index` FOREIGN KEY (`topic_id`) REFERENCES `topic_objectives`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_ai_generated_content` ADD CONSTRAINT `lecture_ai_generated_content_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_blueprints` ADD CONSTRAINT `lecture_blueprints_blueprint_id_foreign` FOREIGN KEY (`blueprint_id`) REFERENCES `blueprints`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_blueprints` ADD CONSTRAINT `lecture_blueprints_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_blueprints` ADD CONSTRAINT `lecture_blueprints_section_feedback_blueprint_id_foreign` FOREIGN KEY (`section_feedback_blueprint_id`) REFERENCES `section_feedback_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_blueprints` ADD CONSTRAINT `lecture_blueprints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_feedback` ADD CONSTRAINT `lecture_feedback_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_feedback` ADD CONSTRAINT `lecture_feedback_user_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_interactions` ADD CONSTRAINT `lecture_interactions_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lecture_interactions` ADD CONSTRAINT `lecture_interactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures` ADD CONSTRAINT `lectures_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures` ADD CONSTRAINT `lectures_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures` ADD CONSTRAINT `lectures_host_id_foreign` FOREIGN KEY (`host_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures` ADD CONSTRAINT `lectures_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures` ADD CONSTRAINT `lectures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `lectures_ai` ADD CONSTRAINT `lectures_ai_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `lectures`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meetings` ADD CONSTRAINT `meetings_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `messages` ADD CONSTRAINT `messages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `messages` ADD CONSTRAINT `messages_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `messages` ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `notes` ADD CONSTRAINT `notes_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `notification_logs` ADD CONSTRAINT `notification_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_forms` ADD CONSTRAINT `nps_forms_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_forms` ADD CONSTRAINT `nps_forms_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_forms` ADD CONSTRAINT `nps_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_question_responses` ADD CONSTRAINT `nps_question_responses_nps_question_id_foreign` FOREIGN KEY (`nps_question_id`) REFERENCES `nps_questions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_question_responses` ADD CONSTRAINT `nps_question_responses_nps_submission_id_foreign` FOREIGN KEY (`nps_submission_id`) REFERENCES `nps_submissions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_questions` ADD CONSTRAINT `nps_questions_nps_form_id_foreign` FOREIGN KEY (`nps_form_id`) REFERENCES `nps_forms`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_submissions` ADD CONSTRAINT `nps_submissions_nps_form_id_foreign` FOREIGN KEY (`nps_form_id`) REFERENCES `nps_forms`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `nps_submissions` ADD CONSTRAINT `nps_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `opt_in_choices` ADD CONSTRAINT `opt_in_choices_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `participant_metrics` ADD CONSTRAINT `participant_metrics_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `meetings`(`lecture_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `participants` ADD CONSTRAINT `participants_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `meetings`(`lecture_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `placement_statuses` ADD CONSTRAINT `placement_statuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `placement_tags` ADD CONSTRAINT `placement_tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio_feedback` ADD CONSTRAINT `portfolio_feedback_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `portfolio_submissions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio_feedback` ADD CONSTRAINT `portfolio_feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio_student_ias` ADD CONSTRAINT `portfolio_student_ias_ia_id_foreign` FOREIGN KEY (`ia_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio_student_ias` ADD CONSTRAINT `portfolio_student_ias_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `portfolio_submissions` ADD CONSTRAINT `portfolio_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `position_params` ADD CONSTRAINT `position_params_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `positions` ADD CONSTRAINT `positions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `positions` ADD CONSTRAINT `positions_eligibility_id_foreign` FOREIGN KEY (`eligibility_id`) REFERENCES `eligibilities`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `positions` ADD CONSTRAINT `positions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `positions_histories` ADD CONSTRAINT `positions_histories_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `positions_histories` ADD CONSTRAINT `positions_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_interviews` ADD CONSTRAINT `practice_interviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_quiz_responses` ADD CONSTRAINT `practice_quiz_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_test_questions` ADD CONSTRAINT `pt_questions_sub_topic_id_foreign` FOREIGN KEY (`practice_sub_topic_id`) REFERENCES `practice_test_sub_topics`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_test_questions_users_attempted` ADD CONSTRAINT `pt_progress_question_id_foreign` FOREIGN KEY (`practice_test_question_id`) REFERENCES `practice_test_questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_test_questions_users_attempted` ADD CONSTRAINT `pt_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `practice_test_sub_topics` ADD CONSTRAINT `pt_sub_topics_topic_id_foreign` FOREIGN KEY (`practice_topic_id`) REFERENCES `practice_test_topics`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `problem_links` ADD CONSTRAINT `problem_links_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `problem_links` ADD CONSTRAINT `problem_links_problem_id_foreign` FOREIGN KEY (`problem_id`) REFERENCES `problems`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `problems` ADD CONSTRAINT `problems_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `profile_verifies` ADD CONSTRAINT `profile_verifies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `profile_verifies` ADD CONSTRAINT `profile_verifies_rejected_by_foreign` FOREIGN KEY (`rejected_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `profile_verifies` ADD CONSTRAINT `profile_verifies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `profile_verifies` ADD CONSTRAINT `profile_verifies_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `profiles` ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `queries` ADD CONSTRAINT `queries_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `queries` ADD CONSTRAINT `queries_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `queries` ADD CONSTRAINT `queries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `query_comments` ADD CONSTRAINT `query_comments_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `query_comments` ADD CONSTRAINT `query_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `question_quiz` ADD CONSTRAINT `question_quiz_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `question_quiz` ADD CONSTRAINT `question_quiz_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `questions` ADD CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quiz_blueprints` ADD CONSTRAINT `quiz_blueprints_blueprint_id_foreign` FOREIGN KEY (`blueprint_id`) REFERENCES `blueprints`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quiz_blueprints` ADD CONSTRAINT `quiz_blueprints_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quiz_blueprints` ADD CONSTRAINT `quiz_blueprints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quiz_blueprints_questions` ADD CONSTRAINT `quiz_blueprints_questions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quiz_blueprints_questions` ADD CONSTRAINT `quiz_blueprints_questions_quiz_blueprint_id_foreign` FOREIGN KEY (`quiz_blueprint_id`) REFERENCES `quiz_blueprints`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quizzes` ADD CONSTRAINT `quizzes_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quizzes` ADD CONSTRAINT `quizzes_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `quizzes` ADD CONSTRAINT `quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `rbac_role_permissions` ADD CONSTRAINT `rbac_role_permissions_permission_id_fkey` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permissions`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_role_permissions` ADD CONSTRAINT `rbac_role_permissions_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `rbac_roles`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_roles` ADD CONSTRAINT `rbac_roles_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_user_roles` ADD CONSTRAINT `rbac_user_roles_assigned_by_fkey` FOREIGN KEY (`assigned_by`) REFERENCES `users`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_user_roles` ADD CONSTRAINT `rbac_user_roles_batch_id_fkey` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_user_roles` ADD CONSTRAINT `rbac_user_roles_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `rbac_roles`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_user_roles` ADD CONSTRAINT `rbac_user_roles_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `rbac_user_roles` ADD CONSTRAINT `rbac_user_roles_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `scenes` ADD CONSTRAINT `scenes_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_feedback_blueprints` ADD CONSTRAINT `section_feedback_blueprints_blueprint_id_foreign` FOREIGN KEY (`blueprint_id`) REFERENCES `blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_feedback_blueprints` ADD CONSTRAINT `section_feedback_blueprints_feedback_blueprint_id_foreign` FOREIGN KEY (`feedback_blueprint_id`) REFERENCES `feedback_blueprints`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_feedback_blueprints` ADD CONSTRAINT `section_feedback_blueprints_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_feedback_blueprints` ADD CONSTRAINT `section_feedback_blueprints_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_user` ADD CONSTRAINT `section_user_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_user` ADD CONSTRAINT `section_user_opt_in_choice_id_foreign` FOREIGN KEY (`opt_in_choice_id`) REFERENCES `opt_in_choices`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_user` ADD CONSTRAINT `section_user_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `section_user` ADD CONSTRAINT `section_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `sections` ADD CONSTRAINT `sections_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `sections` ADD CONSTRAINT `sections_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `segments` ADD CONSTRAINT `segments_scene_id_foreign` FOREIGN KEY (`scene_id`) REFERENCES `scenes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `solutions` ADD CONSTRAINT `solutions_problem_id_foreign` FOREIGN KEY (`problem_id`) REFERENCES `problems`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `solutions` ADD CONSTRAINT `solutions_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_attendances` ADD CONSTRAINT `student_attendances_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_attendances` ADD CONSTRAINT `student_attendances_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_attendances` ADD CONSTRAINT `student_attendances_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_attendances` ADD CONSTRAINT `student_attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_tag_categories` ADD CONSTRAINT `student_tag_categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `student_tag_categories`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_tag_relation` ADD CONSTRAINT `student_tag_relation_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `student_tag_categories`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_tag_relation` ADD CONSTRAINT `student_tag_relation_name_id_foreign` FOREIGN KEY (`name_id`) REFERENCES `student_tag_names`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_tag_relation` ADD CONSTRAINT `student_tag_relation_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `student_tag_types`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `student_tag_relation` ADD CONSTRAINT `student_tag_relation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `submissions` ADD CONSTRAINT `submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `submissions` ADD CONSTRAINT `submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tasks` ADD CONSTRAINT `tasks_assignee_id_fkey` FOREIGN KEY (`assignee_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tasks` ADD CONSTRAINT `tasks_batch_id_fkey` FOREIGN KEY (`batch_id`) REFERENCES `batches`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `team_invitations` ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `threads` ADD CONSTRAINT `threads_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `threads` ADD CONSTRAINT `threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `ticket_templates` ADD CONSTRAINT `ticket_templates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `ticket_templates` ADD CONSTRAINT `ticket_templates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `topic_objectives` ADD CONSTRAINT `topic_objectives_topic_group_index` FOREIGN KEY (`topic_group`) REFERENCES `menus`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `unit_movement_rules` ADD CONSTRAINT `unit_movement_rules_new_section_id_foreign` FOREIGN KEY (`new_section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `unit_movement_rules` ADD CONSTRAINT `unit_movement_rules_opt_in_choice_id_foreign` FOREIGN KEY (`opt_in_choice_id`) REFERENCES `opt_in_choices`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `unit_movement_rules` ADD CONSTRAINT `unit_movement_rules_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `unit_movement_user_details` ADD CONSTRAINT `unit_movement_user_details_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `unit_movement_user_details` ADD CONSTRAINT `unit_movement_user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_block_emails` ADD CONSTRAINT `user_block_emails_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_block_emails` ADD CONSTRAINT `user_block_emails_block_unit_movement_email_id_foreign` FOREIGN KEY (`block_unit_movement_email_id`) REFERENCES `block_unit_movement_emails`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_block_emails` ADD CONSTRAINT `user_block_emails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_device_tokens` ADD CONSTRAINT `user_device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_documents` ADD CONSTRAINT `user_documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_guardian` ADD CONSTRAINT `user_guardian_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `guardian`(`guardian_id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_guardian` ADD CONSTRAINT `user_guardian_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_relation` ADD CONSTRAINT `user_relation_relation_id_foreign` FOREIGN KEY (`relation_id`) REFERENCES `student_tag_relation`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_relation` ADD CONSTRAINT `user_relation_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_relation` ADD CONSTRAINT `user_relation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_relation_history` ADD CONSTRAINT `user_relation_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_relation_history` ADD CONSTRAINT `user_relation_history_user_relation_id_foreign` FOREIGN KEY (`user_relation_id`) REFERENCES `user_relation`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_scenes` ADD CONSTRAINT `user_scenes_scene_id_foreign` FOREIGN KEY (`scene_id`) REFERENCES `scenes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_scenes` ADD CONSTRAINT `user_scenes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_segments` ADD CONSTRAINT `user_segments_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `segments`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_segments` ADD CONSTRAINT `user_segments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `video_attendances` ADD CONSTRAINT `video_attendances_host_id_foreign` FOREIGN KEY (`host_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `video_attendances` ADD CONSTRAINT `video_attendances_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `video_attendances` ADD CONSTRAINT `video_attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `access_logs_created_at_index` ON `access_logs` (`created_at`);--> statement-breakpoint
CREATE INDEX `access_logs_route_action_index` ON `access_logs` (`route_action`);--> statement-breakpoint
CREATE INDEX `access_logs_route_name_index` ON `access_logs` (`route_name`);--> statement-breakpoint
CREATE INDEX `access_logs_route_path_index` ON `access_logs` (`route_path`);--> statement-breakpoint
CREATE INDEX `access_logs_user_email_index` ON `access_logs` (`user_email`);--> statement-breakpoint
CREATE INDEX `access_logs_user_id_index` ON `access_logs` (`user_id`);--> statement-breakpoint
CREATE INDEX `ai_tutor_sessions_created_at_index` ON `ai_tutor_sessions` (`created_at`);--> statement-breakpoint
CREATE INDEX `ai_tutor_sessions_lecture_id_index` ON `ai_tutor_sessions` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `ai_tutor_sessions_unique_id_index` ON `ai_tutor_sessions` (`unique_id`);--> statement-breakpoint
CREATE INDEX `ai_tutor_sessions_user_id_index` ON `ai_tutor_sessions` (`user_id`);--> statement-breakpoint
CREATE INDEX `app_configs_appName_index` ON `app_configs` (`appName`);--> statement-breakpoint
CREATE INDEX `app_configs_isActive_index` ON `app_configs` (`isActive`);--> statement-breakpoint
CREATE INDEX `app_configs_platform_index` ON `app_configs` (`platform`);--> statement-breakpoint
CREATE INDEX `idx_status` ON `applications` (`status`);--> statement-breakpoint
CREATE INDEX `attendances_batch_id_index` ON `attendances` (`batch_id`);--> statement-breakpoint
CREATE INDEX `attendances_lecture_id_index` ON `attendances` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `attendances_section_id_index` ON `attendances` (`section_id`);--> statement-breakpoint
CREATE INDEX `attendances_user_id_index` ON `attendances` (`user_id`);--> statement-breakpoint
CREATE INDEX `batch_info_batch_id_idx` ON `batch_info` (`batch_id`);--> statement-breakpoint
CREATE INDEX `batch_info_checker_id_idx` ON `batch_info` (`checker_id`);--> statement-breakpoint
CREATE INDEX `batch_info_maker_id_idx` ON `batch_info` (`maker_id`);--> statement-breakpoint
CREATE INDEX `batch_info_status_idx` ON `batch_info` (`status`);--> statement-breakpoint
CREATE INDEX `batch_info_type_idx` ON `batch_info` (`type`);--> statement-breakpoint
CREATE INDEX `batch_info_history_batch_id_entity_id_idx` ON `batch_info_history` (`batch_id`,`entity_id`);--> statement-breakpoint
CREATE INDEX `batch_info_history_batch_id_idx` ON `batch_info_history` (`batch_id`);--> statement-breakpoint
CREATE INDEX `batch_info_history_created_at_idx` ON `batch_info_history` (`created_at`);--> statement-breakpoint
CREATE INDEX `batch_info_history_entity_id_idx` ON `batch_info_history` (`entity_id`);--> statement-breakpoint
CREATE INDEX `batch_info_history_event_name_idx` ON `batch_info_history` (`event_name`);--> statement-breakpoint
CREATE INDEX `batch_info_history_user_id_idx` ON `batch_info_history` (`user_id`);--> statement-breakpoint
CREATE INDEX `batch_info_template_items_batch_info_template_id_idx` ON `batch_info_template_items` (`batch_info_template_id`);--> statement-breakpoint
CREATE INDEX `batch_info_template_items_type_idx` ON `batch_info_template_items` (`type`);--> statement-breakpoint
CREATE INDEX `batch_info_templates_title_idx` ON `batch_info_templates` (`title`);--> statement-breakpoint
CREATE INDEX `batch_participants_email_index` ON `batch_participants` (`email`);--> statement-breakpoint
CREATE INDEX `batch_participants_lecture_id_index` ON `batch_participants` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `batch_participants_user_id_index` ON `batch_participants` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_active` ON `batches` (`active`);--> statement-breakpoint
CREATE INDEX `idx_active_starting` ON `batches` (`active`,`starting`);--> statement-breakpoint
CREATE INDEX `idx_duration` ON `batches` (`duration`);--> statement-breakpoint
CREATE INDEX `idx_name` ON `batches` (`name`);--> statement-breakpoint
CREATE INDEX `idx_program` ON `batches` (`program`);--> statement-breakpoint
CREATE INDEX `idx_starting` ON `batches` (`starting`);--> statement-breakpoint
CREATE INDEX `idx_starting_active` ON `batches` (`starting`,`active`);--> statement-breakpoint
CREATE INDEX `bookmarks_entity_type_entity_id_index` ON `bookmarks` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `disbursal_statuses_entity_type_entity_id_index` ON `disbursal_statuses` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `discussions_entity_type_entity_id_index` ON `discussions` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `elective_entity_entity_type_entity_id_index` ON `elective_entity` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `idx_name` ON `feedback` (`name`);--> statement-breakpoint
CREATE INDEX `idx_question` ON `feedback_questions` (`question`);--> statement-breakpoint
CREATE INDEX `help_faqs_category_index` ON `help_faqs` (`category`);--> statement-breakpoint
CREATE INDEX `help_faqs_category_sub_category_index` ON `help_faqs` (`category`,`sub_category`);--> statement-breakpoint
CREATE INDEX `help_faqs_is_hidden_index` ON `help_faqs` (`is_hidden`);--> statement-breakpoint
CREATE INDEX `help_faqs_sub_category_index` ON `help_faqs` (`sub_category`);--> statement-breakpoint
CREATE INDEX `institute_batches_batch_id_index` ON `institute_batches` (`batch_id`);--> statement-breakpoint
CREATE INDEX `institute_batches_institute_id_index` ON `institute_batches` (`institute_id`);--> statement-breakpoint
CREATE INDEX `institutes_active_index` ON `institutes` (`active`);--> statement-breakpoint
CREATE INDEX `institutes_name_index` ON `institutes` (`name`);--> statement-breakpoint
CREATE INDEX `jobs_queue_index` ON `jobs` (`queue`);--> statement-breakpoint
CREATE INDEX `lecture_feedback_lecture_id_foreign` ON `lecture_feedback` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `lecture_interactions_first_opened_at_index` ON `lecture_interactions` (`first_opened_at`);--> statement-breakpoint
CREATE INDEX `lecture_interactions_lecture_id_index` ON `lecture_interactions` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `lecture_interactions_user_id_index` ON `lecture_interactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_category` ON `lectures` (`category`);--> statement-breakpoint
CREATE INDEX `idx_schedule` ON `lectures` (`schedule`);--> statement-breakpoint
CREATE INDEX `idx_title` ON `lectures` (`title`);--> statement-breakpoint
CREATE INDEX `idx_type` ON `lectures` (`type`);--> statement-breakpoint
CREATE INDEX `lectures_batch_id_foreign` ON `lectures_course` (`batch_id`);--> statement-breakpoint
CREATE INDEX `lectures_section_id_foreign` ON `lectures_course` (`section_id`);--> statement-breakpoint
CREATE INDEX `lectures_user_id_foreign` ON `lectures_course` (`user_id`);--> statement-breakpoint
CREATE INDEX `media_entity_type_entity_id_index` ON `media` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `media_user_id_index` ON `media` (`user_id`);--> statement-breakpoint
CREATE INDEX `notes_user_id_index` ON `notes` (`user_id`);--> statement-breakpoint
CREATE INDEX `notification_logs_entity_index` ON `notification_logs` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `notification_logs_sent_at_index` ON `notification_logs` (`sent_at`);--> statement-breakpoint
CREATE INDEX `notification_logs_status_index` ON `notification_logs` (`status`);--> statement-breakpoint
CREATE INDEX `notification_logs_type_index` ON `notification_logs` (`notification_type`);--> statement-breakpoint
CREATE INDEX `notification_logs_user_id_index` ON `notification_logs` (`user_id`);--> statement-breakpoint
CREATE INDEX `notifications_notifiable_type_notifiable_id_index` ON `notifications` (`notifiable_type`,`notifiable_id`);--> statement-breakpoint
CREATE INDEX `nps_questions_nps_form_id_sequence_index` ON `nps_questions` (`nps_form_id`,`sequence`);--> statement-breakpoint
CREATE INDEX `opinions_entity_type_entity_id_index` ON `opinions` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `opinions_user_id_index` ON `opinions` (`user_id`);--> statement-breakpoint
CREATE INDEX `pages_title_idx` ON `pages` (`title`);--> statement-breakpoint
CREATE INDEX `participant_metrics_lecture_id_index` ON `participant_metrics` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `participant_metrics_user_id_index` ON `participant_metrics` (`user_id`);--> statement-breakpoint
CREATE INDEX `participants_created_id_index` ON `participants` (`created_at`);--> statement-breakpoint
CREATE INDEX `participants_email_index` ON `participants` (`email`);--> statement-breakpoint
CREATE INDEX `participants_join_time_index` ON `participants` (`join_time`);--> statement-breakpoint
CREATE INDEX `participants_lecture_id_index` ON `participants` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `participants_user_id_index` ON `participants` (`user_id`);--> statement-breakpoint
CREATE INDEX `password_resets_email_index` ON `password_resets` (`email`);--> statement-breakpoint
CREATE INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` ON `personal_access_tokens` (`tokenable_type`,`tokenable_id`);--> statement-breakpoint
CREATE INDEX `placement_statuses_entity_type_entity_id_index` ON `placement_statuses` (`entity_type`,`entity_id`);--> statement-breakpoint
CREATE INDEX `placement_tags_taggable_type_taggable_id_index` ON `placement_tags` (`taggable_type`,`taggable_id`);--> statement-breakpoint
CREATE INDEX `practice_interviews_created_at_index` ON `practice_interviews` (`created_at`);--> statement-breakpoint
CREATE INDEX `practice_interviews_unique_id_index` ON `practice_interviews` (`unique_id`);--> statement-breakpoint
CREATE INDEX `practice_interviews_user_id_index` ON `practice_interviews` (`user_id`);--> statement-breakpoint
CREATE INDEX `rbac_permissions_action_idx` ON `rbac_permissions` (`action`);--> statement-breakpoint
CREATE INDEX `rbac_permissions_resource_idx` ON `rbac_permissions` (`resource`);--> statement-breakpoint
CREATE INDEX `rbac_role_permissions_permission_id_idx` ON `rbac_role_permissions` (`permission_id`);--> statement-breakpoint
CREATE INDEX `rbac_role_permissions_role_id_idx` ON `rbac_role_permissions` (`role_id`);--> statement-breakpoint
CREATE INDEX `rbac_roles_deleted_at_idx` ON `rbac_roles` (`deleted_at`);--> statement-breakpoint
CREATE INDEX `rbac_roles_name_idx` ON `rbac_roles` (`name`);--> statement-breakpoint
CREATE INDEX `rbac_user_roles_batch_id_idx` ON `rbac_user_roles` (`batch_id`);--> statement-breakpoint
CREATE INDEX `rbac_user_roles_role_id_idx` ON `rbac_user_roles` (`role_id`);--> statement-breakpoint
CREATE INDEX `rbac_user_roles_scope_type_idx` ON `rbac_user_roles` (`scope_type`);--> statement-breakpoint
CREATE INDEX `rbac_user_roles_section_id_idx` ON `rbac_user_roles` (`section_id`);--> statement-breakpoint
CREATE INDEX `rbac_user_roles_user_id_idx` ON `rbac_user_roles` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_role` ON `section_user` (`role`);--> statement-breakpoint
CREATE INDEX `section_user_manager_id_foreign` ON `section_user_course` (`manager_id`);--> statement-breakpoint
CREATE INDEX `section_user_opt_in_choice_id_foreign` ON `section_user_course` (`opt_in_choice_id`);--> statement-breakpoint
CREATE INDEX `section_user_section_id_foreign` ON `section_user_course` (`section_id`);--> statement-breakpoint
CREATE INDEX `section_user_user_id_foreign` ON `section_user_course` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_name` ON `sections` (`name`);--> statement-breakpoint
CREATE INDEX `sessions_last_activity_index` ON `sessions` (`last_activity`);--> statement-breakpoint
CREATE INDEX `sessions_user_id_index` ON `sessions` (`user_id`);--> statement-breakpoint
CREATE INDEX `student_attendances_batch_id_index` ON `student_attendances` (`batch_id`);--> statement-breakpoint
CREATE INDEX `student_attendances_lecture_id_index` ON `student_attendances` (`lecture_id`);--> statement-breakpoint
CREATE INDEX `student_attendances_schedule_index` ON `student_attendances` (`schedule`);--> statement-breakpoint
CREATE INDEX `student_attendances_section_id_schedule_index` ON `student_attendances` (`section_id`,`schedule`);--> statement-breakpoint
CREATE INDEX `student_attendances_status_index` ON `student_attendances` (`status`);--> statement-breakpoint
CREATE INDEX `student_attendances_user_id_schedule_index` ON `student_attendances` (`user_id`,`schedule`);--> statement-breakpoint
CREATE INDEX `tasks_assignee_id_idx` ON `tasks` (`assignee_id`);--> statement-breakpoint
CREATE INDEX `tasks_batch_id_idx` ON `tasks` (`batch_id`);--> statement-breakpoint
CREATE INDEX `tasks_entity_id_idx` ON `tasks` (`entity_id`);--> statement-breakpoint
CREATE INDEX `tasks_status_idx` ON `tasks` (`status`);--> statement-breakpoint
CREATE INDEX `tasks_task_type_idx` ON `tasks` (`task_type`);--> statement-breakpoint
CREATE INDEX `teams_user_id_index` ON `teams` (`user_id`);--> statement-breakpoint
CREATE INDEX `ticket_templates_created_by_index` ON `ticket_templates` (`created_by`);--> statement-breakpoint
CREATE INDEX `ticket_templates_title_index` ON `ticket_templates` (`title`);--> statement-breakpoint
CREATE INDEX `ticket_templates_updated_by_index` ON `ticket_templates` (`updated_by`);--> statement-breakpoint
CREATE INDEX `user_device_tokens_active_index` ON `user_device_tokens` (`active`);--> statement-breakpoint
CREATE INDEX `user_device_tokens_token_index` ON `user_device_tokens` (`token`);--> statement-breakpoint
CREATE INDEX `user_device_tokens_user_id_index` ON `user_device_tokens` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_tags_user_id_index` ON `user_tags` (`user_id`);--> statement-breakpoint
CREATE INDEX `idx_name` ON `users` (`name`);
*/