(require 'tomorrow-night-theme nil 'noerror)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(if (eq window-system 'w32)
    (setq default-directory (getenv "HOME")))

(unless (eq window-system 'w32)
  (progn
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:"
                           (getenv "HOME") "/dotfiles/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))))

;; osx specific
(if (or (eq window-system 'mac) (eq window-system 'ns))
    (progn
      (setq browse-url-browser-function 'browse-url-default-macosx-browser)

      (defun dired-open-mac ()
        (interactive)
        (let ((file-name (dired-get-file-for-visit)))
          (if (file-exists-p file-name)
              (call-process "/usr/bin/open" nil 0 nil file-name))))
      (add-hook 'dired-mode-hook
                '(lambda ()
                   (define-key dired-mode-map "o" 'dired-open-mac)))

      (setq mac-option-modifier 'none
            mac-command-modifier 'meta)))

;;;;;org-mode
;; Org-specific settings are kept in the root of my org-directory.
;; These has to be individually catered anyway so it doesnt really
;; make much sense to include them here.
(setq org-directory "~/org")
(when (file-exists-p (concat org-directory "/.settings.el"))
  (load (concat org-directory "/.settings.el")))

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        "~/.emacs.d/backups"))))

(setq inhibit-startup-message t ;; Remove splash screen
      initial-major-mode 'emacs-lisp-mode ;; Elisp as default for scratch

      calendar-date-style 'european

      ;; Flymake - only check syntax on save
      flymake-no-changes-timeout 9999
      flymake-start-syntax-check-on-newline nil
      flymake-start-syntax-check-on-find-file nil

      ido-ignore-buffers               ; ignore these guys
      '("\\` " "^\*Back" ".*Completion" "^\*Ido")

      ido-case-fold t                   ; be case insensitive
      ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10

      enable-recursive-minibuffers t

      dabbrev-case-replace nil ;; Make sure case is preserved
      scroll-margin 3
      scroll-conservatively 100
      c-basic-indent 2
      frame-title-format "emacs - %b"
      scroll-preserve-screen-position 1
      font-lock-maximum-decoration t
      inhibit-default-init t
      visible-bell t
      shift-select-mode nil

      vc-follow-symlinks nil
      tramp-default-method "ssh"

      display-time-string-forms '((propertize
                                   (concat " " 24-hours ":" minutes " ")))

      snippet-dir "~/.emacs.d/yasnippet/snippets/"
      custom-file "~/.emacs.d/custom.el"
      )


(setq-default fill-column 80 ;; how wide the screen should be before word wrapping
              indent-tabs-mode nil
              tab-width 2
              imenu-auto-rescan t)

(require 'uniquify)

(require 'cl)

;; Default minor modes
(minibuffer-depth-indicate-mode t)
(auto-compression-mode t)
(column-number-mode t)
(display-time-mode t)
(global-font-lock-mode t)
(ido-mode t)
(recentf-mode t)
(savehist-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(winner-mode t)
(global-hl-line-mode t)
(if (fboundp 'yas-global-mode)
    (yas-global-mode 1))

(require 'golden-ratio nil 'noerror)
(if (fboundp 'golden-ratio-mode) (golden-ratio-mode t))

(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(menu-bar-mode -1)

;; Functions
(fset 'yes-or-no-p 'y-or-n-p)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'my-settings)
