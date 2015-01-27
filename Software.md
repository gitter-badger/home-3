## Tracking feelings

* [Optimism App](http://www.findingoptimism.com) -- Not good.
* [iMoodJournal iPhone/Android app](http://www.inexika.com/imood) -- _being evaluated by Srid_ (so far good)
* [Google Forms](http://quantifiedself.com/2009/05/diy-mobile-self-tracker/) -- _being evaluated by Srid_ (just starting)

### What Srid uses

Srid uses the [iMoodJournal iPhone app](http://www.inexika.com/imood) to record and track feelings, and it is helping him to *periodically* and consistently ask HAIETMOBA. However, when in *focus mode* (such as working on software), he finds himself not asking HAIETMOBA for extended periods of time, at the end of which he sometimes finds himself feeling less than good for (initially) vague reasons. To help resolve that, he has setup reminders for Emacs on Mac:

```
;; Add this to ~/.emacs

;; (a . b) :: randomly wait from a -> a+b (minutes)
(setq actualism-interval '(1 . 10))
(defun actualism-delay-random ()
  (* 60 (+ (car actualism-interval)
           (cdr actualism-interval))))
(setq actualism-timer 
      (run-with-timer 
       0 nil 'actualism-check))
(defun actualism-check ()
  (shell-command "osascript -e 'display notification \"How are you feeling?\" with title \"Actualism\"'")
  (cancel-timer actualism-timer)
  (setq actualism-timer
        (run-with-timer (actualism-delay-random) nil 'actualism-check)))
```
