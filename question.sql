create table question
(
    question_id      int auto_increment comment '题目编号'
        primary key,
    question_type    varchar(255)   null comment '题目类型x单选，y多选，z判断',
    question_course  int            null comment '是什么课程的问题python，java,c等',
    question_name    varchar(20000) null comment '题目问题',
    question_opa     varchar(255)   null comment '选项A',
    question_opb     varchar(255)   null comment '选项B',
    question_opc     varchar(255)   null comment '选项C',
    question_opd     varchar(255)   null comment '选项D',
    question_opright varchar(255)   null comment '正确选项',
    constraint course_name
        foreign key (question_course) references course (course_id)
)
    charset = utf8
    row_format = COMPACT;

