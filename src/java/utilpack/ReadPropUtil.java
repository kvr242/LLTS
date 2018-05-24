/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilpack;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WIN8
 */
public class ReadPropUtil {
        public static String Home = "";
        public static String Login = "";
        public static String DataAdministratorLogin = "";
        public static String LandLordLogin = "";
        public static String TenantLogin = "";
        public static String Register = "";
        public static String DataAdministratorReg = "";
        public static String LandLordReg = "";
        public static String TenantReg = "";
        public static String Evaluate = "";
        public static String RateProperty = "";
        public static String RateLandLord = "";
        public static String RateTenant = "";
        public static String PostProperty = "";
        public static String Reports = "";
        public static String MyAccount = "";
        public static String UpdateDatabase = "";
        public static String PropertyDetails = "";
        public static String QueryRequest = "";
        public static String PropertyInformation = "";
        public static String RatingInformation = "";
        public static String Aboutus = "";
        public static String Contactus = "";
        public static String Logout = "";
	InputStream inputStream = null;
 
	public void getPropValues() {
 
		try {
			Properties prop = new Properties();
			String propFileName = "resource/resourceproperties.properties";
 
			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
 
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
 
			// get the property value and print it out
			Home = prop.getProperty("Home");
                        Login = prop.getProperty("Login");
                        DataAdministratorLogin = prop.getProperty("DataAdministratorLogin");
                        LandLordLogin = prop.getProperty("LandLordLogin");
                        TenantLogin = prop.getProperty("TenantLogin");
                        Register = prop.getProperty("Register");
                        DataAdministratorReg = prop.getProperty("DataAdministratorReg");
                        LandLordReg = prop.getProperty("LandLordReg");
                        TenantReg = prop.getProperty("TenantReg");
                        Evaluate = prop.getProperty("Evaluate");
                        RateProperty = prop.getProperty("RateProperty");
                        RateLandLord = prop.getProperty("RateLandLord");
                        RateTenant = prop.getProperty("RateTenant");
                        PostProperty = prop.getProperty("PostProperty");
                        Reports = prop.getProperty("Reports");
                        MyAccount = prop.getProperty("MyAccount");
                        UpdateDatabase = prop.getProperty("UpdateDatabase");
                        PropertyDetails = prop.getProperty("PropertyDetails");
                        QueryRequest = prop.getProperty("QueryRequest");
                        PropertyInformation = prop.getProperty("PropertyInformation");
                        RatingInformation = prop.getProperty("RatingInformation");
                        Aboutus = prop.getProperty("Aboutus");
                        Contactus = prop.getProperty("Contactus");
                        Logout = prop.getProperty("Logout");
 
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
                    try {
                        inputStream.close();
                    } catch (IOException ex) {
                        Logger.getLogger(ReadPropUtil.class.getName()).log(Level.SEVERE, null, ex);
                    }
		}
	}
}
