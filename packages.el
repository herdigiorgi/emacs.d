(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

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
        
        ;color-theme-sanityinc-tomorrow
        nyan-mode
        monokai-theme
        ;dracula-theme
        ;sublime-themes
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
        json
        flycheck
        
        sql
        sql-indent
        emacsql-psql

        highlight-chars
        yascroll
        

        js3-mode
        tern
        nodejs-repl

        smartparens
        
        alchemist
        flycheck-mix

        go-mode
        go-autocomplete
        go-eldoc
        
        ))

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
(require 'smartparens-config)
