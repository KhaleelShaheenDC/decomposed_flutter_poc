package wordcounter;

import org.jooby.test.JoobyRule;
import org.junit.ClassRule;
import org.junit.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

public class WordCounterTest {

  /**
   * One app/server for all the test of this class. If you want to start/stop a new server per test,
   * remove the static modifier and replace the {@link ClassRule} annotation with {@link Rule}.
   */
  @ClassRule
  public static JoobyRule app = new JoobyRule(new WordCounter());

  @Test
  public void integrationTest() {

    given().
            formParam("words", "Mary had a little lamb").
    post("/wordcounter/")
        .then()
        .assertThat()
        .body(equalTo("5"))
        .statusCode(200)
        .contentType("text/plain;charset=ISO-8859-1");
  }

}
