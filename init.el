;;; package --- Commentary
;;; Commentary:

;;; Code:
(setq inhibit-startup-message t)

;; Remove menus
;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; cancel auto-save and backups
;;
(setq auto-save-default nil)
(setq make-backup-files nil)

;;numero nas linhas
;;
(global-display-line-numbers-mode t)

;; Configurar a tecla Option (⌥) como Meta no macOS
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq ns-function-modifier 'hyper)  ;; Fn como Hyper


;; MELPA
;; Pacotes
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)


;; neotree
;;
;; Instalar e configurar neotree
(use-package neotree
  :ensure t
  :bind (("C-\\".  'neotree-toggle)))

;; Instalar e configurar all-the-icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; Instalar e configurar all-the-icons-dired para ícones no Dired
(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))

;;Dracula
;;
(package-refresh-contents)

(unless (package-installed-p 'dracula-theme)
  (package-refresh-contents)
  (package-install 'dracula-theme))

(load-theme 'dracula t)

;;Shortcuts
(global-set-key (kbd "C-<tab>") 'other-window)


;; Try
;;
(package-refresh-contents)

(use-package try
  :ensure t)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; Instalar e configurar lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((js-mode . lsp-deferred)
         (js2-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
         (typescript-mode . lsp-deferred))
  :custom
  (lsp-prefer-flymake nil))

;; Instalar e configurar company-mode para autocompletar
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Instalar e configurar lsp-ui para uma interface melhorada do LSP
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Instalar e configurar which-key para uma melhor experiência de uso
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Instalar e configurar flycheck para linting
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Instalar e configurar dap-mode para depuração
(use-package dap-mode
  :ensure t
  :config
  (dap-auto-configure-mode))
(provide 'init)
;;; init.el ends here



