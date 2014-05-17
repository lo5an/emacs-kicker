
;; allow erase-buffere command
(put 'erase-buffer 'disabled nil)


;; uniquify buffer names
(require 'uniquify) ; bundled with GNU emacs 23.2.1 or before. On in 24.4
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; emacs 24.4 style ⁖ cat.png<dirName


;; show matching pairs of parentheses and other characters
(show-paren-mode 1)


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; CUA Mode copy
(cua-mode)

;; normal undo as well as the emacs one
(global-set-key "\C-z" 'undo)

;; hilight selected region
(transient-mark-mode 1)


;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)




;; DRUPAL STUFF
;; extend the php-mode in Emacs to follow Drupal coding style
;; http://drupal.org/node/59868
(defun drupal-mode ()
  "Drupal php-mode."
  (interactive)
  (php-mode-improved)
  (message "Drupal mode activated.")
  (set 'tab-width 2)
  (set 'c-basic-offset 2)
  (set 'indent-tabs-mode nil)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
  ; More Drupal-specific customizations here
)
(defun setup-php-drupal ()
  ; Drupal
  (add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))
)
(setup-php-drupal)


; basic tab behavior 
;; stolen from http://www.jwz.org/doc/tabs-vs-spaces.html

(setq c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)
