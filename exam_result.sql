create table exam_result
(
    result_id   int auto_increment comment '考试结果id'
        primary key,
    question_id int         null comment '题目id',
    my_op       varchar(10) null comment '我的选项',
    exam_id     int         null comment '考试id',
    paper_id    int         null comment '试卷id',
    user_id     int         null comment '学生id',
    constraint exam
        foreign key (exam_id) references exam (exam_id)
            on update cascade on delete cascade
);

