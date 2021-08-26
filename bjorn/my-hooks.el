(add-hook 'emacs-lisp-mode 'prettify-symbols-mode)

(add-hook 'prog-mode-hook 'subword-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (reftex-mode t)

            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)

            (set-pairs '("(" "{" "[" "\""))

            (local-set-key (kbd "M-s-<left>") 'org-promote-subtree)
            (local-set-key (kbd "M-s-<right>") 'org-demote-subtree)
            (local-set-key (kbd "C-M-e") 'org-forward-same-level)
            (local-set-key (kbd "C-M-a") 'org-backward-same-level)
            (local-set-key (kbd "C-c d") '(lambda () (interactive)
                                            (org-todo 'done)))
            (local-set-key (kbd "C-c s") '(lambda () (interactive)
                                            (org-todo "STARTED")))
            (local-set-key (kbd "C-c w") '(lambda () (interactive)
                                            (org-todo "WAITING")))

            (defun org-summary-todo (n-done n-not-done)
              "Switch entry to DONE when all subentries are done, to TODO otherwise."
              (let (org-log-done org-log-states)   ; turn off logging
                (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

            (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
            (auto-fill-mode 1)))

(add-hook 'sh-mode-hook
          '(lambda ()
             (set-pairs '("(" "{" "\"" "\'"))
             (setq sh-basic-offset 2)
             (local-set-key [return] 'reindent-then-newline-and-indent)
             (local-set-key "[" 'self-insert-command)
             ))

(require 'bookmark)

(defun my-ido-bookmark-jump ()
  "Jump to bookmark using ido"
  (interactive)
  (let ((dir (my-ido-get-bookmark-dir)))
    (when dir
      (find-alternate-file dir))))

(defun my-ido-get-bookmark-dir ()
  "Get the directory of a bookmark."
  (let* ((name (ido-completing-read "Use dir of bookmark: " (bookmark-all-names) nil t))
         (bmk (bookmark-get-bookmark name)))
    (when bmk
      (setq bookmark-alist (delete bmk bookmark-alist))
      (push bmk bookmark-alist)
      (let ((filename (bookmark-get-filename bmk)))
        (if (file-directory-p filename)
            filename
          (file-name-directory filename))))))

(defun my-ido-dired-mode-hook ()
  (define-key dired-mode-map "$" 'my-ido-bookmark-jump))

(add-hook 'dired-mode-hook 'my-ido-dired-mode-hook)
(defun my-ido-use-bookmark-dir ()
  "Get directory of bookmark"
  (interactive)
  (let* ((enable-recursive-minibuffers t)
         (dir (my-ido-get-bookmark-dir)))
    (when dir
      (ido-set-current-directory dir)
      (setq ido-exit 'refresh)
      (exit-minibuffer))))

(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-file-dir-completion-map (kbd "$") 'my-ido-use-bookmark-dir))

(add-hook 'ido-setup-hook 'ido-my-keys)

(provide 'my-hooks)
