(require 'package)
(dolist (i '(("marmalade" . "http://marmalade-repo.org/packages/")
	     ("elpa" . "http://tromey.com/elpa/")
	     ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives i t))

(setq pkg:packages
      '(slime
	magit
	auto-complete
	ac-slime
	column-marker
	solarized-theme
	monokai-theme
	projectile
	helm
	helm-projectile
	paredit
	hideshow
	rainbow-delimiters
	multiple-cursors
	indent-guide
	ensime))

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


