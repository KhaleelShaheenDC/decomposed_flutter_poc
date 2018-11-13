package wholeapp;

import org.jooby.test.JoobyRule;
import org.junit.ClassRule;
import org.junit.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

public class WholeAppTest {

    /**
     * One app/server for all the test of this class. If you want to start/stop a new server per test,
     * remove the static modifier and replace the {@link ClassRule} annotation with {@link Rule}.
     */
    @ClassRule
    public static JoobyRule app = new JoobyRule(new WholeApp());

    @Test
    public void integrationTest1() {

        given().
                formParam("words", "Mary had a little lamb").
        post("/wholeapp/wordcounter/")
                .then()
                .assertThat()
                .body(equalTo("5"))
                .statusCode(200)
                .contentType("text/plain;charset=ISO-8859-1");
    }

    @Test
    public void integrationTest2() {

        given().
                formParam("a", 1).
                formParam("b", 1).
        post("/wholeapp/adder/")
                .then()
                .assertThat()
                .body(equalTo("2"))
                .statusCode(200)
                .contentType("text/plain;charset=ISO-8859-1");
    }

}
