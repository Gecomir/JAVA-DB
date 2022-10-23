import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class RemoveVillain {
    private static final String SELECT_VILLAIN_BY_ID = "SELECT name FROM villains WHERE id = ?";
    private static final String SELECT_ALL_VILLAINS_AND_MINIONS =
            "SELECT COUNT(DISTINCT minion_id) as m_count" +
                    " FROM minions_villains WHERE villain_id = ?";
    private static final String DELETE_MINION = "DELETE FROM minions_villains WHERE villain_id = ?";
    private static final String DELETE_VILLAIN = "DELETE FROM villains WHERE id = ?";
    private static final String PRINT_DELETE_VILLAIN = "%s was deleted%n";
    private static final String PRINT_NOT_FOUND_VILLAIN = "Not such villain was found";
    private static final String PRINT_DELETE_COUNT_MINIONS = "%d minions released%n";


    public static void main(String[] args) throws SQLException {
        Connection connection = Utils.getConnection();

        Scanner scanner = new Scanner(System.in);

        int villainId = Integer.parseInt(scanner.nextLine());

        PreparedStatement selectVillain = connection.prepareStatement(SELECT_VILLAIN_BY_ID);
        selectVillain.setInt(1, villainId);
        ResultSet villainSet = selectVillain.executeQuery();

        if (!villainSet.next()) {
            System.out.println(PRINT_NOT_FOUND_VILLAIN);
        }

        String villainName = villainSet.getString("name");

        PreparedStatement selectAllVillainMinions = connection.prepareStatement(SELECT_ALL_VILLAINS_AND_MINIONS);
        selectAllVillainMinions.setInt(1, villainId);
        ResultSet minionsCountSet = selectAllVillainMinions.executeQuery();
        minionsCountSet.next();

        int countMinionsDeleted = minionsCountSet.getInt("m_count");

        connection.setAutoCommit(false);

        try {
            PreparedStatement deleteMinionsVillains = connection.prepareStatement(DELETE_MINION);
            deleteMinionsVillains.setInt(1, villainId);
            deleteMinionsVillains.executeUpdate();

            PreparedStatement deleteVillain = connection.prepareStatement(DELETE_VILLAIN);
            deleteVillain.setInt(1, villainId);
            deleteVillain.executeUpdate();

            connection.commit();

            System.out.printf(PRINT_DELETE_VILLAIN, villainName);
            System.out.printf(PRINT_DELETE_COUNT_MINIONS, countMinionsDeleted);

        } catch (SQLException e) {
            e.printStackTrace();

            connection.rollback();
        }
        connection.close();
    }
}
