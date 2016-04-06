(require 'package)
(dolist (i '(("marmalade" . "http://marmalade-repo.org/packages/")
	     ("elpa" . "http://tromey.com/elpa/")
	     ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives i t))

(setq pkg:packages
      '(slime
	magit
	auto-complete
	company
	helm-company
	ac-slime
	ac-helm
	fill-column-indicator

	solarized-theme
	monokai-theme
	calmer-forest-theme
	green-phosphor-theme
	
	projectile
	helm
	helm-projectile
	paredit
	hideshow
	rainbow-delimiters
	multiple-cursors
	indent-guide

	highlight-parentheses
	hl-sexp
	rainbow-blocks
	
	cider))

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


