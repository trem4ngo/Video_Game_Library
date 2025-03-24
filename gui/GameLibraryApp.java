package gui;

import javax.swing.*;
import javax.awt.*;

public class GameLibraryApp extends JFrame{
    private CardLayout cardLayout;
    private JPanel mainPanel;

    public GameLibraryApp() {
        setTitle("Game Library App");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1366, 768);
        setLocationRelativeTo(null);

        mainPanel = new JPanel(cardLayout = new CardLayout());
        add(mainPanel);

        // User View Panels
        mainPanel.add(new SQLPanel(), "SQLPanel");
        mainPanel.add(new ViewPanel(), "ViewPanel");
        mainPanel.add(new UserLoginPanel(), "UserLoginPanel");
        mainPanel.add(new UserProfilePanel(), "UserProfilePanel");
        mainPanel.add(new UserWalletPanel(), "UserWalletPanel");
        mainPanel.add(new GameStorePanel(), "GameStorePanel");
        mainPanel.add(new GamePatchPanel(), "GamePatchPanel");
        mainPanel.add(new TransactionPanel(), "TransactionPanel");

        // Admin View Panels
        mainPanel.add(new UserListPanel(), "UserListPanel");
        mainPanel.add(new GameListPanel(), "GameListPanel");
        mainPanel.add(new PatchListPanel(), "PatchListPanel");
        mainPanel.add(new TransactionListPanel(), "TransactionListPanel");
        mainPanel.add(new ReviewListPanel(), "ReviewListPanel");

        // Report Panels
        mainPanel.add(new FinancialReportPanel(), "FinancialReportPanel");
        mainPanel.add(new GameRatingsReportPanel(), "GameRatingsReportPanel");
        mainPanel.add(new GamePatchReportPanel(), "GamePatchReportPanel");
        mainPanel.add(new GameTrendsReportPanel(), "GameTrendsReportPanel");

        // Set the initial panel
        cardLayout.show(mainPanel, "SQLPanel");
    }

    public void switchPanel(String panelName) {
        cardLayout.show(mainPanel, panelName);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(GameLibraryApp::new);
    }
}
