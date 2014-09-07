;; -------------------------------------
;; PACKAGES
;; -------------------------------------

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(flycheck magit yasnippet
		      go-mode markdown-mode json-mode yaml-mode)
  "Packages to ensure are installed upon launch.")
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load vendor & custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs directory")
(defvar vendor-dir (concat emacs-dir "vendor/")
  "Packages not yet available in ELPA")
(defvar module-dir (concat emacs-dir "modules/")
  "Configuration componants")

(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)

;; require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(add-hook 'after-init-hook #'global-flycheck-mode)
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(znc-servers (quote (("irc.cmacr.ae" 1025 t ((freenode "cmacrae" "DiDac7")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )