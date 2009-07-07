(asdf:defsystem sykobot
  :version "0"
  :description "IRC bot for #sykosomatic"
  :licence "AGPL"
  :depends-on (cl-irc
               cl-ppcre
               bordeaux-threads
               drakma
               html-entities
               sheeple
               cl-store)
  :serial t
  :components 
  ((:module "src"
            :serial t
            :components
            ((:file "packages")
             (:module "utils"
                      :serial t
                      :components
                      ((:file "utils")
                       (:file "alref")))
             (:file "sykobot")
             (:file "listeners")
             (:module "commands"
                      :serial t
                      :components
                      ((:file "commands")
                       (:file "memos")
                       (:file "facts")
                       (:file "chant")
		       (:file "quotegrabs")))
             (:file "config")))))

(asdf:defsystem sykobot-tests
  :version "0"
  :description "Unit tests for sykobot"
  :licence "AGPL"
  :depends-on (:sykobot :fiveam)
  :serial t
  :components
  ((:module "tests"
            :serial t
            :components
            ((:file "sykobot")))))

(defmethod asdf:perform ((o asdf:test-op) (c (eql (asdf:find-system :sykobot))))
  (format t "~&~%*******************~%~
                 ** Loading tests **~%~
                 *******************~%")
  (asdf:oos 'asdf:load-op 'sykobot-tests)
  (asdf:oos 'asdf:test-op 'sykobot-tests))