package wholeapp;

import adder.Adder;
import org.jooby.Jooby;
import wordcounter.WordCounter;

public class WholeApp extends Jooby {

  {
    path("/", () -> {
      use(new Adder());
      use(new WordCounter());
    });
  }

  public static void main(final String[] args) {
    run(WholeApp::new, args);
  }

}
