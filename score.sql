create table score
(
    user_id     int          not null comment '用户id',
    exam_id     int          null comment '考试id',
    score       varchar(255) null comment '成绩',
    count_score varchar(255) null comment '总分',
    constraint examId
        foreign key (exam_id) references exam (exam_id)
            on update cascade on delete cascade
);

