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
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)


(add-to-list 'load-path "~/.opam/4.03.0/share/emacs/site-lisp")
(require 'ocp-indent)

(load "~/.opam/4.03.0/share/emacs/site-lisp/tuareg-site-file")

(defun caml/compile ()
  (interactive)
  (set-closest-makefile)
  (compile compile-command))

;; KEYS
(require 'tuareg)
(define-key tuareg-mode-map (kbd "C-c TAB") 'company-complete)
(define-key tuareg-mode-map (kbd "C-c SPC") 'helm-company)
(define-key tuareg-mode-map (kbd "C-S-c TAB") 'company-complete)
(define-key tuareg-mode-map (kbd "C-S-c SPC") 'helm-company)
(define-key merlin-mode-map (kbd "M-.") 'merlin-locate)
(define-key merlin-mode-map (kbd "C-c d") 'merlin-document)
(define-key merlin-mode-map (kbd "C-c t") 'merlin-type-enclosing)
(define-key merlin-mode-map (kbd "C-c s i") 'merlin-switch-to-mli)
(define-key merlin-mode-map (kbd "C-c s l") 'merlin-switch-to-ml)
(define-key merlin-mode-map (kbd "C-c C-c") 'caml/compile)


;; HOOK
(defun caml/hook ()
  (electric-pair-mode 1)
  (paredit-mode 1)
  (auto-complete 0)
  (company-mode 1)
  (rainbow-identifiers-mode 1)
  (rainbow-delimiters-mode 1))

(add-hook 'tuareg-mode-hook 'caml/hook t)
