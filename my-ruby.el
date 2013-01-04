;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Telfile$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             (setq ruby-use-encoding-map nil)
             (set-pairs '("(" "{" "[" "\"" "\'" "|"))
             (local-set-key [return] 'reindent-then-newline-and-indent)
             (local-set-key (kbd "M-e") 'ruby-forward-sexp)
             (local-set-key (kbd "M-a") 'ruby-backward-sexp)
             (local-set-key (kbd "M-C-h") 'er/mark-ruby-block-up)
             ))

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(provide 'my-ruby)
