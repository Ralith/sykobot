(in-package :sykobot)

(export 'run-all-tests)

(def-suite sykobot-tests)
(defun run-all-tests ()
  (run! 'sykobot-tests))
(defmethod asdf:perform ((o asdf:test-op) (c (eql (asdf:find-system :sykobot-tests))))
  (format t "~&~%*******************~%~
                 ** Starting test **~%~
                 *******************~%")
  (run-all-tests)
  (format t "~&*****************************************~%~
               **            Tests finished           **~%~
               *****************************************~%~
               ** If there were any failures on your  **~%~
               ** platform, please report them to me: **~%~
               **  (sykopomp at sykosomatic dot org)  **~%~
               ** or just file a bugreport on github: **~%~
               ** github.com/sykopomp/sykobot/issues  **~%~
               *****************************************~%"))
