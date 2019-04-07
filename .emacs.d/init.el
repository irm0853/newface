(require 'package)
(add-to-list
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos")

(setq show-paren-delay 0)
(show-paren-mode t)

(setq show-paren-style 'expression)

(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "darkgreen")

(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map (kbd "C-x ?") 'help-command)

;;load_theme

(load-theme 'wombat t)

;;default_directory

(setq default-directory "~/py_checkio_solutions") 
(setq command-line-default-directory "~/py_checkio_solutions")

;;key

(global-set-key (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)

(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;indent

(setq python-indent-guess-indent-offset-verbose nil)

;;tojikakko

(electric-pair-mode 1)

;;google paste

(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

(require 'xclip)
(xclip-mode 1)
