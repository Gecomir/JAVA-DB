import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayDeque;

public class PrintAllMinionNames {
    private static final String MINIONS_NAME = "SELECT name FROM minions";


    public static void main(String[] args) throws SQLException {

        Connection connection = Utils.getConnection();
        PreparedStatement selectMinions = connection.prepareStatement(MINIONS_NAME);
        ResultSet namesSet = selectMinions.executeQuery();

        ArrayDeque<String> names = new ArrayDeque<>();

        while (namesSet.next()) {
            names.offer(namesSet.getString("name"));
        }

        while (names.size() > 2) {
            System.out.println(names.pollFirst());
            System.out.println(names.pollLast());
        }

        while (!names.isEmpty()) {
            System.out.println(names.pop());
        }

        connection.close();
    }
}
