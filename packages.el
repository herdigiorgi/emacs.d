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
        origami
        hide-lines
        helm-ag
        fish-mode
        expand-region
        abyss-theme
        intellij-theme
        rainbow-delimiters
        rainbow-identifiers
        highlight-symbol
        all-the-icons ;; then all-the-icons-install-fonts
        default-text-scale
        fill-column-indicator

        perspeen
        dash
        projectile
        helm
        helm-projectile
        helm-swoop
        paredit
        hideshow
        vimish-fold
        smart-mode-line
        centered-window

        multiple-cursors
        indent-guide

        highlight-parentheses
        rainbow-blocks

        clojure-mode
        cider
        ac-cider
        cider-eval-sexp-fu
        clj-refactor

        ;; scala
        ensime
        scala-mode
        sbt-mode
        
        ;;erlang
        erlang
        ivy-erlang-complete
        flycheck-rebar3

        ;;elixir
        ruby-end
        alchemist
        flycheck-mix

        ;html
        web-mode
        tagedit

        ;;js
        js3-mode
        flymake-jslint

        yaml-mode
        flymake
        flymake-cursor
        markdown-mode+

        json
        flycheck
        flycheck-popup-tip
        popup

        sql
        sql-indent
        emacsql-psql

        yascroll

        tern

        dockerfile-mode

        smartparens

        fountain-mode
        olivetti
        popup-imenu
        imenu-list
        eval-sexp-fu

        ;; python
        elpy
        realgud
        pipenv

        ;;navigation
        neotree
        dired-rainbow
        dired-recent
        dired-sidebar
        dired-subtree
        ace-jump-mode
))

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

;; some requires
(require 'eval-sexp-fu)
