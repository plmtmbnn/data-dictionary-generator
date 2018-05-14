package org.sia.driver;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author Polma E. Tambunan
 */
public class Sia extends Application
{

    @Override
    public void start(Stage primaryStage) throws Exception 
    {
        Parent parent =
                FXMLLoader.load(getClass().getResource("/org/sia/view/Utama.fxml"));
        Scene scene = new Scene(parent, 1000, 700);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
    
}
