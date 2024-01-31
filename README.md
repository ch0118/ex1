# Exercise 1 (e1)

- Follow along in `basics.rkt`.

- When you want to test your code, do (on the *command line*):

```
python3 tester.py -av
```

In brief, this means three things:

- Run the `python3` interpreter on the `tester.py` script. 
- Our grading code starts at `tester.py`, and uses code in 
  the `test/` subdirectory.
  -> You can create new tests yourself by copying a test 
  directory and modifying the `test.rkt` and `answer` files.
- The `-av` options say to run *all* the tests in *verbose*
  mode. Verbose mode prints the output vs. expected output.

- IF YOU GET `racket` NOT FOUND: Ensure you went to your Dr. Racket's
  "Help" menu and set up Command-Line Racket tools.

- When you are ready to *SUBMIT* your code, you need to follow three
  steps:

- `git add .` -- Add everything (since the last time it was added) to
  the staging area (changes to be committed)

- `git commit -m "my changes"`. You should specify a helpful commit
  message, but we do not grade these at all.

- `git push` -- This will push your code to the Autograder's git
  server, where will be eilgable for grading.

- To actually *grade* your project, you'll need to use the
  Autograder's web interface. In this case, the Autograder simply uses
  the same tests as your local (public) tests. However, in real
  projects, there will also be secret tests--you won't have access to
  those.

- You get four tokens a day in the class, so you can submit and test
  to the autograder up to four times a day. If you need more tokens,
  you are invited to ask, let me know--I will reset them up to once a
  day near deadlines.

- So in projects, start early, and submit to see how you're doing on
  secret tests once in a while.

IF YOUR TESTS FAIL:

- This is not uncommon, especially in the first exercise. Please first
  contact the TAs. Doing this during class can be hectic, so if you
  can not talk to them, send them email or a message on Slack.

- Generally there are a variety of issues that can exist. Sometimes my
  infrastructure doesn't anticipate weird issues (spaces in
  filenames). In those cases where we come short, I apologize--we
  strive to help you resolve any issue.
