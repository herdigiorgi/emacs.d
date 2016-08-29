;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)


(add-to-list 'load-path "~/.opam/4.03.0/share/emacs/site-lisp")
(require 'ocp-indent)

(load "~/.opam/4.03.0/share/emacs/site-lisp/tuareg-site-file")

;; KEYS
(require 'tuareg)
(define-key tuareg-mode-map (kbd "C-c TAB") 'auto-complete)

;; HOOK
(defun caml/hook ()
  (paredit-mode 1)
  (indent-guide-mode 1)
  (rainbow-identifiers-mode 1)
  (closest-makefile-hook)
  (rainbow-delimiters-mode 1)
  )

(add-hook 'tuareg-mode-hook 'caml/hook t)
