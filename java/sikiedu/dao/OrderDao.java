package com.sikiedu.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sikiedu.model.Goods;
import com.sikiedu.model.Order;
import com.sikiedu.model.OrderItem;
import com.sikiedu.utils.DBUtil;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDao {

    public void insertOrder(Connection con, Order order) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "insert into `order`(total, amount, status, paytype, name, phone, address, user_id) values(?,?,?,?,?,?,?,?)";
        r.update(con, sql, order.getTotal(), order.getAmount(), order.getStatus(),
                order.getPaytype(), order.getName(), order.getPhone(),
                order.getAddress(), order.getUser().getId());
    }

    public int getLastInsertId(Connection con) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "select last_insert_id()";
        BigInteger bi = r.query(con, sql, new ScalarHandler<BigInteger>());
        return Integer.parseInt(bi.toString());
    }

    public void insertOrderItem(Connection con, OrderItem item) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "insert into orderitem(price, amount, goods_id, order_id) values(?,?,?,?)";
        r.update(con, sql, item.getPrice(), item.getAmount(), item.getGoods().getId(), item.getOrder().getId());
    }

    public List<Order> selectAll(int userid) throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = "select * from `order` where user_id=?";
        return r.query(sql, new BeanListHandler<Order>(Order.class), userid);
    }

    public List<OrderItem> selectAllItem(int orderid) throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = "select i.id, i.price, i.amount, g.name from orderitem i, goods g where order_id=? and i.goods_id=g.id";
        return r.query(sql, new BeanListHandler<OrderItem>(OrderItem.class), orderid);
    }

    public int getOrderCount(int status) throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = status == 0 ? "select count(*) from `order`" : "select count(*) from `order` where status=?";
        return r.query(sql, new ScalarHandler<Long>(), status).intValue();
    }

    public List<Order> selectOrderList(int status, int pageNo, int pageSize) throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = status == 0
                ? "select o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, u.username from `order` o, user u where o.user_id=u.id limit ?,?"
                : "select o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, u.username from `order` o, user u where o.user_id=u.id and o.status=? limit ?,?";
        return r.query(sql, new BeanListHandler<Order>(Order.class), (pageNo - 1) * pageSize, pageSize);
    }

    public void updateStatus(int id, int status) throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = "update `order` set status=? where id = ?";
        r.update(sql, status, id);
    }

    public void deleteOrder(Connection con, int id) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "delete from `order` where id = ?";
        r.update(con, sql, id);
    }

    public void deleteOrderItem(Connection con, int id) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "delete from orderitem where order_id=?";
        r.update(con, sql, id);
    }

    public void updateProductStock(Connection con, int goodsId, int amount) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "update goods set stock = stock - ? where id = ?";
        r.update(con, sql, amount, goodsId);
    }

    public int getTotalOrderListCount() throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = "SELECT COUNT(*) FROM order";
        Long count = r.query(sql, new ScalarHandler<Long>());
        return count.intValue();
    }


    public double getTotalSalesAmount() throws SQLException {
        QueryRunner r = new QueryRunner(DBUtil.getDataSource());
        String sql = "SELECT SUM(total) FROM `order` WHERE status = 4"; // Giả sử 4 là trạng thái 'Hoàn thành'
        Double total = r.query(sql, new ScalarHandler<Double>());
        return total != null ? total : 0.0;
    }

}
