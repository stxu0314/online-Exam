create table paper
(
    paper_id   int auto_increment comment '试卷编号'
        primary key,
    paper_name varchar(255) null comment '试卷名字',
    score_sin  int          null comment '单选分数',
    score_che  int          null comment '多选分数',
    score_jug  int          null comment '判断分数'
)
    charset = utf8
    row_format = COMPACT;

