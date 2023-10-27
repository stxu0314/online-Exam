create table user
(
    user_id     int auto_increment comment '用户名id'
        primary key,
    username    varchar(255)            not null comment '用户名',
    password    varchar(255)            not null comment '密码',
    phone       varchar(11)             null comment '手机号码',
    part        int          default 0  null comment '角色（默认0：学生，1：老师，2：管理员）',
    regist_time timestamp               not null on update CURRENT_TIMESTAMP comment '注册时间',
    class_id    int                     null comment '班级id',
    img         varchar(255)            null comment '头像',
    name        varchar(255)            null comment '姓名',
    status      int          default 1  null comment '状态（1：正常，0：异常）',
    email       varchar(255)            null comment '邮箱',
    address     varchar(255) default '' null comment '地址',
    gender      int          default 1  null comment '性别   1表示男    0表示女',
    age         int          default 0  null comment '年龄',
    constraint class_id
        foreign key (class_id) references clazz (class_id)
            on update cascade on delete set null
);

