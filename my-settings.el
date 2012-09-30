;; color theme
(color-theme-solarized-dark)

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
      ido-use-filename-at-point t
      ido-max-prospects 10

      dabbrev-case-replace nil ;; Make sure case is preserved
      scroll-margin 3
      scroll-conservatively 100
      c-basic-indent 2
      frame-title-format "emacs - %b"
      scroll-preserve-screen-position 1
      font-lock-maximum-decoration t
      inhibit-default-init t
      visible-bell nil
      shift-select-mode nil

      vc-follow-symlinks nil
      tramp-default-method "ssh"

      display-time-string-forms '((propertize
                                   (concat " " 24-hours ":" minutes " ")
                                   'face 'egoge-display-time))

      snippet-dir "~/.emacs.d/yasnippet/snippets/"
      custom-file "~/.emacs.d/custom.el"
      )


(setq-default fill-column 80 ;; how wide the screen should be before word wrapping
              indent-tabs-mode nil
              tab-width 2
              imenu-auto-rescan t)

;; Default minor modes
(auto-compression-mode t)
(display-time-mode t)
(global-font-lock-mode t)
(ido-mode t)
(recentf-mode t)
(savehist-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(winner-mode t)

(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(menu-bar-mode -1)

;; Functions
(fset 'yes-or-no-p 'y-or-n-p)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'my-settings)
