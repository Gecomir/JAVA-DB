import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ChangeTownNamesCasing {
    private static final String UPDATE_TOWNS_NAME_BY_COUNTRY =
            "UPDATE towns SET `name` = UPPER(`name`)" +
                    " WHERE `country` = ?";
    private static final String SELECT_ALL_TOWNS = "SELECT name FROM towns WHERE `country` = ?";
    private static final String PRINT_COUNT_TOWN_UPDATE = "%d town names were affected.%n";


    public static void main(String[] args) throws SQLException {

        Connection connection = Utils.getConnection();

        Scanner scanner = new Scanner(System.in);

        String countyName = scanner.nextLine();

        PreparedStatement updateTownsName = connection.prepareStatement(UPDATE_TOWNS_NAME_BY_COUNTRY);
        updateTownsName.setString(1, countyName);

        int updateCount = updateTownsName.executeUpdate();

        if (updateCount == 0) {
            System.out.println("No town names were affected.");
            return;
        }

        System.out.printf(PRINT_COUNT_TOWN_UPDATE, updateCount);

        PreparedStatement selectTowns = connection.prepareStatement(SELECT_ALL_TOWNS);
        selectTowns.setString(1, countyName);
        ResultSet townsSet = selectTowns.executeQuery();

        List<String> towns = new ArrayList<>();

        while (townsSet.next()) {
            String townName = townsSet.getString("name");
            towns.add(townName);
        }

        System.out.println(towns);
        connection.close();
    }
}
