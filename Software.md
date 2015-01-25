## Tracking feelings

* [Optimism App](http://www.findingoptimism.com) -- Not good.
* [iMoodJournal iPhone/Android app](http://www.inexika.com/imood) -- _being evaluated by Srid_ (so far good)

### What Srid uses

Srid uses the [iMoodJournal iPhone app](http://www.inexika.com/imood) to record and track feelings, and it is helping him to *periodically* and consistently ask HAIETMOBA. However, when in *focus mode* (such as working on software), he find himself not asking HAIETMOBA for extended periods of time, at the end of which he finds himself feeling less than good. To help resolve that, he is going to setup periodic notifications on his computer. On a Mac, one can achieve this by running the following command in the Terminal:
`DELAY=60; while true; do osascript -e 'display notification "How are you feeling?" with title "Actualism"'; sleep $DELAY; done`

