create table clazz
(
    class_id       int auto_increment comment '班级id'
        primary key,
    class_name     varchar(255) null comment '班级名',
    create_user_id int          null,
    create_time    datetime     null comment '创建时间',
    constraint userid
        foreign key (create_user_id) references user (user_id)
);

