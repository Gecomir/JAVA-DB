import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class AddMinion {
    private static final String GET_TOWN_BY_NAME = "SELECT t.id FROM towns t WHERE t.name = ?";
    private static final String INSERT_TOWN = "INSERT INTO towns (name) VALUES (?)";
    private static final String TOWN_ADDED = "Town %s was added to the database.%n";
    private static final String MINION_ADDED = "Successfully added %s to be minion of %s.%n";
    private static final String VILLAIN_ADDED = "Villain %s was added to the database.%n";
    private static final String GET_VILLAIN_BY_NAME = "SELECT id FROM villains WHERE name = ? ";
    private static final String INSERT_INTO_VILLAINS = "INSERT INTO villains (name, evilness_factor) VALUES (?, 'evil')";
    private static final String INSERT_INTO_MINIONS = "INSERT INTO minions (name, age) VALUES (?, ?)";


    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);

        Connection connection = Utils.getConnection();

        String[] minionInfo = scanner.nextLine().split(" ");
        String minionName = minionInfo[1];
        int minionAge = Integer.parseInt(minionInfo[2]);
        String minionTown = minionInfo[3];

        String villainName = scanner.nextLine().split(" ")[1];

        PreparedStatement townStatement = connection.prepareStatement(GET_TOWN_BY_NAME);
        townStatement.setString(1, minionTown);
        ResultSet townSet = townStatement.executeQuery();

        if (!townSet.next()) {
            PreparedStatement insertTown = connection.prepareStatement(INSERT_TOWN);
            insertTown.setString(1, minionTown);
            insertTown.executeUpdate();
            System.out.printf(TOWN_ADDED, minionTown);
        }

        PreparedStatement villainStatement = connection.prepareStatement(GET_VILLAIN_BY_NAME);
        villainStatement.setString(1, villainName);
        ResultSet villainSet = villainStatement.executeQuery();

        if (!villainSet.next()) {
            PreparedStatement insertVillain = connection.prepareStatement(INSERT_INTO_VILLAINS);
            insertVillain.setString(1, villainName);
            insertVillain.executeUpdate();

            System.out.printf(VILLAIN_ADDED, villainName);
        }

        PreparedStatement minionStatement = connection.prepareStatement(INSERT_INTO_MINIONS);
        minionStatement.setString(1, minionName);
        minionStatement.setInt(2, minionAge);
        minionStatement.executeUpdate();

        System.out.printf(MINION_ADDED, minionName, villainName);

        connection.close();
    }
}