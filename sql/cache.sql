USE `fol`;

CREATE TABLE IF NOT EXISTS `cache_submit`
(
    `cache_submit_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `team_id`         INT(11) NOT NULL,
    `task_id`         INT(11) NOT NULL,
    `points`          INT(11) NOT NULL,
    #TODO others params
    UNIQUE KEY `uk_cache_submit_1` (`team_id`, `task_id`),
    CONSTRAINT `fk_cache_submit_task` FOREIGN KEY (task_id) REFERENCES `task` (task_id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT `fk_cache_submit_team` FOREIGN KEY (team_id) REFERENCES `team` (team_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);
