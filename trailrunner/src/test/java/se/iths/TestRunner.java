package se.iths;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class TestRunner {
@Test
public void createNewRunner() {
    Runner runner = new Runner();
    
    
}



 @Test
public void newRound(){
    int expectedId = 1;
    Round round = new Round (expectedId);
    int actualId = round.getId();
    assertEquals(expectedId, actualId);

}




}
