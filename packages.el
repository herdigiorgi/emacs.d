(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq pkg:packages
      '(slime
	magit
        fuzzy
        auto-complete
	company
	helm-company
	ac-slime
	ac-helm
	fill-column-indicator

        color-theme-sanityinc-tomorrow
        monokai-theme
        dracula-theme
        neotree

	dash
	projectile
	helm
	helm-projectile
	paredit
	hideshow
        vimish-fold
	rainbow-delimiters
	rainbow-identifiers
	multiple-cursors
	indent-guide

	highlight-parentheses
	hl-sexp
	rainbow-blocks

        clojure-mode
	cider
        ac-cider
        cider-eval-sexp-fu
        clj-refactor
        
        yaml-mode
        flymake-jslint
        markdown-mode+
	web-mode
        js2-mode
        coffee-mode
        json
        flycheck
        
	sql
        sql-indent
        emacsql-psql

        highlight-chars
        nyan-mode))

(defun pkg:load-packages ()
  (package-initialize)
  (let ((pkgs (remove-if #'package-installed-p pkg:packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p pkgs)
	(package-install p)))))

(pkg:load-packages)
(helm-projectile-on)
