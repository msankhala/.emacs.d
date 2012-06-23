;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(fill-column 80 t)
;;  '(highlight ((((class color) (min-colors 88) (background dark)) (:background "#22222"))))
;;  '(js2-function-param-face ((t (:foreground "LightGoldenrod"))) t)
;;  '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)) t)
;;  '(show-paren-match ((nil (:background "#333399"))))
;;  '(show-paren-mismatch ((((class color)) (:background "red")))))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(blink-cursor-mode nil)
;;  '(column-number-mode t)
;;  '(fill-column 80)
;;  '(ido-use-filename-at-point nil)
;;  '(safe-local-variable-values (quote ((encoding . utf-8))))
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil))

; Set cursor color to white
(set-cursor-color "#ffffff")

;;enable global-linum-mode
(global-linum-mode 1)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;autoload php-mode for .php .module  and .inc file
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))

;;(add-to-list 'auto-mode-alist '("/drupal.*\.\(php\|module\|inc\|test\|install\)$" . php-mode))
(add-to-list 'auto-mode-alist '("/drupal.*\.info" . conf-windows-mode))

;; run php lint when press f8 key
;; php lint
(defun phplint-thisfile ()
(interactive)
(compile (format "php -l %s" (buffer-file-name))))
(add-hook 'php-mode-hook
'(lambda ()
(local-set-key [f8] 'phplint-thisfile)))
;; end of php lint

;;start emacs maximized --maximized or -mm arguments
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;;twittering-mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;;php-mode array better indentaion
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;;enable html-php mode for enabling html in php file when edition template files
(require 'html-php)

;; Quick documentation lookup

;; I didn’t see such a feature in the php-mode I use so I whipped up a quick solution. If you press F1 when standing on a symbol you can quickly look up its online documentation. Here it is:

;; (add-hook 'php-mode-hook 'my-php-mode-stuff)

;; (defun my-php-mode-stuff ()
;;   (local-set-key (kbd "<f1>") 'my-php-symbol-lookup))


;; (defun my-php-symbol-lookup ()
;;   (interactive)
;;   (let ((symbol (symbol-at-point)))
;;     (if (not symbol)
;;         (message "No symbol at point.")

;;       (browse-url (concat "http://php.net/manual-lookup.php?pattern="
;;                           (symbol-name symbol))))))
;; Quick documentation lookup with popup help

;; Here’s a variation of my quick documentation lookup above. It shows short help for the function under the cursor in the echo area if you press F1. It fetches the info from the official php site and it works for standard functions which documentation is properly tagged. You can press C-F1 for the same behavior as above if quick lookup failed or you want to read more about the function.

(add-hook 'php-mode-hook 'my-php-mode-stuff)

(defun my-php-mode-stuff ()
  (local-set-key (kbd "<f2>") 'my-php-function-lookup)
  (local-set-key (kbd "C-<f2>") 'my-php-symbol-lookup))


(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))


(defun my-php-function-lookup ()
  (interactive)
  (let* ((function (symbol-name (or (symbol-at-point)
                                    (error "No function at point."))))
         (buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
    (with-current-buffer buf
      (goto-char (point-min))
        (let (desc)
          (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
            (setq desc
              (replace-regexp-in-string
                " +" " "
                (replace-regexp-in-string
                  "\n" ""
                  (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))

            (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
              (setq desc
                    (concat desc "\n\n"
                            (replace-regexp-in-string
                             " +" " "
                             (replace-regexp-in-string
                              "\n" ""
                              (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

          (if desc
              (message desc)
            (message "Could not extract function info. Press C-F1 to go the description."))))
    (kill-buffer buf)))

  ;; Start Drupal IDE with `drupal-ide' command:
  (setq drupal-ide-load-path (concat user-emacs-directory "drupal/drupal-init.el"))
  (autoload 'drupal-ide drupal-ide-load-path "Start IDE for PHP & Drupal development" t)
