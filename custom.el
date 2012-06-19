(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "White" :inverse-video nil :box nil :strike-t*hrough nil :overline nil :underline nil :slant normal :weight normal :width normal :height 105))))
 '(fill-column 80)
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#22222"))))
 '(js2-function-param-face ((t (:foreground "LightGoldenrod"))))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(show-paren-match ((nil (:background "#333399"))))
 '(show-paren-mismatch ((((class color)) (:background "red")))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fill-column 80)
 '(ido-use-filename-at-point nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

; Set cursor color to white
(set-cursor-color "#ffffff")

;;auto-complete.el providing auto complete popup for most of the snippets.
;;it doesn't depend upon yasnippet. yasnippet have less snippets.
;;Most of the auto complete is provided by this plugin.
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp//ac-dict")
(ac-config-default)

;;zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;;codepage.org paste region or whole buffer or fetch code from codepage.org
  (add-to-list 'load-path "PATH") ;; replace PATH with the path to codepad.el
  (autoload 'codepad-paste-region "codepad" "Paste region to codepad.org." t)
  (autoload 'codepad-paste-buffer "codepad" "Paste buffer to codepad.org." t)
  (autoload 'codepad-fetch-code "codepad" "Fetch code from codepad.org." t)

;;iy-go-to-char
(require 'iy-go-to-char)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
(global-set-key (kbd "C-c ;") 'iy-go-to-char-continue)
(global-set-key (kbd "C-c ,") 'iy-go-to-char-continue-backward)

;;highlight-indentation.el
  ;; (set-face-background 'highlight-indentation-face "#e3e3d3")
  ;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;;multi-select.el
(autoload 'multi-select-mode "multi-select" nil t)
(multi-select-mode t)

;;mark-multiple module having four following modules inline-string-rectangle,mark-more-like-this, mark-multipul,rename-sgml-tag
    (require 'inline-string-rectangle)
    (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

    (require 'mark-more-like-this)
    (global-set-key (kbd "C-<") 'mark-previous-like-this)
    (global-set-key (kbd "C->") 'mark-next-like-this)
    (global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
    (global-set-key (kbd "C-*") 'mark-all-like-this)

    ;; (require 'rename-sgml-tag)
    ;; (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)

    ;; (require 'js2-rename-var)
    ;; (define-key js2-mode-map (kbd "C-c C-r") 'js2-rename-var)