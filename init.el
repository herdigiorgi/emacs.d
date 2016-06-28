
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl)
(server-start)
(setq custom-file "~/.emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(defun load.d (name)(load (concat "~/.emacs.d/" name ".el")))
(load.d "global-keys")
(load.d "packages")
(load.d "theme")
(load.d "extras")
(load.d "auto-complete-conf")

(load.d "lisp")
(load.d "clojure-conf")
(load.d "hs-conf")
(load.d "fsharp-conf")
(load.d "web-conf")
(load.d "sql-conf")
