import java.sql.*;
import java.util.Scanner;

public class IncreaseAgeStoredProcedure {
    private static final String CALL_PROCEDURE = "CALL usp_get_older(?)";
    private static final String MINIONS_INFO = "SELECT name, age FROM minions WHERE id = ?";
    private static final String PRINT_MINION = "%s %d%n";

    public static void main(String[] args) throws SQLException {

        Scanner scanner = new Scanner(System.in);

        int minionId = Integer.parseInt(scanner.nextLine());
        Connection connection = Utils.getConnection();

        CallableStatement callableStatement = connection.prepareCall(CALL_PROCEDURE);
        callableStatement.setInt(1, minionId);
        callableStatement.executeUpdate();

        try {
            PreparedStatement minionInfo = connection.prepareStatement(MINIONS_INFO);
            ResultSet minionSet = minionInfo.executeQuery();

            minionSet.next();
            String minionName = minionSet.getString("name");
            int minionAge = minionSet.getInt("age");

            System.out.printf(PRINT_MINION, minionName, minionAge);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        connection.close();
    }
}

/* IN SQL
CREATE PROCEDURE `usp_get_older`(minion_id INT)
BEGIN
UPDATE `minions`
SET `age` = `age` + 1
WHERE `id` = minion_id;
END */
