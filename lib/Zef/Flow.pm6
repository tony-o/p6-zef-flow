use Zef;

class Zef::Flow does Tester does Messenger {
  method test($path, :@includes) {
    my $cwd  = $*CWD;
    my $result;

    chdir $path;
    require Flow::Plugins::Interface;
    $result = Flow::Plugins::Interface::EXPORT::DEFAULT::MAIN('test', 't');
    chdir $cwd;
    $result;
  }

  method test-matcher($path) { True; }

  method probe { state $probe = (try require Zef::Flow) !~~ Nil ?? True !! False; }
}
