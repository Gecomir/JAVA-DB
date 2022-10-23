import java.sql.*;
import java.util.Scanner;

public class GetMinionNames {

    private static final String GET_NAME_AND_AGE_FROM_MINIONS =
            "SELECT name, age FROM minions AS m " +
                    " JOIN minions_villains AS mv ON mv.minion_id = m.id " +
                    " WHERE mv.villain_id = ?";
    private static final String GET_NAME_FROM_VILLAINS = "SELECT name FROM villains WHERE id = ?";
    private static final String NO_VILLAIN_WITH_ID = "No villain with ID %d exists in the database.%n";
    private static final String VILLAIN_NAME = "Villain: %s%n";
    private static final String MINIONS_INFO = "%d. %s %d%n";


    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        Connection connection = Utils.getConnection();

        int villainId = Integer.parseInt(scanner.nextLine());

        PreparedStatement villainStatement = connection.prepareStatement(GET_NAME_FROM_VILLAINS);
        villainStatement.setInt(1, villainId);

        ResultSet villainSet = villainStatement.executeQuery();

        if (!villainSet.next()) {
            System.out.printf(NO_VILLAIN_WITH_ID, villainId);
            connection.close();
            return;
        }

        String villainName = villainSet.getString("name");
        System.out.printf(VILLAIN_NAME, villainName);

        PreparedStatement minionStatement = connection.prepareStatement(GET_NAME_AND_AGE_FROM_MINIONS);
        minionStatement.setInt(1, villainId);

        ResultSet minionSet = minionStatement.executeQuery();

        for (int i = 1; minionSet.next(); i++) {
            String name = minionSet.getString("name");
            int age = minionSet.getInt("age");

            System.out.printf(MINIONS_INFO, i, name, age);
        }
        connection.close();
    }
}

