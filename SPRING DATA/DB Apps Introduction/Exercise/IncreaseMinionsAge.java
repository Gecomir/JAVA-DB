import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class IncreaseMinionsAge {
    private static final String UPDATE_MINIONS = "UPDATE minions SET age = age + 1, name = lower(name) WHERE id IN (%s)";
    private static final String SELECT_MINIONS_BY_ID = "SELECT name, age FROM minions ORDER BY id";

    public static void main(String[] args) throws SQLException {
        Connection connection = Utils.getConnection();

        Scanner scanner = new Scanner(System.in);

        List<String> minionsId = Arrays.stream(scanner.nextLine().split(" "))
                .collect(Collectors.toList());


        updateMinions(minionsId, connection);

        printMinions(connection);

        connection.close();
    }

    private static void printMinions(Connection connection) throws SQLException {
        PreparedStatement selectMinions = connection.prepareStatement(SELECT_MINIONS_BY_ID);
        ResultSet printMinions = selectMinions.executeQuery();

        while (printMinions.next()) {
            String name = printMinions.getString("name");
            int age = printMinions.getInt("age");

            System.out.println(name + " " + age);
        }
    }

    private static void updateMinions(List<String> minionsId, Connection connection) throws SQLException {
        String updateMinionsSQL = String.format(UPDATE_MINIONS,
                minionsId.stream()
                        .map(v -> "?")
                        .collect(Collectors.joining(", ")));

        PreparedStatement updateMinions = connection.prepareStatement(updateMinionsSQL);

        for (int i = 1; i <= minionsId.size(); i++) {
            updateMinions.setInt(i, Integer.parseInt(minionsId.get(i - 1)));
        }

        updateMinions.executeUpdate();
    }
}

