package org.zerock.persistence;

import org.junit.Test;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test 
	public void testConnection() {
		
		try(Connection con = 
				DriverManager.getConnection(
						"jdbc:oracle:thin:@172.30.1.53:1521/XEPDB1", 
						"system",
						"tiger"
				)){
			log.info(con);
		} catch(Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
		
	}
	
	
}