CREATE TABLE IF NOT EXISTS `year`
(
    `year_id` INT(11) NOT NULL PRIMARY KEY,
    `ac_year` INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS `instance`
(
    `instance_id` INT(11)  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `year_id`     INT(11),
    `game_begin`  DATETIME NOT NULL, # main time 0 for all events?

    CONSTRAINT `fk_instance_year` FOREIGN KEY (year_id) REFERENCES `year` (year_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `team`
(
    `team_id`     INT(11)     NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `fksdb_id`    INT(11)     NULL DEFAULT NULL,
    `name`        VARCHAR(64) NOT NULL,
    `instance_id` INT(11)     NOT NULL,
    UNIQUE KEY `uk_team_1` (`name`, `instance_id`),
    UNIQUE KEY `uk_team_2` (`fksdb_id`, `instance_id`),# works if both fksdb_id is null?
    CONSTRAINT `fk_team_instance` FOREIGN KEY (instance_id) REFERENCES `instance` (instance_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `line`
(
    `line_id`     INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `instance_id` INT(11) NULL DEFAULT NULL,

    CONSTRAINT `fk_line_instance` FOREIGN KEY (instance_id) REFERENCES `instance` (instance_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `phase`
(
    `phase_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `line_id`  INT(11) NULL DEFAULT NULL,
    `begin`    TIME    NOT NULL,#relative to game start?
    `end`      TIME    NOT NULL,#relative to game start?
    # TODO rules
    CONSTRAINT `fk_phase_line` FOREIGN KEY (line_id) REFERENCES `line` (line_id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS `task`
(
    `task_id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `line_id` INT(11) NULL DEFAULT NULL,
    # TODO others params
    CONSTRAINT `fk_task_line` FOREIGN KEY (line_id) REFERENCES `line` (line_id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
