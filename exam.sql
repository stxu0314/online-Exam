create table exam
(
    exam_id    int auto_increment comment '考试安排编号'
        primary key,
    paper_id   int       null comment '对应试卷',
    exam_begin timestamp null comment '开始时间',
    exam_end   timestamp null comment ' 结束时间',
    class_id   int       null,
    constraint clazz_id
        foreign key (class_id) references clazz (class_id)
)
    charset = utf8
    row_format = COMPACT;

