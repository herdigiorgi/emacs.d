(defun workspace:insert-greeting ()
  (insert
   "We generate fears while we sit. We overcome them by action.\n\n"

   "Security is mostly a superstition. Life is either a daring\n"
   "adventure or nothing.\n\n"

   "Whether you think you can or think you can’t, you’re right.\n\n"

   "You learn more from failure than from success. Don’t let it\n"
   "stop you. Failure builds character.\n\n"

   "It’s not whether you get knocked down, it’s whether you get up.\n\n"

   "People who are crazy enough to think they can change the world,\n"
   "are the ones who do.\n\n"

   "Entrepreneurs are great at dealing with uncertainty and also very\n"
   "good at minimizing risk. That’s the classic entrepreneur.\n\n"

   "Knowing is not enough; we must apply. Wishing is not enough;\n"
   "we must do.\n\n"

   "Imagine your life is perfect in every respect;\n"
   "what would it look like?\n\n"

   "The critical ingredient is getting off your butt and doing\n"
   "something. It's as simple as that. A lot of people have ideas,\n"
   "but there are few who decide to do something about them now.\n"
   "Not tomorrow. Not next week. But today.\n"
   "The true entrepreneur is a doer, not a dreamer.\n\n"))

(use-package perspeen
  :ensure t

  :config

  ;; overriding internal function - hack
  (defun perspeen-update-mode-string ()
  "Update `perspeen-modestring' when `perspeen-ws-list' is changed."
  (setq perspeen-modestring nil))

  ;; new emtpy buffer
  (defun new-empty-buffer ()
    "Create a new empty buffer.
     New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.
     It returns the buffer (for elisp programing)."
    (interactive)
    (let (($buf (generate-new-buffer "untitled")))
      (switch-to-buffer $buf)
      (funcall initial-major-mode)
      (setq buffer-offer-save t)
      $buf))

  ;; for shortcuts
  (defun goto-workspace-n (n) (perspeen-goto-ws n) (message "USG Ishimura %s" n))
  (defun goto-workspace-1 () (interactive) (goto-workspace-n 1))
  (defun goto-workspace-2 () (interactive) (goto-workspace-n 2))
  (defun goto-workspace-3 () (interactive) (goto-workspace-n 3))
  (defun goto-workspace-4 () (interactive) (goto-workspace-n 4))
  (defun goto-workspace-5 () (interactive) (goto-workspace-n 5))
  (defun goto-workspace-6 () (interactive) (goto-workspace-n 6))
  (defun goto-workspace-7 () (interactive) (goto-workspace-n 7))
  (defun goto-workspace-8 () (interactive) (goto-workspace-n 8))
  (defun goto-workspace-9 () (interactive) (goto-workspace-n 9))
  (defun goto-workspace-10 () (interactive) (goto-workspace-n 10))

  ;; configuration
  (setq perspeen-workspace-default-name "")
  (setq perspeen-modestring-dividers '("[" "]" ","))
  (perspeen-mode)
  (dotimes (_ 9 _)
    (perspeen-create-ws))
  (perspeen-goto-ws 1)
  (let ((new-buffer (new-empty-buffer)))
    (switch-to-buffer new-buffer)
    (text-mode)
    (workspace:insert-greeting)
    (set-buffer-modified-p nil)
    (setq buffer-read-only t)))
