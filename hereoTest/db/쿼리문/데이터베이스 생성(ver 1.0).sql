drop database if exists herodb;
create database herodb;
use herodb;
DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
	`me_id`	varchar(13) primary key	NOT NULL,
	`me_pw`	varchar(20)	NOT NULL,
	`me_name`	varchar(35)	NOT NULL,
	`me_gender`	int	NULL,
	`me_nickname`	varchar(13)	NOT NULL,
	`me_tel`	varchar(11)	NULL,
	`me_mail`	varchar(50)	NOT NULL,
	`me_siteauth`	int default(0)	NULL,
	`me_ma_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `board-type`;

CREATE TABLE `board-type` (
	`bt_num`	int primary key auto_increment	NOT NULL,
	`bt_types`	varchar(20)	NOT NULL,
	`bt_r_auth`	int	NOT NULL,
	`bt_w_auth`	int	NOT NULL,
	`bt_tm_num`	int	NULL,
	`bt_lg_num`	int	NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	int primary key auto_increment	NOT NULL,
	`bo_title`	varchar(70)	NOT NULL,
	`bo_content`	longtext	NOT NULL,
	`bo_view`	int default 0	NOT NULL,
	`bo_register_date`	datetime default now()	NOT NULL,
	`bo_reply_count`	int	NULL,
	`bo_up`	int default 0	NOT NULL,
	`bo_down`	int default 0	NOT NULL,
	`bo_bt_num`	int	NOT NULL,
	`bo_me_id`	varchar(13)	NOT NULL,
	`bo_bc_num`	int	NULL
);

DROP TABLE IF EXISTS `board-reply`;

CREATE TABLE `board-reply` (
	`br_num`	int  primary key auto_increment	NOT NULL,
	`br_bo_num`	int	NOT NULL,
	`br_me_id`	varchar(13)	NOT NULL,
	`br_contents`	varchar(300)	NOT NULL,
	`br_register_date`	datetime default now()	NOT NULL,
	`br_update_date`	datetime	NULL,
	`br_ori_num`	int null	NOT NULL
);

DROP TABLE IF EXISTS `board-file`;

CREATE TABLE `board-file` (
	`bf_num`	int  primary key auto_increment	NOT NULL,
	`bf_filename`	varchar(255)	NOT NULL,
	`bf_ori_filename`	varchar(255)	NOT NULL,
	`bf_bo_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `member-joinauth`;

CREATE TABLE `member-joinauth` (
	`mj_me_id`	varchar(13) primary key	NOT NULL,
	`mj_authnum`	int	NOT NULL,
	`mj_expire_date`	datetime	NOT NULL
);

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
	`tm_num`	int  primary key auto_increment	NOT NULL,
	`tm_name`	varchar(8) not null unique	NULL,
	`tm_startday`	date	NULL,
	`tm_slogan`	varchar(25)	NULL,
	`tm_re_num`	int	NOT NULL,
	`tm_openformatch`	boolean	NULL,
	`tm_teamgender`	int	NULL,
	`tm_me_id`	varchar(13)	NOT NULL,
	`tm_teamstate`	varchar(10)	NULL,
	`tm_team_img`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
	`pl_num`	int  primary key auto_increment	NOT NULL,
	`pl_me_id`	varchar(13)	NOT NULL,
	`pl_hitting_hand`	char(2)	NULL,
	`pl_pitching_hand`	char(2)	NULL,
	`pl_ispro`	varchar(5)	NULL,
	`pl_introduce`	longtext	NULL,
	`pl_player_img`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `stadium`;

CREATE TABLE `stadium` (
	`sd_num`	int  primary key auto_increment	NOT NULL,
	`sd_rd_num`	int	NOT NULL,
	`sd_name`	varchar(20)	NOT NULL,
	`sd_register_date`	datetime default now()	NOT NULL,
	`sd_confirm`	int	NULL,
	`sd_contact`	varchar(50)	NULL,
	`sd_me_id`	varchar(13)	NOT NULL,
	`sd_price`	int	NULL,
	`sd_intro`	varchar(1000)	NULL
);

DROP TABLE IF EXISTS `stadium-schedule`;

CREATE TABLE `stadium-schedule` (
	`ss_num`	int  primary key auto_increment	NOT NULL,
	`ss_game_date`	datetime	NOT NULL,
	`ss_st_id`	int	NOT NULL,
	`ss_rv_id`	int	NOT NULL
);

DROP TABLE IF EXISTS `member-authority`;

CREATE TABLE `member-authority` (
	`ma_num`	int  primary key auto_increment	NOT NULL,
	`ma_stadium_auth`	boolean default 0	NOT NULL,
	`ma_league_auth`	boolean default 0	NOT NULL,
	`ma_record_auth`	boolean default 0	NOT NULL
);

DROP TABLE IF EXISTS `league`;

CREATE TABLE `league` (
	`lg_num`	int  primary key auto_increment	NOT NULL,
	`lg_name`	varchar(20)	NOT NULL,
	`lg_introduce`	longtext	NULL,
	`lg_me_id`	varchar(13)	NOT NULL,
	`lg_start_day`	date	NULL,
	`lg_state`	varchar(10)	NULL,
	`lg_approval`	int	NULL,
	`lg_logo`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `match-record`;

CREATE TABLE `match-record` (
	`mr_num`	int  primary key auto_increment	NOT NULL,
	`mr_ms_num`	int	NOT NULL,
	`mr_point_home`	int	NOT NULL,
	`mr_point_away`	int	NOT NULL,
	`mr_startteam`	boolean	NOT NULL
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`rv_num`	int  primary key auto_increment	NOT NULL,
	`rv_me_id`	varchar(13)	NOT NULL,
	`rv_date`	datetime default now()	NOT NULL,
	`rv_payment_amount`	int	NOT NULL,
	`rv_isReferee`	boolean default 0	NOT NULL,
	`rv_isRecoder`	boolean default 0	NOT NULL,
	`rv_total_price`	int	NOT NULL,
	`rv_state`	varchar(20)	NOT NULL,
	`rv_game_type`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
	`re_num`	int  primary key auto_increment	NOT NULL,
	`re_sido`	varchar(7)	NOT NULL,
	`re_gu`	varchar(5)	NOT NULL
);

DROP TABLE IF EXISTS `league-participationteam`;

CREATE TABLE `league-participationteam` (
	`lp_num`	int  primary key auto_increment	NOT NULL,
	`lp_tm_num`	int	NOT NULL,
	`lp_le_num`	int	NOT NULL,
	`lp_approval`	int	NOT NULL
);

DROP TABLE IF EXISTS `match-inning`;

CREATE TABLE `match-inning` (
	`mi_num`	int  primary key auto_increment	NOT NULL,
	`mi_inning`	int	NOT NULL,
	`mi_isfirstlast`	boolean	NOT NULL,
	`mi_point`	int default 0	NOT NULL,
	`mi_mr_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `match-partcipate`;

CREATE TABLE `match-partcipate` (
	`mp_num`	int  primary key auto_increment	NOT NULL,
	`mp_tp_num`	int	NOT NULL,
	`mp_order`	int	NOT NULL,
	`mp_type`	varchar(10)	NOT NULL,
	`mp_po_num`	int	NOT NULL,
	`mp_inning`	int	NOT NULL
);

DROP TABLE IF EXISTS `league-schedule`;

CREATE TABLE `league-schedule` (
	`ls_num`	int  primary key auto_increment	NOT NULL,
	`ls_match_state`	varchar(5) default '경기전'	NOT NULL,
	`ls_match_date`	datetime	NULL,
	`ls_point_a`	int	NOT NULL,
	`ls_point_b`	int	NOT NULL,
	`ls_lp_num_a`	int	NOT NULL,
	`ls_lp_num_b`	int	NOT NULL,
	`ls_la_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `league-matchList`;

CREATE TABLE `league-matchList` (
	`lm_num`	int  primary key auto_increment	NOT NULL,
	`lm_mr_num`	int	NOT NULL,
	`lm_ls_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `match-batterboxEvent`;

CREATE TABLE `match-batterboxEvent` (
	`mb_num`	int  primary key auto_increment	NOT NULL,
	`mb_inning_order`	int	NOT NULL,
	`mb_be_num`	int	NOT NULL,
	`mb_mi_num`	int	NOT NULL,
	`mb_mp_hitter_num`	int	NOT NULL,
	`mb_mp_pitcher_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `match-schedule`;

CREATE TABLE `match-schedule` (
	`ms_num`	int  primary key auto_increment	NOT NULL,
	`ms_datetime`	datetime	NOT NULL,
	`ms_match_sort`	varchar(10)	NOT NULL,
	`ms_tm_home_num`	int	NOT NULL,
	`ms_tm_away_num`	int	NOT NULL,
	`ms_rv_num`	int	NOT NULL,
	`ms_me_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `match-lineup`;

CREATE TABLE `match-lineup` (
	`ml_num`	int  primary key auto_increment	NOT NULL,
	`ml_ms_num`	int	NOT NULL,
	`ml_battingorder`	int	NOT NULL,
	`ml_type`	varchar(10)	NOT NULL,
	`ml_tp_num`	int	NOT NULL,
	`ml_po_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
	`po_num`	int primary key auto_increment	NOT NULL,
	`po_name`	varchar(5)	NOT NULL
);

DROP TABLE IF EXISTS `position-hope`;

CREATE TABLE `position-hope` (
	`ph_num`	int  primary key auto_increment	NOT NULL,
	`ph_pl_num`	int	NOT NULL,
	`ph_po_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `team-possibleregion`;

CREATE TABLE `team-possibleregion` (
	`tr_num`	int  primary key auto_increment	NOT NULL,
	`tr_re_num`	int	NOT NULL,
	`tr_tm_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `team-wtjoin`;

CREATE TABLE `team-wtjoin` (
	`tj_num`	int  primary key auto_increment	NOT NULL,
	`tj_tm_num`	int	NOT NULL,
	`tj_pl_num`	int	NOT NULL,
	`tj_register_date`	datetime	NOT NULL,
	`tj_state`	varchar(5)	NULL,
	`tj_bo_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `team-waiting_breakup`;

CREATE TABLE `team-waiting_breakup` (
	`tw_num`	int  primary key auto_increment	NOT NULL,
	`tw_tm_num`	int	NOT NULL,
	`tw_register_datetime`	datetime	NOT NULL,
	`tw_breakup_complete_datetime`	datetime	NULL,
	`tw_iscancled`	boolean	NULL
);

DROP TABLE IF EXISTS `league_enrollment`;

CREATE TABLE `league_enrollment` (
	`le_num`	int  primary key auto_increment	NOT NULL,
	`le_sd_num`	int	NOT NULL,
	`le_la_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `region_detail`;

CREATE TABLE `region_detail` (
	`rd_num`	int  primary key auto_increment	NOT NULL,
	`rd_re_num`	int	NOT NULL,
	`rd_zipcode`	varchar(5)	NOT NULL,
	`rd_address`	varchar(255)	NOT NULL,
	`rd_detail-address`	varchar(255)	NOT NULL
);

DROP TABLE IF EXISTS `stadium-timetable`;

CREATE TABLE `stadium-timetable` (
	`st_num`	int  primary key auto_increment	NOT NULL,
	`st_sd_id`	int	NOT NULL,
	`st_start_time`	int	NOT NULL,
	`st_use-time`	int	NOT NULL,
	`st_rent_cost`	int	NOT NULL,
	`st_daytype`	int	NOT NULL
);

DROP TABLE IF EXISTS `team-approvallist`;

CREATE TABLE `team-approvallist` (
	`ta_tm_num`	int	NOT NULL,
	`ta_register_date`	datetime	NOT NULL,
	`ta_state`	int	NOT NULL,
	`ta_bo_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
	`rf_num`	int  primary key auto_increment	NOT NULL,
	`rf_rv_num`	int	NOT NULL,
	`rf_application_date`	datetime	NULL,
	`rf_complite_date`	datetime	NULL,
	`rf_state`	varchar(5)	NOT NULL,
	`rf_type`	varchar(20)	NOT NULL,
	`rf_total_price`	int	NOT NULL
);

DROP TABLE IF EXISTS `member-updateauth`;

CREATE TABLE `member-updateauth` (
	`mu_num`	int  primary key auto_increment	NOT NULL,
	`mu_me_id`	varchar(13)	NOT NULL,
	`mu_register_date`	datetime default now()	NOT NULL,
	`mu_register_rst`	int	NULL,
	`mu_reason`	varchar(50) null	NULL,
	`mu_ma_num`	int	NOT NULL,
	`mu_bo_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `team-player`;

CREATE TABLE `team-player` (
	`tp_num`	int  primary key auto_increment	NOT NULL,
	`tp_auth`	int	NOT NULL,
	`tp_pl_num`	int	NOT NULL,
	`tp_backnum`	int	NOT NULL,
	`tp_tm_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `board-category`;

CREATE TABLE `board-category` (
	`bc_num`	int primary key auto_increment	NOT NULL,
	`bc_name`	varchar(10)	NOT NULL,
	`bc_bt_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `match-attendance`;

CREATE TABLE `match-attendance` (
	`mt_num`	int  primary key auto_increment	NOT NULL,
	`mt_tp_num`	int	NOT NULL,
	`mt_ms_num`	int	NOT NULL,
	`mt_isattendance`	int default(0)	NOT NULL
);

DROP TABLE IF EXISTS `batterboxevent-type`;

CREATE TABLE `batterboxevent-type` (
	`be_num`	int  primary key auto_increment	NOT NULL,
	`be_type`	varchar(10)	NOT NULL,
	`be_sub_type`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `playerrecord-hitter`;

CREATE TABLE `playerrecord-hitter` (
	`ph_num`	int primary key auto_increment	NOT NULL,
	`ph_tp_num`	int	NOT NULL,
	`ph_mr_num`	int	NOT NULL,
	`ph_single_hits`	int default 0	NOT NULL,
	`ph_twobase_hits`	int default 0	NOT NULL,
	`ph_threebase_hits`	int default 0	NOT NULL,
	`ph_homeruns`	int default 0	NOT NULL,
	`ph_errors`	int default 0	NOT NULL,
	`ph_steals`	int default 0	NOT NULL,
	`ph_fail_steals`	int default 0	NOT NULL,
	`ph_fourballs`	int default 0	NOT NULL,
	`ph_strike_outs`	int default 0	NOT NULL,
	`ph_hits`	int default 0	NOT NULL,
	`ph_bats`	int default 0	NOT NULL,
	`ph_doubleplays`	int default 0	NOT NULL,
	`ph_hitbypitches`	int default 0	NOT NULL
);

DROP TABLE IF EXISTS `playerrecord-pitcher`;

CREATE TABLE `playerrecord-pitcher` (
	`pp_num`	int  primary key auto_increment	NOT NULL,
	`pp_tp_num`	int	NOT NULL,
	`pp_mr_num`	int	NOT NULL,
	`pp_innings`	int default 0	NOT NULL,
	`pp_hits`	int default 0	NOT NULL,
	`pp_homeruns`	int default 0	NOT NULL,
	`pp_hitters`	int default 0	NOT NULL,
	`pp_shutouts`	int default 0	NOT NULL,
	`pp_completegame`	int default 0	NOT NULL,
	`pp_saves`	int default 0	NOT NULL,
	`pp_holds`	int default 0	NOT NULL,
	`pp_fourballs`	int default 0	NOT NULL,
	`pp_hitbypitches`	int default 0	NOT NULL,
	`pp_strikeouts`	int default 0	NOT NULL,
	`pp_losepoints`	int default 0	NOT NULL,
	`pp_earnedruns`	int default 0	NOT NULL,
	`pp_balks`	int default 0	NOT NULL,
	`pp_wildpitchs`	int default 0	NOT NULL,
	`pp_pitches`	int default 0	NOT NULL
);

DROP TABLE IF EXISTS `payment_history`;

CREATE TABLE `payment_history` (
	`ph_num`	int  primary key auto_increment	NOT NULL,
	`ph_rv_num`	int	NOT NULL,
	`ph_type`	varchar(20)	NOT NULL,
	`ph_date`	datetime	NOT NULL,
	`ph_price`	int	NOT NULL
);

DROP TABLE IF EXISTS `playerrecord_year-hitter`;

CREATE TABLE `playerrecord_year-hitter` (
	`yh_num`	int primary key auto_increment	NOT NULL,
	`yh_tp_num`	int	NOT NULL,
	`yh_year`	int	NOT NULL,
	`yh_sort`	varchar(5)	NOT NULL,
	`yh_single_hits`	int default(0)	NOT NULL,
	`yh_twobase_hits`	int default(0)	NOT NULL,
	`yh_threebase_hits`	int default(0)	NOT NULL,
	`yh_homeruns`	int default(0)	NOT NULL,
	`yh_errors`	int default(0)	NOT NULL,
	`yh_steals`	int default(0)	NOT NULL,
	`yh_fail_steals`	int default(0)	NOT NULL,
	`yh_fourballs`	int default(0)	NOT NULL,
	`yh_strike_outs`	int default(0)	NOT NULL,
	`yh_hits`	int default 0	NOT NULL,
	`yh_bats`	int default 0	NOT NULL,
	`yh_doubleplays`	int default 0	NOT NULL,
	`yh_hitbypitches`	int default 0	NOT NULL
);

DROP TABLE IF EXISTS `playerrecord_year-pitcher`;

CREATE TABLE `playerrecord_year-pitcher` (
	`yp_num`	int primary key auto_increment	NOT NULL,
	`yp_tp_num`	int	NOT NULL,
	`yp_year`	int	NOT NULL,
	`yp_sort`	varchar(5)	NOT NULL,
	`yp_innings`	int default(0)	NOT NULL,
	`yp_hits`	int default(0)	NOT NULL,
	`yp_homeruns`	int default(0)	NOT NULL,
	`yp_hitters`	int default(0)	NOT NULL,
	`yp_shutouts`	int default(0)	NOT NULL,
	`yp_completegame`	int default(0)	NOT NULL,
	`yp_saves`	int default(0)	NOT NULL,
	`yp_holds`	int default(0)	NOT NULL,
	`yp_fourballs`	int default(0)	NOT NULL,
	`yp_hitbypitches`	int default(0)	NOT NULL,
	`yp_strikeouts`	int default(0)	NOT NULL,
	`yp_losepoints`	int default(0)	NOT NULL,
	`yp_earnedruns`	int default(0)	NOT NULL,
	`yp_balks`	int default(0)	NOT NULL,
	`yp_wildpitchs`	int default(0)	NOT NULL,
	`yp_pitches`	int default(0)	NOT NULL
);

DROP TABLE IF EXISTS `stadium-image`;

CREATE TABLE `stadium-image` (
	`si_num`	int  primary key auto_increment	NOT NULL,
	`sd_num`	int	NOT NULL,
	`si_filename`	varchar(255)	NOT NULL
);

DROP TABLE IF EXISTS `league_attribute`;

CREATE TABLE `league_attribute` (
	`la_num`	int  primary key auto_increment	NOT NULL,
	`la_name`	varchar(20)	NOT NULL,
	`la_match_type`	varchar(5)	NOT NULL,
	`la_start_date`	date	NOT NULL,
	`la_whole_period`	int	NULL,
	`la_team_state`	varchar(5) default '모집중'	NOT NULL,
	`la_lg_num`	int	NOT NULL
);

ALTER TABLE `members` ADD CONSTRAINT `FK_member-authority_TO_members_1` FOREIGN KEY (
	`me_ma_num`
)
REFERENCES `member-authority` (
	`ma_num`
);

ALTER TABLE `board-type` ADD CONSTRAINT `FK_team_TO_board-type_1` FOREIGN KEY (
	`bt_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `board-type` ADD CONSTRAINT `FK_league_TO_board-type_1` FOREIGN KEY (
	`bt_lg_num`
)
REFERENCES `league` (
	`lg_num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_board-type_TO_board_1` FOREIGN KEY (
	`bo_bt_num`
)
REFERENCES `board-type` (
	`bt_num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_members_TO_board_1` FOREIGN KEY (
	`bo_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_board-category_TO_board_1` FOREIGN KEY (
	`bo_bc_num`
)
REFERENCES `board-category` (
	`bc_num`
);

ALTER TABLE `board-reply` ADD CONSTRAINT `FK_board_TO_board-reply_1` FOREIGN KEY (
	`br_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `board-reply` ADD CONSTRAINT `FK_members_TO_board-reply_1` FOREIGN KEY (
	`br_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `board-reply` ADD CONSTRAINT `FK_board-reply_TO_board-reply_1` FOREIGN KEY (
	`br_ori_num`
)
REFERENCES `board-reply` (
	`br_num`
);

ALTER TABLE `board-file` ADD CONSTRAINT `FK_board_TO_board-file_1` FOREIGN KEY (
	`bf_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `member-joinauth` ADD CONSTRAINT `FK_members_TO_member-joinauth_1` FOREIGN KEY (
	`mj_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `team` ADD CONSTRAINT `FK_region_TO_team_1` FOREIGN KEY (
	`tm_re_num`
)
REFERENCES `region` (
	`re_num`
);

ALTER TABLE `team` ADD CONSTRAINT `FK_members_TO_team_1` FOREIGN KEY (
	`tm_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `player` ADD CONSTRAINT `FK_members_TO_player_1` FOREIGN KEY (
	`pl_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `stadium` ADD CONSTRAINT `FK_region_detail_TO_stadium_1` FOREIGN KEY (
	`sd_rd_num`
)
REFERENCES `region_detail` (
	`rd_num`
);

ALTER TABLE `stadium` ADD CONSTRAINT `FK_members_TO_stadium_1` FOREIGN KEY (
	`sd_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `stadium-schedule` ADD CONSTRAINT `FK_stadium-timetable_TO_stadium-schedule_1` FOREIGN KEY (
	`ss_st_id`
)
REFERENCES `stadium-timetable` (
	`st_num`
);

ALTER TABLE `stadium-schedule` ADD CONSTRAINT `FK_reservation_TO_stadium-schedule_1` FOREIGN KEY (
	`ss_rv_id`
)
REFERENCES `reservation` (
	`rv_num`
);

ALTER TABLE `league` ADD CONSTRAINT `FK_members_TO_league_1` FOREIGN KEY (
	`lg_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `match-record` ADD CONSTRAINT `FK_match-schedule_TO_match-record_1` FOREIGN KEY (
	`mr_ms_num`
)
REFERENCES `match-schedule` (
	`ms_num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_members_TO_reservation_1` FOREIGN KEY (
	`rv_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `league-participationteam` ADD CONSTRAINT `FK_team_TO_league-participationteam_1` FOREIGN KEY (
	`lp_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `league-participationteam` ADD CONSTRAINT `FK_league_attribute_TO_league-participationteam_1` FOREIGN KEY (
	`lp_le_num`
)
REFERENCES `league_attribute` (
	`la_num`
);

ALTER TABLE `match-inning` ADD CONSTRAINT `FK_match-record_TO_match-inning_1` FOREIGN KEY (
	`mi_mr_num`
)
REFERENCES `match-record` (
	`mr_num`
);

ALTER TABLE `match-partcipate` ADD CONSTRAINT `FK_team-player_TO_match-partcipate_1` FOREIGN KEY (
	`mp_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `match-partcipate` ADD CONSTRAINT `FK_position_TO_match-partcipate_1` FOREIGN KEY (
	`mp_po_num`
)
REFERENCES `position` (
	`po_num`
);

ALTER TABLE `league-schedule` ADD CONSTRAINT `FK_league-participationteam_TO_league-schedule_1` FOREIGN KEY (
	`ls_lp_num_a`
)
REFERENCES `league-participationteam` (
	`lp_num`
);

ALTER TABLE `league-schedule` ADD CONSTRAINT `FK_league-participationteam_TO_league-schedule_2` FOREIGN KEY (
	`ls_lp_num_b`
)
REFERENCES `league-participationteam` (
	`lp_num`
);

ALTER TABLE `league-schedule` ADD CONSTRAINT `FK_league_attribute_TO_league-schedule_1` FOREIGN KEY (
	`ls_la_num`
)
REFERENCES `league_attribute` (
	`la_num`
);

ALTER TABLE `league-matchList` ADD CONSTRAINT `FK_match-record_TO_league-matchList_1` FOREIGN KEY (
	`lm_mr_num`
)
REFERENCES `match-record` (
	`mr_num`
);

ALTER TABLE `league-matchList` ADD CONSTRAINT `FK_league-schedule_TO_league-matchList_1` FOREIGN KEY (
	`lm_ls_num`
)
REFERENCES `league-schedule` (
	`ls_num`
);

ALTER TABLE `match-batterboxEvent` ADD CONSTRAINT `FK_batterboxevent-type_TO_match-batterboxEvent_1` FOREIGN KEY (
	`mb_be_num`
)
REFERENCES `batterboxevent-type` (
	`be_num`
);

ALTER TABLE `match-batterboxEvent` ADD CONSTRAINT `FK_match-inning_TO_match-batterboxEvent_1` FOREIGN KEY (
	`mb_mi_num`
)
REFERENCES `match-inning` (
	`mi_num`
);

ALTER TABLE `match-batterboxEvent` ADD CONSTRAINT `FK_match-partcipate_TO_match-batterboxEvent_1` FOREIGN KEY (
	`mb_mp_hitter_num`
)
REFERENCES `match-partcipate` (
	`mp_num`
);

ALTER TABLE `match-batterboxEvent` ADD CONSTRAINT `FK_match-partcipate_TO_match-batterboxEvent_2` FOREIGN KEY (
	`mb_mp_pitcher_num`
)
REFERENCES `match-partcipate` (
	`mp_num`
);

ALTER TABLE `match-schedule` ADD CONSTRAINT `FK_team_TO_match-schedule_1` FOREIGN KEY (
	`ms_tm_home_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `match-schedule` ADD CONSTRAINT `FK_team_TO_match-schedule_2` FOREIGN KEY (
	`ms_tm_away_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `match-schedule` ADD CONSTRAINT `FK_reservation_TO_match-schedule_1` FOREIGN KEY (
	`ms_rv_num`
)
REFERENCES `reservation` (
	`rv_num`
);

ALTER TABLE `match-schedule` ADD CONSTRAINT `FK_members_TO_match-schedule_1` FOREIGN KEY (
	`ms_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `match-lineup` ADD CONSTRAINT `FK_match-schedule_TO_match-lineup_1` FOREIGN KEY (
	`ml_ms_num`
)
REFERENCES `match-schedule` (
	`ms_num`
);

ALTER TABLE `match-lineup` ADD CONSTRAINT `FK_team-player_TO_match-lineup_1` FOREIGN KEY (
	`ml_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `match-lineup` ADD CONSTRAINT `FK_position_TO_match-lineup_1` FOREIGN KEY (
	`ml_po_num`
)
REFERENCES `position` (
	`po_num`
);

ALTER TABLE `position-hope` ADD CONSTRAINT `FK_player_TO_position-hope_1` FOREIGN KEY (
	`ph_pl_num`
)
REFERENCES `player` (
	`pl_num`
);

ALTER TABLE `position-hope` ADD CONSTRAINT `FK_position_TO_position-hope_1` FOREIGN KEY (
	`ph_po_num`
)
REFERENCES `position` (
	`po_num`
);

ALTER TABLE `team-possibleregion` ADD CONSTRAINT `FK_region_TO_team-possibleregion_1` FOREIGN KEY (
	`tr_re_num`
)
REFERENCES `region` (
	`re_num`
);

ALTER TABLE `team-possibleregion` ADD CONSTRAINT `FK_team_TO_team-possibleregion_1` FOREIGN KEY (
	`tr_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `team-wtjoin` ADD CONSTRAINT `FK_team_TO_team-wtjoin_1` FOREIGN KEY (
	`tj_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `team-wtjoin` ADD CONSTRAINT `FK_player_TO_team-wtjoin_1` FOREIGN KEY (
	`tj_pl_num`
)
REFERENCES `player` (
	`pl_num`
);

ALTER TABLE `team-wtjoin` ADD CONSTRAINT `FK_board_TO_team-wtjoin_1` FOREIGN KEY (
	`tj_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `team-waiting_breakup` ADD CONSTRAINT `FK_team_TO_team-waiting_breakup_1` FOREIGN KEY (
	`tw_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `league_enrollment` ADD CONSTRAINT `FK_stadium_TO_league_enrollment_1` FOREIGN KEY (
	`le_sd_num`
)
REFERENCES `stadium` (
	`sd_num`
);

ALTER TABLE `league_enrollment` ADD CONSTRAINT `FK_league_attribute_TO_league_enrollment_1` FOREIGN KEY (
	`le_la_num`
)
REFERENCES `league_attribute` (
	`la_num`
);

ALTER TABLE `region_detail` ADD CONSTRAINT `FK_region_TO_region_detail_1` FOREIGN KEY (
	`rd_re_num`
)
REFERENCES `region` (
	`re_num`
);

ALTER TABLE `stadium-timetable` ADD CONSTRAINT `FK_stadium_TO_stadium-timetable_1` FOREIGN KEY (
	`st_sd_id`
)
REFERENCES `stadium` (
	`sd_num`
);

ALTER TABLE `team-approvallist` ADD CONSTRAINT `FK_team_TO_team-approvallist_1` FOREIGN KEY (
	`ta_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `team-approvallist` ADD CONSTRAINT `FK_board_TO_team-approvallist_1` FOREIGN KEY (
	`ta_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_reservation_TO_refund_1` FOREIGN KEY (
	`rf_rv_num`
)
REFERENCES `reservation` (
	`rv_num`
);

ALTER TABLE `member-updateauth` ADD CONSTRAINT `FK_members_TO_member-updateauth_1` FOREIGN KEY (
	`mu_me_id`
)
REFERENCES `members` (
	`me_id`
);

ALTER TABLE `member-updateauth` ADD CONSTRAINT `FK_member-authority_TO_member-updateauth_1` FOREIGN KEY (
	`mu_ma_num`
)
REFERENCES `member-authority` (
	`ma_num`
);

ALTER TABLE `member-updateauth` ADD CONSTRAINT `FK_board_TO_member-updateauth_1` FOREIGN KEY (
	`mu_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `team-player` ADD CONSTRAINT `FK_player_TO_team-player_1` FOREIGN KEY (
	`tp_pl_num`
)
REFERENCES `player` (
	`pl_num`
);

ALTER TABLE `team-player` ADD CONSTRAINT `FK_team_TO_team-player_1` FOREIGN KEY (
	`tp_tm_num`
)
REFERENCES `team` (
	`tm_num`
);

ALTER TABLE `board-category` ADD CONSTRAINT `FK_board-type_TO_board-category_1` FOREIGN KEY (
	`bc_bt_num`
)
REFERENCES `board-type` (
	`bt_num`
);

ALTER TABLE `match-attendance` ADD CONSTRAINT `FK_team-player_TO_match-attendance_1` FOREIGN KEY (
	`mt_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `match-attendance` ADD CONSTRAINT `FK_match-schedule_TO_match-attendance_1` FOREIGN KEY (
	`mt_ms_num`
)
REFERENCES `match-schedule` (
	`ms_num`
);

ALTER TABLE `playerrecord-hitter` ADD CONSTRAINT `FK_team-player_TO_playerrecord-hitter_1` FOREIGN KEY (
	`ph_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `playerrecord-hitter` ADD CONSTRAINT `FK_match-record_TO_playerrecord-hitter_1` FOREIGN KEY (
	`ph_mr_num`
)
REFERENCES `match-record` (
	`mr_num`
);

ALTER TABLE `playerrecord-pitcher` ADD CONSTRAINT `FK_team-player_TO_playerrecord-pitcher_1` FOREIGN KEY (
	`pp_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `playerrecord-pitcher` ADD CONSTRAINT `FK_match-record_TO_playerrecord-pitcher_1` FOREIGN KEY (
	`pp_mr_num`
)
REFERENCES `match-record` (
	`mr_num`
);

ALTER TABLE `payment_history` ADD CONSTRAINT `FK_reservation_TO_payment_history_1` FOREIGN KEY (
	`ph_rv_num`
)
REFERENCES `reservation` (
	`rv_num`
);

ALTER TABLE `playerrecord_year-hitter` ADD CONSTRAINT `FK_team-player_TO_playerrecord_year-hitter_1` FOREIGN KEY (
	`yh_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `playerrecord_year-pitcher` ADD CONSTRAINT `FK_team-player_TO_playerrecord_year-pitcher_1` FOREIGN KEY (
	`yp_tp_num`
)
REFERENCES `team-player` (
	`tp_num`
);

ALTER TABLE `stadium-image` ADD CONSTRAINT `FK_stadium_TO_stadium-image_1` FOREIGN KEY (
	`sd_num`
)
REFERENCES `stadium` (
	`sd_num`
);

ALTER TABLE `league_attribute` ADD CONSTRAINT `FK_league_TO_league_attribute_1` FOREIGN KEY (
	`la_lg_num`
)
REFERENCES `league` (
	`lg_num`
);

