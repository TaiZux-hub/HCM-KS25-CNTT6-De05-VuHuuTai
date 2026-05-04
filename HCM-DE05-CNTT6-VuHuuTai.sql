drop database if exists ESportsManagement;
create database ESportsManagement;
use ESportsManagement;

create table teams (
    team_id int auto_increment primary key,
    team_name varchar (200) not null,
    team_national varchar (50), 
    team_owner varchar (100),
    Founded int
);

create table players (
    player_id int auto_increment primary key,
    player_name varchar (100) not null,
    player_nickname varchar (50),
    player_role varchar (50),
    player_salary decimal (18,2),
    team_id int,
    foreign key (team_id) references teams(team_id)
);

create table matchs (
    match_id varchar (10) primary key,
    time_begin datetime,
    result varchar (20)
);

create table match_statistic (
    match_id varchar (10),
    player_id int,
    kills int default 0,
    deaths int default 0,
    assists int default 0,
    primary key (match_id, player_id),
    foreign key (match_id) references matchs(match_id),
    foreign key (player_id) references players(player_id)
);

alter table matchs
add price decimal (18,2);

alter table teams
change team_national team_region varchar (50);

insert into teams (team_name,team_region,team_owner,founded) values
	('Gam Esport', 'Vietnam', 'TK Nguyen', '2014'),
    ('T1', 'Korea', 'SK Telecom', '2002'),
    ('GEN G', 'Korea', null, '2017'),
    ('Cloud 9', 'America', 'Jack Etienne', '2013'),
    ('G2 Esport', 'Germany', null, '2015');
    
insert into players (player_name, player_nickname, player_role, player_salary, team_id) values
('Do Duy Khanh', 'Levi', 'Jungler', 120000000, 1),
('Lee Sang-hyeok', 'Faker', 'Mid', 200000000, 2),
('Rasmus Borregaard Winther', 'Caps', 'Mid', 150000000, 3),
('Robert Huang', 'Blaber', 'Jungler', 90000000, 4),
('Lee Ye-chan', 'Scout', 'Mid', 130000000, 5);

insert into matchs (match_id, time_begin, result, price) values
('MS_001', '2026-05-01 18:00:00', '2-1', 50000000),
('MS_002', '2026-05-02 18:00:00', '1-2', 60000000),
('MS_003', '2026-05-03 18:00:00', '2-0', 70000000),
('MS_004', '2026-05-04 18:00:00', '0-2', 80000000),
('MS_007', '2026-05-05 18:00:00', '2-1', 100000000);

insert into Match_Statistic values
('MS_001', 1, 10, 2, 8),
('MS_001', 2, 8, 3, 6),
('MS_002', 3, 7, 1, 5),
('MS_003', 4, 5, 4, 7),
('MS_007', 5, 9, 2, 10);

set SQL_SAFE_UPDATES = 0;

update players
set player_salary = player_salary * 1.2
where player_role = 'Jungler';

set SQL_SAFE_UPDATES = 1;

drop table match_statistic;

select *
from players
where player_salary BETWEEN 50000000 AND 150000000;

select *
from matchs
where match_id = 'MS_007';

select *
from teams
where team_region = 'Vietnam';

drop table matchs;

-- delete from teams
-- where team_owner is null;

