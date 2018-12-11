;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :init (setq evil-want-C-u-scroll t)
  :config (evil-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :config (require 'lsp-clients))

(use-package company
  :ensure t
  :hook
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))
  
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode-hook . lsp-ui-mode))

(use-package ccls
  :ensure t
  :init
  (defvar ccls-extra-args)
  (setq ccls-extra-args '("--log-file=/tmp/ccls.log"))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (cl-pushnew #'company-lsp company-backends) (require 'ccls) (lsp))))

(use-package magit
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (solarized-theme flycheck lsp-ui ## evil-surround evil company-lsp ccls use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
