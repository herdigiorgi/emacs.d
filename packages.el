(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
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
        
        abyss-theme
        neotree
        rainbow-delimiters
        rainbow-identifiers
        highlight-symbol
        
        dash
        projectile
        helm
        helm-projectile
        paredit
        hideshow
        vimish-fold
        
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

        ;;elixir
        ruby-end
        alchemist
        ob-elixir
        flycheck-mix

        
        ;html
        web-mode
        tagedit
        
        yaml-mode
        flymake-jslint
        markdown-mode+
        
        json
        flycheck
        
        sql
        sql-indent
        emacsql-psql

        highlight-chars
        yascroll
        
        js3-mode
        tern

        smartparens))

(defun pkg:install-packages ()
  (package-initialize)
  (let ((pkgs (remove-if #'package-installed-p pkg:packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p pkgs)
        (package-install p)))))

(pkg:install-packages)
