package wordcounter;

import org.jooby.Jooby;

/**
 * @author jooby generator
 */
public class WordCounter extends Jooby {

  {
    post("/wordcounter/", (req, rsp) -> {
      rsp.type("text/plain");
      rsp.send(req.param("words").value().split(" ").length);

    });
  }

  public static void main(final String[] args) {
    run(WordCounter::new, args);
  }

}
