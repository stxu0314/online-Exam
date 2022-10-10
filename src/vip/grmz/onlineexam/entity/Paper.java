package vip.grmz.onlineexam.entity;

import java.io.Serializable;

/**
 * (Paper)实体类
 *
 * @author makejava
 * @since 2022-09-25 19:50:27
 */
public class Paper implements Serializable {
    private static final long serialVersionUID = 471605336844904821L;
    /**
     * 试卷编号
     */
    private Integer paper_id;
    /**
     * 试卷名字
     */
    private String paper_name;
    /**
     * 单选分数
     */
    private Integer score_sin;
    /**
     * 多选分数
     */
    private Integer score_che;
    /**
     * 判断分数
     */
    private Integer score_jug;


    public Integer getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(Integer paper_id) {
        this.paper_id = paper_id;
    }

    public String getPaper_name() {
        return paper_name;
    }

    public void setPaper_name(String paper_name) {
        this.paper_name = paper_name;
    }

    public Integer getScore_sin() {
        return score_sin;
    }

    public void setScore_sin(Integer score_sin) {
        this.score_sin = score_sin;
    }

    public Integer getScore_che() {
        return score_che;
    }

    public void setScore_che(Integer score_che) {
        this.score_che = score_che;
    }

    public Integer getScore_jug() {
        return score_jug;
    }

    public void setScore_jug(Integer score_jug) {
        this.score_jug = score_jug;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Paper paper = (Paper) o;

        if (paper_id != null ? !paper_id.equals(paper.paper_id) : paper.paper_id != null) return false;
        if (paper_name != null ? !paper_name.equals(paper.paper_name) : paper.paper_name != null) return false;
        if (score_sin != null ? !score_sin.equals(paper.score_sin) : paper.score_sin != null) return false;
        if (score_che != null ? !score_che.equals(paper.score_che) : paper.score_che != null) return false;
        return score_jug != null ? score_jug.equals(paper.score_jug) : paper.score_jug == null;
    }

    @Override
    public int hashCode() {
        int result = paper_id != null ? paper_id.hashCode() : 0;
        result = 31 * result + (paper_name != null ? paper_name.hashCode() : 0);
        result = 31 * result + (score_sin != null ? score_sin.hashCode() : 0);
        result = 31 * result + (score_che != null ? score_che.hashCode() : 0);
        result = 31 * result + (score_jug != null ? score_jug.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "paper_id=" + paper_id +
                ", paper_name='" + paper_name + '\'' +
                ", score_sin=" + score_sin +
                ", score_che=" + score_che +
                ", score_jug=" + score_jug +
                '}';
    }
}

