(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(setq pkg:packages
      '(
        use-package

        slime
        magit
        fuzzy
        auto-complete
        company
        helm-company
        ac-slime
        ac-helm
        fill-column-indicator
        
        monokai-theme
        dracula-theme
        neotree
        rainbow-delimiters
        rainbow-identifiers
        highlight-symbol
        all-the-icons ;; then all-the-icons-install-fonts
        centered-window-mode
        default-text-scale
        
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


        ;;erlang
        erlang
        edts
        ivy-erlang-complete
        
        ;;elixir
        ruby-end
        alchemist
        flycheck-mix

        
        ;html
        web-mode
        tagedit
        
        yaml-mode
        flymake-jslint
        markdown-mode+
        
        json
        flycheck
        flycheck-popup-tip
        popup
        
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
