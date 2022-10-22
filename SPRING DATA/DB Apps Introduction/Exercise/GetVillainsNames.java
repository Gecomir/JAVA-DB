import java.sql.*;

public class GetVillainsNames {
    private static final String GET_VILLAINS_NAMES = "SELECT v.`name` AS name, COUNT(distinct(mv.minion_id)) AS count_min " +
            " FROM minions_villains AS mv " +
            " JOIN villains AS v ON mv.villain_id = v.id " +
            " GROUP BY mv.villain_id " +
            " HAVING count_min > 15 " +
            " ORDER BY count_min DESC";
    public static void main(String[] args) throws SQLException {

        Connection connection = Utils.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement(GET_VILLAINS_NAMES);

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String name = resultSet.getString("name");
            int countMinions = resultSet.getInt("count_min");

            System.out.printf("%s %d%n", name, countMinions);
        }
        connection.close();
    }
}
