; go get -u golang.org/x/tools/cmd/goimports
; go get github.com/rogpeppe/godef
; go get -u golang.org/x/tools/cmd/godoc
; go get -u github.com/golang/lint/golint
; go get -u github.com/nsf/gocode

(add-to-list 'load-path
             (file-name-as-directory
              (concat (file-name-as-directory
                       (or (getenv "GOPATH") "go/"))
                      (file-name-as-directory
                       "src/github.com/golang/lint/misc/emacs"))))

(defun go:enable-modes ()
  (require 'go-autocomplete)
  (auto-complete-mode 1)
  (go-eldoc-setup) (eldoc-mode 1)
  (require 'golint)
  (rainbow-delimiters-mode 1)
  (rainbow-identifiers-mode 1)
  (indent-guide-mode 1))

(defun go:key (map func)
  (define-key go-mode-map (kbd map) func))

(defun go:keys ()
  (go:key "C-c TAB" 'auto-complete)
  (go:key "C-c SPC" 'ac-complete-with-helm)
  (go:key "M-." 'godef-jump)
  (go:key "C-c C-c" 'go:compile)
  (go:key "C-c C-l" 'go:lint)
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
  (go:keys)
  )

(add-hook 'go-mode-hook 'go:hook)
