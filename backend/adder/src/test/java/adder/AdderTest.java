package adder;

import static io.restassured.RestAssured.get;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertEquals;

import org.jooby.test.JoobyRule;
import org.jooby.test.MockRouter;
import org.junit.ClassRule;
import org.junit.Test;

/**
 * @author jooby generator
 */
public class AdderTest {

  /**
   * One app/server for all the test of this class. If you want to start/stop a new server per test,
   * remove the static modifier and replace the {@link ClassRule} annotation with {@link Rule}.
   */
  @ClassRule
  public static JoobyRule app = new JoobyRule(new Adder());

  @Test
  public void integrationTest() {
    given().
            formParam("a", "1").
            formParam("b", "1").
    post("/adder/")
        .then()
        .assertThat()
        .body(equalTo("2"))
        .statusCode(200)
        .contentType("text/plain;charset=ISO-8859-1");
  }

}
