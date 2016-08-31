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
        highlight-80+

	cider
        ac-cider
        
	web-mode
        js2-mode
        coffee-mode
        json
        flycheck
        
	sql
        sql-indent
        emacsql-psql

        highlight-chars))

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
