(package-initialize)
(require 'cl)
(server-start)
(setq custom-file "~/.emacs-custom.el")
(when (file-exists-p custom-file) (load custom-file))

(defun load.d (name)(load (concat "~/.emacs.d/" name ".el")))
(load.d "global-keys")
(load.d "packages")
(load.d "theme")
(load.d "extras")
(load.d "auto-complete-conf")

(load.d "lisp")
(load.d "elixir-conf")
;(load.d "clojure-conf")
(load.d "web-conf")
(load.d "sql-conf")
(load.d "js-conf")
(load.d "yaml-conf")
(load.d "html-conf")

