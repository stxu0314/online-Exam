package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.ClazzDao;
import vip.grmz.onlineexam.entity.Clazz;
import vip.grmz.onlineexam.utils.DataProcessUtils;
import vip.grmz.onlineexam.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-22 19:58
 * @description:
 */
public class ClazzDaoImpl implements ClazzDao {
    @Override
    public List<Clazz> findClasses() {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnection();
            String sql = "select c.*, count(u.username) as studentNum from clazz c LEFT JOIN user u on u.class_id = c.class_id and u.part = 0 GROUP BY u.class_id";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            List<Clazz> classes = new ArrayList<>();
            while (rs.next()) {
                Clazz clazz = new Clazz();
                clazz.setClass_id(rs.getInt("class_id"));
                clazz.setClass_name(rs.getString("class_name"));
                clazz.setCreate_time(rs.getTimestamp("create_time"));
                clazz.setStudentNum(rs.getString("studentNum"));
                classes.add(clazz);
            }
            return classes;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(conn, pst, rs);
        }
        return null;
    }

    @Override
    public boolean existClass(String className) {
        String sql = "select 1 from clazz where class_name = ?";
        return DataProcessUtils.getInstance(Clazz.class,sql,className) != null ? true : false ;
    }

    @Override
    public boolean addClazz(String userid, String className) {
        String sql = "insert into clazz values(null,?,?,now())";
        return DataProcessUtils.update(sql,className,userid) > 0 ? true : false;
    }

    @Override
    public boolean deleteClassById(int id) {
        String sql = "delete from clazz where class_id = ?";
        return DataProcessUtils.update(sql,id) > 0 ? true : false;
    }



}
