package adder;

import org.jooby.Jooby;

/**
 * @author jooby generator
 */
public class Adder extends Jooby {

  {
    post("/adder/", (req, rsp) -> {
      rsp.type("text/plain");
      rsp.send(req.param("a").intValue() + req.param("b").intValue());
    });
  }

  public static void main(final String[] args) {
    run(Adder::new, args);
  }

}
