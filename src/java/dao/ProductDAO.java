/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import utils.DBConnection;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Product;

/**
 *
 * @author lttru
 */
public class ProductDAO {
   public static List<Product> getAll() throws ClassNotFoundException, SQLException{
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try(Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()){
            while(rs.next()){
                list.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),                    
                    rs.getString("image"),
                    rs.getDouble("price"))); 
            }
        }
        return list;
    } 
   public static List<Product> getByTag(String tag) throws ClassNotFoundException, SQLException {
    List<Product> list = new ArrayList<>();
    String sql = "SELECT * FROM products WHERE tag = ?";

    try (Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, tag);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("image"),
                rs.getDouble("price")
            );

            p.setTag(rs.getString("tag"));
            list.add(p);
        }
    }
    return list;
}
}
