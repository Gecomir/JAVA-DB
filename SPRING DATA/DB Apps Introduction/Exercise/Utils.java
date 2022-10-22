import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Utils {
    public static Connection getConnection() throws SQLException {
        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "*****");

       return DriverManager.getConnection("jdbc:mysql://localhost:3306/minions_db", properties);
    }
}
