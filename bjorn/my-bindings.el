;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key "\C-ca" 'org-agenda)

(global-set-key (kbd "C-o") '(lambda ()
                               (interactive)
                               (open-line 1)
                               (next-line)
                               (indent-according-to-mode)
                               (previous-line)))

(global-set-key (kbd "M-o") 'other-window) ; was prefix

;; File finding
(global-set-key (kbd "C-x M-f")   'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f")     'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p")   'find-file-at-point)
(global-set-key (kbd "C-c y")     'bury-buffer)
(global-set-key (kbd "C-c r")     'revert-buffer)
(global-set-key (kbd "M-`")       'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b")   'ibuffer)
(global-set-key (kbd "C-x C-d")   'dired)

;; Use regex searches by default.
(global-set-key "\C-s"    'isearch-forward-regexp)
(global-set-key "\C-r"    'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(global-set-key "\M-%"     'query-replace-regexp)

(global-set-key "\C-xx"         'file-cache-ido-find-file)
(global-set-key "\M-`"          'ff-find-other-file)
(global-set-key "\C-c1"         'find-grep-dired)
(global-set-key "\C-c2"         'grep-find)
(global-set-key "\C-z"          'undo)
(global-set-key "\C-x\C-m"      'execute-extended-command)
(global-set-key "\C-c\C-m"      'execute-extended-command)

(global-set-key "\C-w"          'backward-kill-word)
(global-set-key (kbd "C-x w")   'backward-kill-sexp)
(global-set-key (kbd "M-SPC")   'delete-horizontal-space)

(global-set-key (kbd "M-\"")    'select-text-in-quote)
;;(global-set-key (kbd "M-2")     'extend-selection)
(global-set-key (kbd "M-2") 'er/expand-region)
(global-set-key (kbd "M-3") 'mark-whole-buffer)
(global-set-key (kbd "M-4") 'end-of-buffer)
(global-set-key (kbd "M-1") 'beginning-of-buffer)
(global-set-key "\C-x\C-k"      'kill-region)
(global-set-key "\C-c\C-k"      'kill-region)
(global-set-key "\C-j"          'newline)
(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-su)
(global-set-key [f5]            'bookmark-set)
(global-set-key [f6]            'bookmark-jump)
(global-set-key (kbd "TAB")     'indent-according-to-mode)
(global-set-key [backspace]     'delete-empty-pair)
(global-set-key (kbd "M-SPC")   'set-mark-command)
(global-set-key (kbd "C-x m")   'magit-status)

(global-set-key [(control shift k)] 'kill-whole-line)
(global-set-key [(control shift d)] 'duplicate-line)

(global-set-key (kbd "C-x gf") 'textmate-goto-file)
(global-set-key (kbd "M-g f") 'textmate-goto-file)
(global-set-key (kbd "C-x gs") 'textmate-goto-symbol)
;; (global-set-key (kbd "C-x ga") 'ack-in-project)

(provide 'my-bindings)
