# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table curso (
  id                        bigint not null,
  nombre                    varchar(255),
  constraint pk_curso primary key (id))
;

create sequence curso_seq;




# --- !Downs

drop table if exists curso cascade;

drop sequence if exists curso_seq;

