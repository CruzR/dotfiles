; Setup package archives.
; In addition to the standard ELPA repository, we use MELPA Stable.
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


; Ensure use-package is installed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

; Evil: Extensible vi layer for Emacs. (https://www.emacswiki.org/emacs/Evil)
 (use-package evil
   :ensure t)

; Magit: A git porcelain inside Emacs. (https://magit.vc)
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

; Org mode: Your life in plain text. (http://orgmode.org)
(use-package org
  :ensure t)

; AUCTeX: Sophisticated document creation. (https://gnu.org/software/auctex/)
(use-package tex
  :ensure auctex)

; CMake-Mode: Provides syntax highlighting and indentation for CMake.
(use-package cmake-mode
  :ensure t)

; PHP-Mode
(use-package php-mode
  :ensure t)

; Protobuf mode
(use-package protobuf-mode
  :ensure t)

; Markdown mode
(use-package markdown-mode
  :ensure t)

(add-hook 'text-mode-hook 'evil-local-mode)
(add-hook 'prog-mode-hook 'evil-local-mode)
(add-hook 'protobuf-mode-hook 'evil-local-mode)

; Prevent M-x customize from cluttering init.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
