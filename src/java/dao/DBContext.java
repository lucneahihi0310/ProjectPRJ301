package dao;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class DBContext {

    protected static Connection connection;

    public DBContext() {
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Project_PRJ";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);

        } catch (Exception ex) {
            System.err.println("Cannot connect database, " + ex);
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void main(String[] args) {
        DBContext d = new DBContext();
        System.out.println(d.connection);

    }
}
