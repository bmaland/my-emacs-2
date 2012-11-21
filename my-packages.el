(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; make sure el-get is installed
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(setq el-get-sources
      '(
        (:name liquid-mode
               :type git
               :url "git://github.com/rehanift/Emacs-Liquid.git"
               :post-init (progn
                            (autoload 'liquid-mode "liquid" nil t)))
        ))

(setq my-packages
  '(
    anything
    color-theme-solarized
    liquid-mode
    magit
    org-mode
    rspec-mode
    rvm
    yasnippet
    ))

(el-get 'sync my-packages)
(provide' my-packages)
