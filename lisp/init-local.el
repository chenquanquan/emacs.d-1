;; Local function
;; my-install-package
;; install my package
;;
(defun my-install-package ( )
  "Install all package of my plugin."
  (interactive)
  ;;(package-install 'color-theme-solarized)
  ;;(package-install 'xcscope)
  (package-install 'column-enforce-mode)
  (package-install 'highlight-parentheses)
  (package-install 'youdao-dictionary)
  ;;(package-install 'vs-svn)
  ;;(package-install 'jumplist)
  ;;(package-install 'neotree)
  (package-install 'pyim)
  ;;(package-install 'pyim-greatdict)
  )

;; Window custom
;;
(load-theme 'sanityinc-solarized-dark)
(global-linum-mode t)
(column-number-mode t)
(global-hl-line-mode t)
(blink-cursor-mode -1)
(setq confirm-kill-emacs 'y-or-n-p)

(setq scroll-margin 3
      scroll-conservatively 10000)
;;
;; column-enforce-mode
;;
(global-column-enforce-mode t)

;;
;; highlight-parenthess
;;
(require 'highlight-parentheses)
(global-highlight-parentheses-mode)

;;
;; Pyim
;;
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
(setq pyim-page-tooltip 'popup)
(setq pyim-page-length 5)
;;(add-hook 'emacs-startup-hook
;;          #'(lambda () (pyim-restart-1 t)))
(setq default-input-method "pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)

;;
;; pyim-greatdict
;;
;;(require 'pyim-greatdict)
;;(pyim-greatdict-enable)

;; rtags
(add-to-list 'load-path "/usr/share/emacs/site-lisp/rtags")

(require 'rtags)
(require 'company)


(defun tags-find-symbol-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-tag)))
(defun tags-find-references-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-rtag)))
(defun tags-find-symbol ()
  (interactive)
  (call-interactively 'rtags-find-symbol))
(defun tags-find-references ()
  (interactive)
  (call-interactively 'rtags-find-references 'gtags-find-rtag))
(defun tags-find-file ()
  (interactive)
  (call-interactively 'rtags-find-file 'gtags-find-file))
(defun tags-imenu ()
  (interactive)
  (call-interactively 'rtags-imenu 'idomenu))
5
(define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function tags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function tags-imenu))

(define-key global-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key global-map (kbd "M-,") (function tags-find-references-at-point))
(define-key global-map (kbd "M-;") (function tags-find-file))
(define-key global-map (kbd "C-.") (function tags-find-symbol))
(define-key global-map (kbd "C-,") (function tags-find-references))
(define-key global-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key global-map (kbd "M-i") (function tags-imenu))

;; Code completion
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

(provide 'init-local)
