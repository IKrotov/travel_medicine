
create sequence hibernate_sequence start 1 increment 1;

create table after_the_trip (
    id int4 not null,
    after_trip_text TEXT,
    primary key (id)
);

create table country (
    id int4 not null,
    country_name varchar(255),
    flag_file_name varchar(255),
    map_file_name varchar(255),
    after_the_trip_id int4,
    health_id int4,
    list_of_references_id int8,
    prevention_id int4,
    primary key (id)
);

create table country_other_diseases_set (
    country_id int4 not null,
    other_diseases_set_id int4 not null,
    primary key (country_id, other_diseases_set_id)
);

create table country_vaccines (
    country_id int4 not null,
    vaccines_id int8 not null,
    primary key (country_id, vaccines_id)
);

create table health (
    id int4 not null,
    health_text TEXT,
    primary key (id)
);

create table list_of_references (
    id int8 not null,
    list_of_references_text TEXT,
    primary key (id)
);

create table message (
    id int8 not null,
    file_name varchar(255),
    header varchar(255),
    text varchar(255),
    primary key (id)
);

create table other_diseases (
    id int4 not null,
    comment varchar(255),
    dis_name varchar(255),
    prevention varchar(255),
    url varchar(255),
    primary key (id)
);

create table prevention (
    id int4 not null,
    prevention_text TEXT,
    primary key (id)
);

create table t_user (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255) not null,
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table vaccine (
    id int8 not null,
    recommendation varchar(1024),
    transmission varchar(1024),
    url varchar(255),
    vac_name varchar(255),
    primary key (id)
);

alter table if exists country
    add constraint FKhdnuxxinrxgj19hnm374imrrn
    foreign key (after_the_trip_id) references after_the_trip;

alter table if exists country
    add constraint FK3vy1x4o4e9pb1gc1augkvfx8f
    foreign key (health_id) references health;

alter table if exists country
    add constraint FKor5knkunp3ay0fxqcfesd7rwo
    foreign key (list_of_references_id) references list_of_references;

alter table if exists country
    add constraint FK2sabyo3nojxtnunukxqf9009f
    foreign key (prevention_id) references prevention;

alter table if exists country_other_diseases_set
    add constraint FK7n80rgkn01vvx4a7456hknjc
    foreign key (other_diseases_set_id) references other_diseases;

alter table if exists country_other_diseases_set
    add constraint FKl4qlx6ixx5kygp2i5nh2ac255
    foreign key (country_id) references country;

alter table if exists country_vaccines
    add constraint FKopumyltb2xj6u9ib8c06nqd4f
    foreign key (vaccines_id) references vaccine;

alter table if exists country_vaccines
    add constraint FK8p9o4asj0kqgyrpyxkpddntuj
    foreign key (country_id) references country;

alter table if exists user_role
    add constraint FKeqon9sx5vssprq67dxm3s7ump
    foreign key (user_id) references t_user;