create table question_paper
(
    id          int auto_increment comment '关系编号'
        primary key,
    question_id int null comment '试题编号',
    paper_id    int null comment '试卷编号'
)
    charset = utf8
    row_format = COMPACT;

