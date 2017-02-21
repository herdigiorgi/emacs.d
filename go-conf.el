; git config --global http.https://gopkg.in.followRedirects true
; go get -u golang.org/x/tools/cmd/goimports
; go get github.com/rogpeppe/godef
; go get -u golang.org/x/tools/cmd/godoc
; go get -u github.com/golang/lint/golint
; go get -u github.com/nsf/gocode

(defun go:add-load-path (path)
  (add-to-list 'load-path
               (file-name-as-directory
                (concat (file-name-as-directory
                         (or (getenv "GOPATH") "go/"))
                        (file-name-as-directory
                         path)))))

(defun go:configure-lint ()
  (flycheck-gometalinter-setup))

(defun go:lint-toggle ()
  (interactive)
  (setq flycheck-gometalinter-disable-all
        (not flycheck-gometalinter-disable-all)))

(defun go:configure-autocomplete ()
  (require 'go-autocomplete))

(defun go:one-time-configuration ()
  (remove-hook 'go-mode-hook 'go:one-time-configuration)
  (go-eldoc-setup)
  (go:configure-lint)
  (go:configure-autocomplete))

(defun go:enable-modes ()
  (auto-complete-mode 1)
  (eldoc-mode 1)
  (rainbow-delimiters-mode 1)
  (rainbow-identifiers-mode 1)
  (indent-guide-mode 1)
  (flycheck-mode 0)
  (electric-pair-mode 1))

(defun go:key (map func)
  (define-key go-mode-map (kbd map) func))

(defun go:keys ()
  (go:key "C-c TAB" 'auto-complete)
  (go:key "C-c SPC" 'ac-complete-with-helm)
  (go:key "M-." 'godef-jump)
  (go:key "C-c C-c" 'go:compile)
  (go:key "C-c e s" 'flycheck-list-errors)
  (go:key "C-c e t" 'go:lint-toggle)
  (go:key "C-c e c" 'flycheck-clear)
  (go:key "C-c d" 'godoc-at-point))

(defun go:compile ()
  (interactive)
  (setq compile-command "go build -v && go test -v")
  (compile compile-command))

(defun go:fmt ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save nil 'make-it-local))

(defun go:hook ()
  (go:fmt)
  (go:enable-modes)
  (go:keys))

(add-hook 'go-mode-hook 'go:one-time-configuration)
(add-hook 'go-mode-hook 'go:hook)
