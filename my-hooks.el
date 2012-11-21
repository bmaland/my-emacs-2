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

(provide 'my-hooks)
